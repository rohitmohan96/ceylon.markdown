import ceylon.markdown.core {
	Visitor,
	BlockQuote,
	Code,
	Document,
	Emphasis,
	FencedCode,
	HardBreak,
	Heading,
	HtmlBlock,
	HtmlInline,
	Image,
	IndentedCode,
	Link,
	ListItem,
	OrderedList,
	Paragraph,
	SoftBreak,
	StrongEmphasis,
	Text,
	ThematicBreak,
	UnorderedList,
	Node
}
shared class PlainTextVisitor() satisfies Visitor<String> {
	shared actual String visitBlockQuote(BlockQuote blockQuote) => visitChildren(blockQuote) + "\n";
	
	shared actual String visitCode(Code code) => code.text;
	
	shared actual String visitDocument(Document document) => visitChildren(document);
	
	shared actual String visitEmphasis(Emphasis emphasis) => visitChildren(emphasis);
	
	shared actual String visitFencedCode(FencedCode fencedCode) => fencedCode.text;
	
	shared actual String visitHardBreak(HardBreak hardBreak) => "\n";
	
	shared actual String visitHeading(Heading heading) => visitChildren(heading);
	
	shared actual String visitHtmlBlock(HtmlBlock htmlBlock) => htmlBlock.text;
	
	shared actual String visitHtmlInline(HtmlInline htmlInline) => htmlInline.text;
	
	shared actual String visitImage(Image image) => visitChildren(image);
	
	shared actual String visitIndentedCode(IndentedCode indentedCode) => indentedCode.text;
	
	shared actual String visitLink(Link link) => visitChildren(link);
	
	shared actual String visitListItem(ListItem listItem) => visitChildren(listItem) + "\n";
	
	shared actual String visitOrderedList(OrderedList orderedList) => visitChildren(orderedList) + "\n";
	
	shared actual String visitParagraph(Paragraph paragraph) => visitChildren(paragraph);
	
	shared actual String visitSoftBreak(SoftBreak softBreak) => " ";
	
	shared actual String visitStrongEmphasis(StrongEmphasis strongEmphasis) => visitChildren(strongEmphasis);
	
	shared actual String visitText(Text text) => text.text;
	
	shared actual String visitThematicBreak(ThematicBreak thematicBreak) => "***";
	
	shared actual String visitUnorderedList(UnorderedList unorderedList) => visitChildren(unorderedList) + "\n";
	
	shared String visitChildren(Node node) {
		value builder = StringBuilder();

		variable Integer i = 0;
		for(child in node.children) {
			if(is OrderedList node) {
				builder.append((node.startsWith + i++).string + node.delimeter.string + " ");
			} else if(is UnorderedList node) {
				builder.append(node.bulletChar.string + " ");
			}
			builder.append(child.accept(this));
		}
		
		return builder.string;
	}
}