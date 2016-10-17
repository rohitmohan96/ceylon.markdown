import ceylon.language.meta {
	type
}

void treeToString(Node node, Anything(String) write, Integer level = 0) {
	String name = type(node).declaration.name;
	
	write("\t".repeat(level) + name);
	
	switch (node)
	case (is Text) {
		write(": \n" + "\t".repeat(level + 1) + "\"``node.text``\"" + "\n");
	}
	case (is CodeBlock) {
		write(": \n" + "\t".repeat(level + 1) + "\"``node.text``\"" + "\n");
	}
	case (is Code) {
		write(": \n" + "\t".repeat(level + 1) + "\"``node.text``\"" + "\n");
	}
	case (is Heading) {
		write(" (``node.level``): \n");
	}
	case (is HtmlBlock) {
		write(": \n" + "\t".repeat(level + 1) + "\"``node.text``\"" + "\n");
	}
	case (is HtmlInline) {
		write(": \n" + "\t".repeat(level + 1) + "\"``node.text``\"" + "\n");
	}
	case (is OrderedList) {
		write(" (start=``node.startsWith``, delimeter='``node.delimeter``', tight='``node.tight``'): \n");
	}
	case (is UnorderedList) {
		write(" (bulletChar='``node.bulletChar``', tight='``node.tight``'): \n");
	}
	case (is Link) {
		write(" (destination='``node.destination``', title='``node.title``'): \n");
	}
	case (is Image) {
		write(" (destination='``node.destination``', title='``node.title``'): \n");
	}
	else {
		write(": \n");
	}
	
	for (c in node.children) {
		treeToString(c, write, level + 1);
	}
}
