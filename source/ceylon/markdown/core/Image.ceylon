shared class Image(shared String destination, shared String title = "") extends Node() {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitImage(this);
}
