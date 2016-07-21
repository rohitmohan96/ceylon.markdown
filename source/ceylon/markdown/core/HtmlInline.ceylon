shared class HtmlInline(shared String text) extends Node() {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitHtmlInline(this);
}