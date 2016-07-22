import ceylon.markdown.core {
	parse
}

"Run the module `ceylon.markdown.html`."
shared void run() {
	value tree = parse("asddf `jhdasa
	                    sd` adsasd
	                    
	                    asdas");
	
	HtmlVisitor visitor = HtmlVisitor();
	value accept = tree.accept(visitor);
	
	print(accept);
}
