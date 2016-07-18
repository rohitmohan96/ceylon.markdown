shared abstract class Node() {
	shared formal variable Node[] children;
	
	shared void appendChild(Node node) => children = children.withTrailing(node);
	
	shared void removeChild(Node node) => 
			children = [for (ele in children) ele != node then ele else null].coalesced.sequence();
	
	shared formal void accept(Visitor visitor);
	
	string => treeToString(this);
}
