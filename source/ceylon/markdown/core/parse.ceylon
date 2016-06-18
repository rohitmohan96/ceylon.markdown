import ceylon.collection {
	HashMap
}

late variable HashMap<String,Link> referenceMap;

shared Document parse(String text) {
	
	Document internalDoc = Document();
	referenceMap = HashMap<String,Link>();
	
	for (line in text.lines) {
		parseLine(line, internalDoc);
	}
	
	value document = inlineParser(internalDoc);
	
	return document;
}
