shared class IndentedCode(String text) extends CodeBlock(text) {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitIndentedCode(this);
}