shared class ThematicBreak() extends Block() {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitThematicBreak(this);
}