shared class Heading(shared Integer level) extends Block() {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitHeading(this);
}
