import ceylon.collection {
	HashMap
}
Document internalDoc = Document();

HashMap<String, Link> referenceMap = HashMap<String, Link>();

shared Document parse(String text) {
	for (line in text.lines) {
		parseLine(line);
	}
	
	value document = inlineParser(internalDoc);
	
	return document;
}
