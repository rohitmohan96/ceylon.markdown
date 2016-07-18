shared class BlockQuote() extends Block() {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitBlockQuote(this);
}
