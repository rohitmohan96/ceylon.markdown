import ceylon.html {
	Head,
	Body,
	Html,
	Meta
}
import ceylon.markdown.core {
	Document
}

"Render Markdown as a complete HTML document. This method returns an [[Html]] object
 using the `utf-8` charset.
        
     value html = renderCompleteHtml(tree);"
shared Html renderCompleteHtml(Document document) => Html {
	Head { 
		Meta { charset="utf-8"; }
	},
	Body {
		children = HtmlVisitor().visitDocument(document);
	}
};

"Render Markdown as a list of HTML elements. This method returns a sequence.
       
     value nodes = renderPartialHtml(tree);"
shared HtmlChildren[] renderPartialHtml(Document document)
		=> HtmlVisitor().visitDocument(document);
