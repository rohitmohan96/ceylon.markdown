shared class OrderedList(shared Integer startsWith, shared Character delimeter) extends List() {
	shared actual variable Node[] children = [];
	
	shared actual void accept(Visitor visitor) => visitor.visitOrderedList(this);
}