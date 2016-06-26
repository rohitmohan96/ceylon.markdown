import ceylon.regex {
	regex
}

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

variable Boolean blankLine = false;

void parseLine(variable String line, Block parent) {
	variable Boolean noLastBlock = true;
	
	Block lineBlock;
	variable Node? lastBlock = parent.children.last;
	
	if (line.equals(""), !is List parent) {
		if (is Paragraph|BlockQuote block = lastBlock) {
			block.closeBlock();
		}
		if (is HtmlBlock block = lastBlock) {
			if (block.type >= 5) {
				block.closeBlock();
			} else {
				block.text += "\n";
			}
		}
		if (is Code block = lastBlock, block.open) {
			block.text += "\n";
		}
		if(is List block = lastBlock, block.open) {
			if(!blankLine) {
				blankLine = true;
			} else {
				block.closeBlock();
				blankLine = false;
			}
		}
		
		return;
	}
	
	if (!lastBlock is FencedCode) {
		line = trimSpaces(line); //trim first 3 spaces in the beginning
	}
	 
	//close fenced code blocks
	if (is FencedCode block = lastBlock,
		closingCodeblockPattern.test(line),
		block.fenceLevel <= line.count('\`'.equals)) {
		block.closeBlock();
		
		return;
	}
	
	if (is HtmlBlock block = lastBlock, block.open) {
		line = line.trimLeading(' '.equals).trimTrailing(' '.equals);
	}
	
	//TODO Nested list item
	if (line.startsWith("<"), 
		if(is Paragraph pblock = lastBlock) then !pblock.open else true) {
		for (i in 0:7) {
			if (is HtmlBlock block = lastBlock,
				block.open, exists htmlTest = htmlBlockClose[i],
				htmlTest.test(line),
				block.type == i) {
				
				block.text += "\n"+line;
				block.closeBlock();
				return;
			} else if (exists htmlTest = htmlBlockOpen[i], htmlTest.test(line)) {
				lineBlock = HtmlBlock(line, i);
				break;
			}
		} else {
			lineBlock = Paragraph();
			lineBlock.appendChild(Text(line));
		}
		line = "";
	} else if (!lastBlock is FencedCode, fencedCodeblockPattern.test(line)) {
		lineBlock = FencedCode("", line.count(('\`'.equals)));
		line = "";
	} else if (is Paragraph block = lastBlock, block.open, setextHeadingPattern.test(line), is Text last = block.children.last) {
		
		lineBlock = Heading {
			text = last.text;
			level = if (line.startsWith("=")) then 1 else 2;
		};
		
		parent.children = [for (e in parent.children) e == block then lineBlock else e];
		
		return;
	} else if (thematicBreakPattern.test(line)) {
		lineBlock = ThematicBreak();
		
		lineBlock.closeBlock();
		
		line = "";
	} else if (exists find = atxHeadingPattern.find(line)) {
		variable String text = atxHeadingPattern.split(line)[1] else "";
		
		if (atxTrailingPattern.test(text)) {
			text = atxTrailingPattern.split(text)[0] else "";
		}
				
		lineBlock = Heading {
			text = text;
			level = find.matched.count('#'.equals);
		};
		
		line = "";
	} else if (orderedListPattern.test(line)) {
		
		lineBlock = OrderedList {
			 startsWith = parseInteger(regex("[.)]").split(line)[0] else "0") else 0;
			 delimeter = (regex("\\d").split(line)[1] else ".").get(0) else '.';
		};
		
		line = regex("[.)]").split(line)[1] else "";
	} else if (!lastBlock is FencedCode,
		if (is Paragraph block = lastBlock) then !block.open else true,
		line.startsWith(" "),
		(line.trimLeading(' '.equals).trimTrailing(' '.equals)) != "") {
		
		lineBlock = IndentedCode(line[1...]);
		line = "";
	} else if (line.startsWith(">")) {
		lineBlock = BlockQuote();
		line = line[1...]; //trim the starting ">"
	} else if (bulletListPattern.test(line)) {
		lineBlock = UnorderedList(line.get(0) else ' ');
		line = line[2...]; //trim the starting "- "
	} else if (is List parent) {
		line = line.trimLeading(' '.equals).trimTrailing(' '.equals);
		lineBlock = ListItem();
		
		if(blankLine) {
			parent.tight = false;
			blankLine = false;
		}
		
		if (!line.equals("")) {
			Block p = Paragraph();
			p.appendChild(Text(line));
			lineBlock.appendChild(p);
		}
		
		line = "";  
	} else if (is HtmlBlock block = lastBlock, block.open) {
		lineBlock = HtmlBlock(line, block.type);
		line = "";
	} else if (is FencedCode block = lastBlock, block.open) {
		lineBlock = FencedCode(line, block.fenceLevel);
		
		line = "";
	} else {
		lineBlock = Paragraph();
		lineBlock.appendChild(Text(line.trimLeading(' '.equals)));
		
		line = "";
	}
	
	//Check if block is already open
	while (is Block block = lastBlock, block.open) {
		if (sameType(block, lineBlock), !is ListItem|Paragraph|Code|Heading|HtmlBlock block) {
			parseLine(line, block);
			noLastBlock = false;
			break;
		} else if (is Paragraph block, is Paragraph lineBlock) {
			//for paragraph, append the text to previous paragraph node
			Node? text = block.children.last;
			Node? last = lineBlock.children.last;
			if (is Text text, is Text last) {
				text.text += "\n"+last.text; 
				noLastBlock = false;
			}
			break;
		} else if (is Code block, is Code lineBlock) {
			block.text += "\n"+lineBlock.text;
			noLastBlock = false;
			break;
		} else if (is HtmlBlock block, is HtmlBlock lineBlock) {
			block.text += "\n"+lineBlock.text;
			noLastBlock = false;
			break;
		}
		
		lastBlock = block.children.last;
	}
	
	if (noLastBlock) {
		parent.appendChild(lineBlock);
		
		parseLine(line, lineBlock);
	}
}

Boolean sameType(Block b1, Block b2) => className(b1).equals(className(b2))
		&& sameListType(b1, b2) && sameOrderedListType(b1, b2);

//Check if lists have the same bullet character, if not lists, then return true
Boolean sameListType(Block b1, Block b2) =>
	if (is UnorderedList b1, is UnorderedList b2) then b1.bulletChar == b2.bulletChar else true;

Boolean sameOrderedListType(Block b1, Block b2) =>
	if(is OrderedList b1, is OrderedList b2) then b1.delimeter == b2.delimeter else true;
