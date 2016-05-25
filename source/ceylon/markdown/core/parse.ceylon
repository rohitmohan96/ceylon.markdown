Document document = Document();

String trimSpaces(String line) {
	variable String string = line;
	
	for (i in 0..2) {
		if (line.startsWith(" ")) {
			string = line[i+1 ...];
		}
	}
	return string;
}

void parseLine(variable String line, Block parent = document) {
	variable Boolean noLastBlock = true;
	
	if (line.equals("")) {
		return;
	}
	
	Block lineBlock;
	variable Node? lastBlock = parent.children.last;
	
	line = trimSpaces(line); //trim first 3 spaces in the beginning
	
	if (line.startsWith("> ")) {
		lineBlock = BlockQuote();
		line = line[2...]; //trim the starting "> "
	} else if (line.startsWith("- ")) {
		lineBlock = List("bullet");
		line = line[2...]; //trim the starting "- "
	} else {
		line = line.trimLeading(' '.equals);
		line = line.trimTrailing(' '.equals);
		if (parent is List) {
			lineBlock = ListItem();
			Block p = Paragraph();
			p.appendChild(Text(line));
			lineBlock.appendChild(p);
		} else {
			lineBlock = Paragraph();
			lineBlock.appendChild(Text(line));
		}
		line = "";
	}
	
	/*
	       Check if block is already open
	       */
	while (is Block block = lastBlock) {
		if (sameType(block, lineBlock), !is ListItem block, !is Paragraph block) {
			parseLine(line, block);
			noLastBlock = false;
		} else if (is Paragraph block) {
			//for paragraph, append the text to previous paragraph node
			Node? text = block.children.last;
			Node? last = lineBlock.children.last;
			if (is Text text, is Text last) {
				text.text += " "+last.text;
				noLastBlock = false;
			}
		}
		
		lastBlock = block.children.last;
	}
	
	if (noLastBlock) {
		parent.appendChild(lineBlock);
		parseLine(line, lineBlock);
	}
}

Boolean sameType(Block b1, Block b2) => className(b1).equals(className(b2));

shared Document parse(String text) {
	value lines = text.split('\n'.equals);
	
	for (line in lines) {
		parseLine(line);
	}
	
	return document;
}
