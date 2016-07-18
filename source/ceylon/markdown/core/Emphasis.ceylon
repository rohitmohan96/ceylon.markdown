shared class Emphasis() extends Node() {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitEmphasis(this);
}