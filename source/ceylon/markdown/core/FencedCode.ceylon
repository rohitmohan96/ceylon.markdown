shared class FencedCode(String text, shared Integer fenceLevel) extends CodeBlock(text) {
	shared actual variable Node[] children = [];
	
	shared actual Type accept<Type>(Visitor<Type> visitor) => visitor.visitFencedCode(this);
}