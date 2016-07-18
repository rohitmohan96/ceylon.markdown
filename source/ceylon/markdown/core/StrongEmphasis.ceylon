shared class StrongEmphasis() extends Node() {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitStrongEmphasis(this);
}