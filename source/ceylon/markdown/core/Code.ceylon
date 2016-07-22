shared class Code(shared variable String text) extends Node() {
	shared actual variable Node[] children = [];
	
	shared actual Type accept<Type>(Visitor<Type> visitor) => visitor.visitCode(this);
}