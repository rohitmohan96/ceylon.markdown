shared class Text(shared variable String text) extends Node() {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitText(this);
}
