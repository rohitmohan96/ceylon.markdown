shared class Document() extends Block() {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitDocument(this);
}
