Document internalDoc = Document();

shared Document parse(String text) {
	value lines = text.split('\n'.equals);
	
	for (line in lines) {
		parseLine(line);
	}
	
	value document = inlineParser(internalDoc);
	
	return document;
}
