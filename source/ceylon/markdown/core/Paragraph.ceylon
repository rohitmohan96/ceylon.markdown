shared class Paragraph() extends Block() {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitParagraph(this);
}
