Document internalDoc = Document();

shared Document parse(String text) {
	value lines = text.split { splitting = '\n'.equals; groupSeparators = false; };

	for (line in lines) {
		parseLine(line);
	}
	
	value document = inlineParser(internalDoc);
	
	return document;
}
