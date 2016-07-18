import ceylon.markdown.core {
	parse
}
"Run the module `ceylon.markdown.html`."
shared void run() {
    value tree = parse("[hello](/url \"title\")");
    
    tree.accept(HtmlVisitor());
}