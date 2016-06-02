import ceylon.regex {
	regex,
	Regex
}

Document internalDoc = Document();

Regex atxHeadingPattern = regex("^[#]{1,6} ");

Regex orderedListPattern = regex("^\\d+[.)]");

Regex setextHeadingPattern = regex("^[=-]{3,}$");

String trimSpaces(String line) {
	variable Integer count = 0;
	
	//check for 3 spaces
	for (ch in line) {
		if (ch==' ' && count<3) {
			count++;
		} else {
			break;
		}
	}
	
	return line[count...];
}

void parseLine(variable String line, Block parent = internalDoc) {
	variable Boolean noLastBlock = true;
	
	if (line.equals("")) {
		return;
	}
	
	Block lineBlock;
	variable Node? lastBlock = parent.children.last;
	
	line = trimSpaces(line); //trim first 3 spaces in the beginning
	
	if (is Paragraph block = lastBlock, setextHeadingPattern.test(line), is Text last = block.children.last) {
		
		lineBlock = Heading {
			text = last.text;
			level = if (line.startsWith("===")) then 1 else 2;
		};
		
		parent.children = [for (e in parent.children) e == block then lineBlock else e];
		
		return;
	} else if (atxHeadingPattern.test(line)) {
		value text = atxHeadingPattern.split(line)[1] else "";
		
		lineBlock = Heading {
			text = text;
			level = (regex(" ").split(line)[0] else "").count('#'.equals);
		};
		
		line = "";
	} else if (orderedListPattern.test(line)) {
		
		lineBlock = List {
			type = "ordered";
			bulletChar = 'o';
			startsWith = parseInteger(regex("[.)]").split(line)[0] else "0"); //get list number
		};
		
		line = line[2...]; //trim the starting "- "
	} else if (line.startsWith(" ")) {
		line = line.trimLeading(' '.equals).trimTrailing(' '.equals);
		lineBlock = Code(line);
		line = "";
	} else if (line.startsWith("> ")) {
		lineBlock = BlockQuote();
		line = line[2...]; //trim the starting "> "
	} else if (line.startsWith("- ") || line.startsWith("* ") || line.startsWith("+ ")) {
		lineBlock = List("bullet", line.get(0) else ' ');
		line = line[2...]; //trim the starting "- "
	} else {
		line = line.trimLeading(' '.equals).trimTrailing(' '.equals);
		
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
	
	//Check if block is already open
	while (is Block block = lastBlock) {
		if (sameType(block, lineBlock), !is ListItem|Paragraph|Code|Heading block) {
			parseLine(line, block);
			noLastBlock = false;
		} else if (is Paragraph block, is Paragraph lineBlock) {
			//for paragraph, append the text to previous paragraph node
			Node? text = block.children.last;
			Node? last = lineBlock.children.last;
			if (is Text text, is Text last) {
				text.text += "\n"+last.text;
				noLastBlock = false;
			}
		} else if (is Code block, is Code lineBlock) {
			block.text += "\n"+lineBlock.text;
			noLastBlock = false;
		}
		
		lastBlock = block.children.last;
	}
	
	if (noLastBlock) {
		parent.appendChild(lineBlock);
		parseLine(line, lineBlock);
	}
}

Boolean sameType(Block b1, Block b2) => className(b1).equals(className(b2)) && sameListType(b1, b2);

//Check if lists have the same bullet character
Boolean sameListType(Block b1, Block b2) =>
	if (is List b1, is List b2) then b1.bulletChar == b2.bulletChar else true;

shared Document parse(String text) {
	value lines = text.split('\n'.equals);
	
	for (line in lines) {
		parseLine(line);
	}
	
	value document = inlineParser(internalDoc);
	
	return document;
}
