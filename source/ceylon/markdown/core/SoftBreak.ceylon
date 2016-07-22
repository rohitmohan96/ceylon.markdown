shared class SoftBreak() extends Node() {
	shared actual variable Node[] children = [];
	
	shared actual String accept<Type>(Visitor<Type> visitor) => visitor.visitSoftBreak(this);
}