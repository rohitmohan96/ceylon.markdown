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
	HtmlInline
}
shared class HtmlVisitor() satisfies Visitor {
	shared actual void visitBlockQuote(BlockQuote blockQuote) {}
	
	shared actual void visitCode(Code code) {}
	
	shared actual void visitDocument(Document document) {
		print("<body>");
		for(child in document.children) {
			child.accept(this);
		}
		print("</body>");
	}
	
	shared actual void visitEmphasis(Emphasis emphasis) {}
	
	shared actual void visitFencedCode(FencedCode fencedCode) {}
	
	shared actual void visitHardBreak(HardBreak hardBreak) {}
	
	shared actual void visitHeading(Heading heading) {}
	
	shared actual void visitHtmlBlock(HtmlBlock htmlBlock) {}
	
	shared actual void visitImage(Image image) {}
	
	shared actual void visitIndentedCode(IndentedCode indentedCode) {}
	
	shared actual void visitLink(Link link) {
		print("<a href=\"``link.destination``\" title=\"``link.title``\">");
		for(child in link.children) {
			child.accept(this);
		}
		print("</a>");
	}
	
	shared actual void visitListItem(ListItem listItem) {}
	
	shared actual void visitOrderedList(OrderedList orderedList) {}
	
	shared actual void visitParagraph(Paragraph paragraph) {
		print("<p>");
		for(child in paragraph.children) {
			child.accept(this);
		}
		print("</p>");
	}
	
	shared actual void visitSoftBreak(SoftBreak softBreak) {}
	
	shared actual void visitStrongEmphasis(StrongEmphasis strongEmphasis) {}
	
	shared actual void visitText(Text text) {
		print(text.text);
	}
	
	shared actual void visitThematicBreak(ThematicBreak thematicBreak) {}
	
	shared actual void visitUnorderedList(UnorderedList unorderedList) {}
	shared actual void visitHtmlInline(HtmlInline htmlInline) {}
	
	
}