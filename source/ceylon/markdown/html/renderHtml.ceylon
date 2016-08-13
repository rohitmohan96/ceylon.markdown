import ceylon.html {
	Head,
	Body,
	HtmlNode=Node,
	Html,
	FlowCategory,
	CharacterData
}
import ceylon.markdown.core {
	Document
}
"Render Markdown as a complete HTML document. This method returns an [[Html]] object.
        
             value html = renderCompleteHtml(tree);"
shared HtmlNode renderCompleteHtml(Document document) {
	return Html {
		Head { },
		Body {
			children = HtmlVisitor().visitDocument(document);
		}
	};
}

"Render Markdown as a list of HTML elements. This method returns a sequence.
       
           value nodes = renderPartialHtml(tree);"
shared <HtmlNode&FlowCategory|CharacterData|String>[] renderPartialHtml(Document document)
		 => HtmlVisitor().visitDocument(document);