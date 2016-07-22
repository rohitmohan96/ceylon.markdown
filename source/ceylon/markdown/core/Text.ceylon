shared class Text(shared variable String text) extends Node() {
	shared actual variable Node[] children = [];
	
	shared actual String accept<Type>(Visitor<Type> visitor) => visitor.visitText(this);
}
