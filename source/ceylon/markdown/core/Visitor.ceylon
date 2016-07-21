shared interface Visitor {
	shared formal void visitText(Text text);
	shared formal void visitParagraph(Paragraph paragraph);
	shared formal void visitBlockQuote(BlockQuote blockQuote);
	shared formal void visitDocument(Document document);
	shared formal void visitCode(Code code);
	shared formal void visitEmphasis(Emphasis emphasis);
	shared formal void visitFencedCode(FencedCode fencedCode);
	shared formal void visitHardBreak(HardBreak hardBreak);
	shared formal void visitHeading(Heading heading);
	shared formal void visitHtmlBlock(HtmlBlock htmlBlock);
	shared formal void visitImage(Image image);
	shared formal void visitIndentedCode(IndentedCode indentedCode);
	shared formal void visitLink(Link link);
	shared formal void visitOrderedList(OrderedList orderedList);
	shared formal void visitListItem(ListItem listItem);
	shared formal void visitSoftBreak(SoftBreak softBreak);
	shared formal void visitStrongEmphasis(StrongEmphasis strongEmphasis);
	shared formal void visitThematicBreak(ThematicBreak thematicBreak);
	shared formal void visitUnorderedList(UnorderedList unorderedList);
	shared formal void visitHtmlInline(HtmlInline htmlInline);
}
