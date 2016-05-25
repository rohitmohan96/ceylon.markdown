shared abstract class Node() {
	shared formal variable Node[] children;
	
	shared void appendChild(Node node) => children = children.withTrailing(node);
}
