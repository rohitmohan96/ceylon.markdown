"""
   This module consists of the AST classes and parser for Markdown.

   The Markdown parser is based on the [Commonmark spec][1] and [Commonmark parsing strategy][2].

   The `ceylon.markdown.html` and `ceylon.markdown.plaintext` modules contain
   [[Visitor]] implementations for generating HTML and plaintext from Markdown respectively.

   The [[parse]] method can be used to generate an AST.
       value tree = parse(markdownString);

   This AST can be operated upon using a visitor.

   Example,

       object visitor satisfies Visitor<String> { ... };

       tree.accept(visitor);

   [1]: http://spec.commonmark.org/0.26/
   [2]: http://spec.commonmark.org/0.26/#appendix-a-parsing-strategy
"""
by ("Rohit Mohan")
license ("https://www.apache.org/licenses/LICENSE-2.0.html")
suppressWarnings ("ceylonNamespace")
module ceylon.markdown.core "1.0.0" {
	import ceylon.regex "1.3.1";
	import ceylon.collection "1.3.1";
}
