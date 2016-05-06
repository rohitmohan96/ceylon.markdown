Document document = Document();

void parseLine(String line) {
	
}

shared Document parse(String text) {
	value lines = text.split('\n'.equals);
	
	for(line in lines) {
		parseLine(line);
	}
	
	return document;
}