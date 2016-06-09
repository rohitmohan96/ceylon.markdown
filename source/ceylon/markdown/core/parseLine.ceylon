import ceylon.regex {
	regex,
	Regex
}

Regex atxHeadingPattern = regex("^[#]{1,6} ");

Regex orderedListPattern = regex("^\\d+[.)](|\\s.*)$");

Regex setextHeadingPattern = regex("^(={3,}|-{3,})$");

Regex fencedCodeblockPattern = regex("^`{3,}(?!.*`)|^~{3,}(?!.*~)");

Regex closingCodeblockPattern = regex("^(?:\`{3,}|~{3,})(?= *$)");

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
	
	Block lineBlock;
	variable Node? lastBlock = parent.children.last;
	
	if (line.equals(""), !is List parent) {
		if (lastBlock is Paragraph) {
			parent.appendChild(Break());
		}
		
		return;
	}
	
	if (!lastBlock is Code) {
		line = trimSpaces(line); //trim first 3 spaces in the beginning
	}
	
	if (is FencedCode block = lastBlock, closingCodeblockPattern.test(line), block.fenceLevel >= line.count('\`'.equals)) {
		parent.appendChild(Break());
		return;
	}
	
	if (!lastBlock is FencedCode, fencedCodeblockPattern.test(line)) {
		lineBlock = FencedCode("", line.count(('\`'.equals)));
		line = "";
	} else if (is Paragraph block = lastBlock, setextHeadingPattern.test(line), is Text last = block.children.last) {
		
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
		
		line = regex("[.)]").split(line)[1] else "";
	} else if (!lastBlock is FencedCode,
		line.startsWith(" "),
		(line = line.trimLeading(' '.equals).trimTrailing(' '.equals)) != "") {
		
		lineBlock = IndentedCode(line);
		line = "";
		
	} else if (line.startsWith(">")) {
		lineBlock = BlockQuote();
		line = line[1...]; //trim the starting ">"
	} else if (line.startsWith("- ") || line.startsWith("* ") || line.startsWith("+ ")) {
		lineBlock = List("bullet", line.get(0) else ' ');
		line = line[2...]; //trim the starting "- "
	} else if (parent is List) {
		line = line.trimLeading(' '.equals).trimTrailing(' '.equals);
		lineBlock = ListItem();
		
		if (!line.equals("")) {
			Block p = Paragraph();
			p.appendChild(Text(line));
			lineBlock.appendChild(p);
		}
		
		line = "";
	} else if (is FencedCode block = lastBlock) {
		lineBlock = FencedCode(line, block.fenceLevel);
		
		line = "";
	} else {
		lineBlock = Paragraph();
		lineBlock.appendChild(Text(line));
		
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

Boolean sameType(Block b1, Block b2) => className(b1).equals(className(b2))
		&& sameListType(b1, b2);

//Check if lists have the same bullet character, if not lists, then return true
Boolean sameListType(Block b1, Block b2) =>
		if (is List b1, is List b2) then b1.bulletChar == b2.bulletChar else true;
