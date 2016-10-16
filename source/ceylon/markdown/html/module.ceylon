"""
   This module can be used to generate HTML from Markdown input.

   Use the [[HtmlVisitor]] to generate HTML from Markdown.

   First, generate a Markdown AST using the `ceylon.markdown.core` module.

       value tree = parse(markdownString);

   where tree is a [[ceylon.markdown.core::Document]].

   This document can be used to generate partial or complete HTML.
   This module uses `ceylon.html` to generate HTML.

   To render Markdown as a complete HTML document use the `renderCompleteHtml` method.
   This method returns an [[ceylon.html::Html]] object.
       value html = renderCompleteHtml(tree);

   To render Markdown as a list of HTML elements use the `renderPartialHtml` method.
       value nodes = renderPartialHtml(tree);
"""
by ("Rohit Mohan")
license ("https://www.apache.org/licenses/LICENSE-2.0.html")
suppressWarnings("ceylonNamespace")
module ceylon.markdown.html "1.0.0" {
	shared import ceylon.markdown.core "1.0.0";
	shared import ceylon.html "1.3.1-SNAPSHOT";
}
