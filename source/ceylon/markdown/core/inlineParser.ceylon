import ceylon.regex {
	MatchResult
}
import ceylon.collection {
	HashMap
}

void parseReference(Node node) {
	
	String key;
	String destination;
	variable String title = "";
	
	if (is Text node) {
		variable String text = node.text;
		
		MatchResult? linkRef = linkReferencePattern.find(text);
		
		if (exists linkRef) {
			key = linkRef
				.matched
				.replaceFirst("[", "")
				.replaceLast("]:", "");
			
			text = text[linkRef.end...]
				.trimLeading('\n'.equals)
				.trimLeading(' '.equals);
		} else {
			return;
		}
		
		MatchResult? destBraces = linkDestinationBraces.find(text);
		
		MatchResult? dest = linkDestination.find(text);
		
		if (exists destBraces) {
			destination = destBraces
				.matched
				.replaceFirst("<", "")
				.replaceLast(">", "");
			
			text = text[destBraces.end...]
				.trimLeading('\n'.equals)
				.trimLeading(' '.equals);
		} else if (exists dest) {
			destination = dest.matched;
			
			text = text[dest.end...]
				.trimLeading('\n'.equals)
				.trimLeading(' '.equals);
		} else {
			return;
		}
		
		MatchResult? linkTitle = linkTitlePattern.find(text);
		
		if (exists linkTitle) {
			title = linkTitle.matched[1 .. linkTitle.end-2];
			
			text = text[linkTitle.end...]
				.trimLeading('\n'.equals)
				.trimLeading(' '.equals);
		}
		
		node.text = text;
		
		String normalizedLabel = normalizeReference(key);
		
		if (!referenceMap.defines(key)) {
			Link link = Link(destination, title);
			referenceMap.put(normalizedLabel, link);
		}
		
		return;
	}
	
	for (child in node.children) {
		parseReference(child);
		
		if (is Paragraph child, is Text c = child.children[0], c.text == "") {
			node.removeChild(child);
		}
	}
}

