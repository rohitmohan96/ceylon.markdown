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
		} else if(exists dest) {
			destination = dest.matched;
			
			text = text[dest.end...]
					.trimLeading('\n'.equals)
					.trimLeading(' '.equals);
		} else {
			return;
		}
		
		MatchResult? linkTitle = linkTitlePattern.find(text);
		
		if(exists linkTitle) {
			title = linkTitle.matched;
			
			text = text[linkTitle.end...]
					.trimLeading('\n'.equals)
					.trimLeading(' '.equals);
		}
		
		node.text = text;
		
		referenceMap.put(key, Link(destination, title));
		
		return;
	}
	
	for (child in node.children) {
		parseReference(child);
	}
}

shared Document inlineParser(Document document) {
	parseReference(document);
	
	return document;
}
