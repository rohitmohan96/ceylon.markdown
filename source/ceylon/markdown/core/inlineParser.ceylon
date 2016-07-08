import ceylon.regex {
	MatchResult
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
		
		if (!referenceMap.defines(key)) {
			Link link = Link(destination, title);
			referenceMap.put(key, link);
		}
		
		return;
	}
	
	for (child in node.children) {
		parseReference(child);
	}
}

shared void parseInlines(Node node, Node parent) {
	variable Delimiter? lastDelimiter = null;
	
	if (is Text node) {
		String text = node.text;
		variable String str = "";
		variable Boolean tick = false;
		variable Boolean bang = false;
		
		for (i->ch in text.indexed) {
			switch (ch)
			case ('\n') {
				if (!tick) {
					parent.removeChild(node);
					parent.appendChild(Text(str.trimTrailing(' '.equals)));
					parent.appendChild(str.endsWith("  ") then HardBreak() else SoftBreak());
					str = "";
				} else {
					str = str.trimTrailing(' '.equals);
					str += " ";
				}
			}
			case ('\\') {
			}
			case ('*' | '_' | '[') {
				parent.removeChild(node);
				
				if (bang) {
					bang = false;
				} else {
					
					if (str != "") {
						parent.appendChild(Text(str));
					}
					
					Text textNode = Text(ch.string);
					parent.appendChild(textNode);
					
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
					
					str = "";
				}
			}
			case ('!') {
				parent.removeChild(node);
				
				if (str != "") {
					parent.appendChild(Text(str));
				}
				
				if (exists next = text.get(i + 1), next == '[') {
					Text textNode = Text("![");
					parent.appendChild(textNode);
					
					bang = true;
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
			case ('`') {
				parent.removeChild(node);
				
				if (!tick) {
					tick = true;
					if (str != "") {
						parent.appendChild(Text(str));
					}
					str = "`";
				} else {
					parent.appendChild(Code(str.trimmed.removeInitial("`")));
					str = "";
					tick = false;
				}
			}
			case(']') {
				parent.removeChild(node);
				
				variable Delimiter? delimiter = lastDelimiter;
				
				while(exists del = delimiter) {
					if((del.delimiterChar == '[' || del.delimiterChar == '!') && !del.isActive) {
						removeLastBracket(del, lastDelimiter);
						
						delimiter = null;
						
						break;
					} else if(del.delimiterChar == '[') {
						if (exists next = text.get(i + 1), next == '(') {
							
						} else if(exists link = referenceMap.get(str)) {
							parent.appendChild(link);
							parent.removeChild(del.node);
						} else {
							delimiter = null;
						}
						
						break;
					} else if(del.delimiterChar == '!') {
						break;
					} else {
						delimiter = del.previous;
					}
				}
				
				if(!delimiter exists) {
					if (str != "") {
						parent.appendChild(Text(str));
					}
					
					parent.appendChild(Text(ch.string));
				}
				
				str = "";
			}
			else {
				str += ch.string;
			}
		}
		
		if (str != text, str != "") {
			parent.appendChild(Text(str));
		} else if (tick) {
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

shared void removeLastBracket(Delimiter del, variable Delimiter? lastDelimiter) {
	if(exists prev = del.previous, exists next = del.next) {
		prev.next = del.next;
		next.previous = prev;
	} else if(exists prev = del.previous) {
		prev.next = null;
	} else if(exists next = del.next) {
		next.previous = null;
	} else {
		lastDelimiter = null;
	}
}
