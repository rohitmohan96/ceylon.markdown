String treeToString(Node node, Integer level = 0) {
	String name = className(node).split('.'.equals).last;
	
	variable String string = "  ".repeat(level) + name + ": \n";
	
	if(is Text n = node) {
		string += "  ".repeat(level + 1) + "\"``n.text``\"" + "\n";
	} else if(is Code n = node) {
		string += "  ".repeat(level + 1) + "\"``n.text``\"" + "\n";
	} if(is Heading n = node) {
		string += "  ".repeat(level + 1) + "\"``n.text``\"" + "\n";
	} if(is HtmlBlock n = node) {
		string += "  ".repeat(level + 1) + "\"``n.text``\"" + "\n";
	}
	for(c in node.children) {
		string += treeToString(c, level + 1);
	}
	
	return string;
}