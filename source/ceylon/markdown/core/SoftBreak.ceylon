shared class SoftBreak() extends Node() {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitSoftBreak(this);
}