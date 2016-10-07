"""
   Abstract superclass of all AST nodes.
"""
shared abstract class Node() {
	"The child nodes of this node."
	shared formal variable Node[] children;
	
	"This node's parent"
	shared variable Node? parent = null;
	
	shared void appendChild(Node node) {
		children = children.withTrailing(node);
		node.parent = this;
	}
	
	shared void removeChild(Node node) => 
			children = [for (ele in children) if (ele != node) ele];
	
	shared formal Type accept<Type>(Visitor<Type> visitor);
	
	string => treeToString(this);
}