shared void parseInlines(Node node, Node parent) {
	variable Delimiter? lastDelimiter = null;
	
	if (is Text node) {
		String text = node.text;
		variable String str = "";
		variable Integer i = 0;
		
		while (i < text.size) {
			Character ch = text[i] else ' ';
			switch (ch)
			case ('\n') {
				parent.removeChild(node);
				parent.appendChild(Text(str.trimTrailing(' '.equals)));
				parent.appendChild(str.endsWith("  ") then HardBreak() else SoftBreak());
				str = "";
			}
			case ('\\') {
				parent.removeChild(node);
				print(true);
				if (str != "") {
					parent.appendChild(Text(str));
				}
				i++;
				if (exists next = text[i], next == '\n') {
					parent.appendChild(HardBreak());
				} else if (exists next = text[i], reEscapable.test(next.string)) {
					parent.appendChild(Text(next.string));
				} else {
					parent.appendChild(Text(ch.string));
				}
				
				str = "";
			}
			case ('`') {
				parent.removeChild(node);
				
				if (str != "") {
					parent.appendChild(Text(str));
				}
				
				variable Boolean noClosingTicks = true;
				
				value tick = ticksHere.find(text[i...]);
				
				if (exists tick) {
					String ticks = tick.matched;
					i += tick.end;
					Integer afterOpenTicks = i;
					
					for (matched in reTicks.findAll(text[i...])) {
						
						if (matched.matched == ticks) {
							parent.appendChild(
								Code {
									text = whitespace.replace {
										input = text[afterOpenTicks:matched.start].trimmed;
										replacement = " ";
									};
								});
							
							noClosingTicks = false;
							i += matched.end;
							break;
						}
					}
					
					if (noClosingTicks) {
						i = afterOpenTicks - 1;
						parent.appendChild(Text(ticks));
					}
					
					str = "";
				}
			}
			case ('*' | '_') {
				parent.removeChild(node);
				if (str != "") {
					parent.appendChild(Text(str));
				}
				
				value res = scanDelimiters(text, i, ch);
				
				Integer startIndex = i;
				Integer numDelims = res.count;
				i += numDelims-1;
				
				Text textNode = Text(text[startIndex..i]);
				parent.appendChild(textNode);
				
				if (exists last = lastDelimiter) {
					
					Delimiter delimiter = Delimiter {
						node = textNode;
						delimiterChar = ch;
						numOfDelimiters = numDelims;
						previous = last;
						next = null;
						canOpen = res.canOpen;
						canClose = res.canClose;
					};
					
					last.next = delimiter;
					lastDelimiter = delimiter;
				} else {
					
					lastDelimiter = Delimiter {
						node = textNode;
						delimiterChar = ch;
						numOfDelimiters = numDelims;
						previous = null;
						next = null;
						canOpen = res.canOpen;
						canClose = res.canClose;
					};
				}
				
				str = "";
			}
			case ('[') {
				parent.removeChild(node);
				if (str != "") {
					parent.appendChild(Text(str));
				}
				
				Text textNode = Text(ch.string);
				parent.appendChild(textNode);
				
				if (exists last = lastDelimiter) {
					
					Delimiter delimiter = Delimiter {
						node = textNode;
						delimiterChar = ch;
						numOfDelimiters = 1;
						previous = last;
						next = null;
					};
					
					last.next = delimiter;
					lastDelimiter = delimiter;
				} else {
					
					lastDelimiter = Delimiter {
						node = textNode;
						delimiterChar = ch;
						numOfDelimiters = 1;
						previous = null;
						next = null;
					};
				}
				
				str = "";
			}
			case ('!') {
				parent.removeChild(node);
				
				if (str != "") {
					parent.appendChild(Text(str));
				}
				
				if (exists next = text.get(i + 1), next == '[') {
					Text textNode = Text("![");
					parent.appendChild(textNode);
					i++; //skip next [
					if (exists last = lastDelimiter) {
						
						Delimiter delimiter = Delimiter {
							node = textNode;
							delimiterChar = ch;
							numOfDelimiters = last.numOfDelimiters + 1;
							previous = last;
							next = null;
						};
						
						last.next = delimiter;
						lastDelimiter = delimiter;
					} else {
						
						lastDelimiter = Delimiter {
							node = textNode;
							delimiterChar = ch;
							numOfDelimiters = 1;
							previous = null;
							next = null;
						};
					}
				} else {
					Text textNode = Text("!");
					parent.appendChild(textNode);
				}
				
				str = "";
			}
			case (']') {
				parent.removeChild(node);
				
				variable Delimiter? delimiter = lastDelimiter;
				
				while (exists del = delimiter) {
					if ((del.delimiterChar=='[' || del.delimiterChar=='!') && !del.active) {
						lastDelimiter = removeLastBracket(del, lastDelimiter);
						
						delimiter = null;
						
						break;
					} else if (del.delimiterChar == '[') {
						if (exists next = text.get(i + 1), next == '(') {
							Integer init = i;
							i++;
							variable String reference = text[i+1 ...];
							variable String destination = "";
							variable String title = "";
							
							MatchResult? destBraces = linkDestinationBraces.find(reference);
							
							MatchResult? dest = linkDestination.find(reference);
							
							if (exists destBraces) {
								destination = destBraces
									.matched
									.replaceFirst("<", "")
									.replaceLast(">", "");
								
								reference = reference[destBraces.end...];
								
								i += destBraces.end;
								
								if (exists spnl = spnl.find(reference)) {
									i += spnl.end;
									reference = reference[spnl.end...];
								}
							} else if (exists dest) {
								destination = dest.matched;
								
								reference = reference[dest.end...];
								i += dest.end;
								
								if (exists spnl = spnl.find(reference)) {
									i += spnl.end;
									reference = reference[spnl.end...];
								}
							}
							
							MatchResult? linkTitle = linkTitlePattern.find(reference);
							
							if (destination != "") {
								if (exists linkTitle) {
									title = linkTitle.matched[1 .. linkTitle.end-2];
									
									reference = reference[linkTitle.end...];
									i += linkTitle.end;
									
									if (exists spnl = spnl.find(reference)) {
										i += spnl.end;
										reference = reference[spnl.end...];
									}
								}
								
								if (reference.trimmed.startsWith(")")) {
									Link link = Link(destination, title);
									value firstIndexWhere = parent.children.firstIndexWhere((Node element) => element == del.node) else 0;
									link.children = parent.children[firstIndexWhere+1 ...];
									parent.children = parent.children[...firstIndexWhere];
									parent.appendChild(link);
									
									if (str != "") {
										link.appendChild(Text(whitespace.replace(str.trimmed, " ")));
									}
									
									variable Delimiter? prev = del;
									
									// set all previous [ to inactive to prevent nested links
									while (exists d = prev) {
										if (d.delimiterChar == '[') {
											d.active = false;
										}
										prev = d.previous;
									}
									
									parent.removeChild(del.node);
									lastDelimiter = removeLastBracket(del, lastDelimiter);
									
									i++;
								} else {
									if (str != "") {
										parent.appendChild(Text(str));
									}
									parent.appendChild(Text(ch.string));
									i = init;
								}
							} else {
								if (str != "") {
									parent.appendChild(Text(str));
								}
								parent.appendChild(Text(ch.string));
								i = init;
							}
						} else if (exists link = referenceMap.get(normalizeReference(str))) {
							parent.appendChild(link);
							link.appendChild(Text(whitespace.replace(str.trimmed, " ")));
							parent.removeChild(del.node);
							lastDelimiter = removeLastBracket(del, lastDelimiter);
							
							variable Delimiter? prev = del;
							
							// set all previous [ to inactive to prevent nested links
							while (exists d = prev) {
								if (d.delimiterChar == '[') {
									d.active = false;
								}
								prev = d.previous;
							}
						} else {
							delimiter = null;
						}
						
						break;
					} else if (del.delimiterChar == '!') {
						if (exists next = text.get(i + 1), next == '(') {
							//TODO: Cleanup repetition
							Integer init = i;
							i++;
							variable String reference = text[i+1 ...];
							variable String destination = "";
							variable String title = "";
							
							MatchResult? destBraces = linkDestinationBraces.find(reference);
							
							MatchResult? dest = linkDestination.find(reference);
							
							if (exists destBraces) {
								destination = destBraces
									.matched
									.replaceFirst("<", "")
									.replaceLast(">", "");
								
								reference = reference[destBraces.end...];
								
								i += destBraces.end;
								
								if (exists spnl = spnl.find(reference)) {
									i += spnl.end;
									reference = reference[spnl.end...];
								}
							} else if (exists dest) {
								destination = dest.matched;
								
								reference = reference[dest.end...];
								i += dest.end;
								
								if (exists spnl = spnl.find(reference)) {
									i += spnl.end;
									reference = reference[spnl.end...];
								}
							}
							
							MatchResult? linkTitle = linkTitlePattern.find(reference);
							
							if (destination != "") {
								if (exists linkTitle) {
									title = linkTitle.matched[1 .. linkTitle.end-2];
									
									reference = reference[linkTitle.end...];
									i += linkTitle.end;
									
									if (exists spnl = spnl.find(reference)) {
										i += spnl.end;
										reference = reference[spnl.end...];
									}
								}
								
								if (reference.trimmed.startsWith(")")) {
									Image link = Image(destination, title);
									value firstIndexWhere = parent.children.firstIndexWhere((Node element) => element == del.node) else 0;
									link.children = parent.children[firstIndexWhere+1 ...];
									parent.children = parent.children[...firstIndexWhere];
									parent.appendChild(link);
									
									if (str != "") {
										link.appendChild(Text(whitespace.replace(str.trimmed, " ")));
									}
									
									parent.removeChild(del.node);
									lastDelimiter = removeLastBracket(del, lastDelimiter);
									
									i++;
								} else {
									if (str != "") {
										parent.appendChild(Text(str));
									}
									parent.appendChild(Text(ch.string));
									i = init;
								}
							} else {
								if (str != "") {
									parent.appendChild(Text(str));
								}
								parent.appendChild(Text(ch.string));
								i = init;
							}
						} else if (exists link = referenceMap.get(normalizeReference(str))) {
							Image image = Image(link.destination, link.title);
							parent.appendChild(image);
							image.appendChild(Text(whitespace.replace(str.trimmed, " ")));
							parent.removeChild(del.node);
							lastDelimiter = removeLastBracket(del, lastDelimiter);
						} else {
							delimiter = null;
						}
						
						break;
					} else {
						delimiter = del.previous;
					}
				}
				
				// not a link or image
				if (!delimiter exists) {
					if (str != "") {
						parent.appendChild(Text(str));
					}
					
					parent.appendChild(Text(ch.string));
				}
				
				str = "";
			}
			case ('<') {
				parent.removeChild(node);
				if (str != "") {
					parent.appendChild(Text(str));
				}
				
				String destination;
				if (exists match = emailAutoLink.find(text[i...])) {
					destination = match.matched[1 .. match.end-2];
					
					Link link = Link("mailto:" + destination);
					link.appendChild(Text(destination));
					parent.appendChild(link);
					
					i += match.end-1;
				} else if (exists match = autoLink.find(text[i...])) {
					destination = match.matched[1 .. match.end-2];
					
					Link link = Link(destination);
					link.appendChild(Text(destination));
					parent.appendChild(link);
					
					i += match.end-1;
				} else if (exists match = reHtmlTag.find(text[i...])) {
					HtmlInline htmlInline = HtmlInline(match.matched);
					parent.appendChild(htmlInline);
					
					i += match.end-1;
				} else {
					parent.appendChild(Text(ch.string));
				}
				
				str = "";
			}
			else {
				str += ch.string;
			}
			
			i++;
		}
		
		if (str != text, str != "") {
			parent.appendChild(Text(str));
		}
	}
	
	for (child in node.children) {
		parseInlines(child, node);
	}
}

