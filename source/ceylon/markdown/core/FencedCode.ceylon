shared class FencedCode(String text, shared Integer fenceLevel) extends CodeBlock(text) {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitFencedCode(this);
}