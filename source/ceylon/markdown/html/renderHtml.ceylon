import ceylon.html {
	Head,
	Body,
	Html
}
import ceylon.markdown.core {
	Document
}

"Render Markdown as a complete HTML document. This method returns an [[Html]] object.
        
     value html = renderCompleteHtml(tree);"
shared Html renderCompleteHtml(Document document) => Html {
	Head { },
	Body {
		children = HtmlVisitor().visitDocument(document);
	}
};

"Render Markdown as a list of HTML elements. This method returns a sequence.
       
     value nodes = renderPartialHtml(tree);"
shared HtmlChildren[] renderPartialHtml(Document document)
		=> HtmlVisitor().visitDocument(document);
