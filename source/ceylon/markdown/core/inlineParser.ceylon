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
	
	if (is Text node) {
		String text = node.text;
		variable String str = "";
		String last = text.lines.last;
		for (i->ch in text.indexed) {
			switch (ch)
			case ('\n') {
				parent.removeChild(node);
				parent.appendChild(Text(str.trimTrailing(' '.equals)));
				parent.appendChild(str.endsWith("  ") then HardBreak() else SoftBreak());
				str = "";
			}
			case ('\\') {
			}
			case ('`') {
			}
			else {
				str += ch.string;
			}
		}
		
		if(last != text) {
			parent.appendChild(Text(last));
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