shared Document inlineParser(Document document) {
	parseReference(document);
	
	parseInlines(document, document);
	
	return document;
}

shared DelimiterRun scanDelimiters(String text, variable Integer index, Character delimiterChar) {
	variable Integer delimiterCount = 0;
	Integer startIndex = index;
	while (exists ch = text[index], ch == delimiterChar) {
		delimiterCount++;
		index++;
	}
	
	String before = startIndex == 0 then "\n" else text[startIndex-1 .. startIndex];
	Character charAfter = text[index + 1] else '\n';
	String after = charAfter.string;
	
	Boolean beforeIsPunctuation = punctuation.test(before);
	Boolean beforeIsWhitespace = unicodeWhitespaceChar.test(before);
	Boolean afterIsPunctuation = punctuation.test(after);
	Boolean afterIsWhitespace = unicodeWhitespaceChar.test(after);
	
	Boolean leftFlanking = !afterIsWhitespace && !(afterIsPunctuation && !beforeIsWhitespace && !beforeIsPunctuation);
	Boolean rightFlanking = !beforeIsWhitespace && !(beforeIsPunctuation && !afterIsWhitespace && !afterIsPunctuation);
	variable Boolean canOpen;
	variable Boolean canClose;
	if (delimiterChar == '_') {
		canOpen = leftFlanking && (!rightFlanking || beforeIsPunctuation);
		canClose = rightFlanking && (!leftFlanking || afterIsPunctuation);
	} else {
		canOpen = leftFlanking;
		canClose = rightFlanking;
	}
	
	// index = startIndex;
	
	return DelimiterRun(delimiterCount, canOpen, canClose);
}

shared void processEmphasis(Node parent, Delimiter? stackBottom, variable Delimiter? lastDelimiter) {
	variable Delimiter? currentPosition;
	if (exists stackBottom) {
		currentPosition = stackBottom.next;
	} else {
		variable Delimiter? del = null;
		while (exists delimiter = lastDelimiter) {
			del = delimiter;
			lastDelimiter = delimiter.previous;
		}
		currentPosition = del;
	}
	
	value openBottom = HashMap {
		'*'->stackBottom,
		'_'->stackBottom
	};
	
	while (exists cp = currentPosition) {
		currentPosition = cp.next;
	}
}

shared Delimiter? removeLastBracket(Delimiter del, variable Delimiter? lastDelimiter) {
	if (exists prev = del.previous, exists next = del.next) {
		prev.next = del.next;
		next.previous = prev;
	} else if (exists prev = del.previous) {
		prev.next = null;
	} else if (exists next = del.next) {
		next.previous = null;
	} else {
		lastDelimiter = null;
	}
	
	if (exists d = lastDelimiter, del == d) {
		lastDelimiter = d.previous;
	}
	
	return lastDelimiter;
}

shared String normalizeReference(String str) =>
	whitespace.replace(str.trimmed.lowercased, " ");
