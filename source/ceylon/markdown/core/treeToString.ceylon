String treeToString(Node node, Integer level = 0) {
	String name = className(node)
		.split('.'.equals)
		.last
		.split(':'.equals)
		.last;
	
	variable String string = "\t".repeat(level) + name;
	
	if (is Text n = node) {
		string += ": \n" + "\t".repeat(level + 1) + "\"``n.text``\"" + "\n";
	} else if (is Code n = node) {
		string += ": \n" + "\t".repeat(level + 1) + "\"``n.text``\"" + "\n";
	} else if (is Heading n = node) {
		string += " (``n.level``): \n" + "\t".repeat(level + 1) + "\"``n.text``\"" + "\n";
	} else if (is HtmlBlock n = node) {
		string += ": \n" + "\t".repeat(level + 1) + "\"``n.text``\"" + "\n";
	} else if (is OrderedList n = node) {
		string += " (start=``n.startsWith``, delimeter='``n.delimeter``', tight='``n.tight``'): \n";
	} else if(is UnorderedList n = node) {
		string += " (bulletChar='``n.bulletChar``', tight='``n.tight``'): \n";
	} else {
		string += ": \n";
	}
	
	for (c in node.children) {
		string += treeToString(c, level + 1);
	}
	
	return string;
}
