import ceylon.collection {
	HashMap
}

shared Document parse(String text) {
	
	Document internalDoc = Document();
	
	HashMap<String,Link> referenceMap = HashMap<String,Link>();
	
	for (line in text.lines) {
		parseLine(line, internalDoc);
	}
	
	value document = inlineParser(internalDoc);
	
	return document;
}
