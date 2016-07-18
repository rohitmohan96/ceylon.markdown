shared class HtmlBlock(shared variable String text, shared Integer type) extends Block() {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitHtmlBlock(this);
}