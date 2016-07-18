shared class UnorderedList(shared Character bulletChar) extends List() {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitUnorderedList(this);
	
}