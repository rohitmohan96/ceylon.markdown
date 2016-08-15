shared abstract class Node() {
	shared formal variable Node[] children;
	
	shared variable Node? parent = null;
	
	shared void appendChild(Node node) {
		children = children.withTrailing(node);
		node.parent = this;
	}
	
	shared void removeChild(Node node) => 
			children = [for (ele in children) ele != node then ele else null].coalesced.sequence();
	
	shared formal Type accept<Type>(Visitor<Type> visitor);
	
	string => treeToString(this);
}
