import ceylon.html {
	HtmlNode=Node,
	A,
	Raw,
	FlowCategory,
	P,
	PhrasingCategory,
	Br,
	Body,
	Li,
	Hr,
	Ul,
	Html,
	Head,
	Em,
	Strong,
	Pre,
	HtmlCode=Code,
	H1,
	H2,
	H3,
	H4,
	H5,
	H6,
	Img,
	Ol,
	Blockquote,
	CharacterData
}
import ceylon.markdown.core {
	Visitor,
	BlockQuote,
	Code,
	Document,
	Emphasis,
	FencedCode,
	HardBreak,
	Heading,
	HtmlBlock,
	Image,
	IndentedCode,
	Link,
	List,
	ListItem,
	OrderedList,
	Paragraph,
	SoftBreak,
	StrongEmphasis,
	Text,
	ThematicBreak,
	UnorderedList,
	HtmlInline
}

// shared alias CharacterData => String|Raw|Comment|ProcessingInstruction;

"An implementation of the Markdown [[Visitor]] that converts Markdown to HTMl.
 This class can be used to generate both partial and complete HTML."
shared class HtmlVisitor()
		satisfies Visitor<HtmlNode|String|<HtmlNode&FlowCategory|CharacterData|String>[]> {
	
	"Render Markdown as a complete HTML document. This method returns an [[Html]] object.
	    
	         value html = HtmlVisitor().renderCompleteHtml(tree);"
	shared HtmlNode renderCompleteHtml(Document document) {
		return Html {
			Head { },
			Body {
				children = visitDocument(document);
			}
		};
	}
	
	"Render Markdown as a list of HTML elements. This method returns a sequence.
	    
	        value nodes = HtmlVisitor().renderPartialHtml(tree);"
	shared <HtmlNode&FlowCategory|CharacterData|String>[] renderPartialHtml(Document document) {
		return visitDocument(document);
	}
	
	shared actual HtmlNode visitBlockQuote(BlockQuote blockQuote) => Blockquote {
		children = [for (child in blockQuote.children)
				if (is CharacterData|FlowCategory|String ch = child.accept(this)) ch];
	};
	
	shared actual HtmlNode visitCode(Code code) => HtmlCode {
		children = code.text.linesWithBreaks;
	};
	
	shared actual <HtmlNode&FlowCategory|CharacterData|String>[] visitDocument(Document document) =>
		[for (child in document.children)
				if (is CharacterData|FlowCategory|String ch = child.accept(this)) ch];
	
	shared actual HtmlNode visitEmphasis(Emphasis emphasis) => Em {
		children = [for (child in emphasis.children)
				if (is CharacterData|PhrasingCategory|String ch = child.accept(this)) ch];
	};
	
	shared actual HtmlNode visitFencedCode(FencedCode fencedCode) => Pre {
		HtmlCode {
			children = fencedCode.text.linesWithBreaks;
		}
	};
	
	shared actual HtmlNode visitHardBreak(HardBreak hardBreak) => Br();
	
	shared actual HtmlNode visitHeading(Heading heading) {
		value children = [for (child in heading.children)
				if (is PhrasingCategory|CharacterData|String ch = child.accept(this)) ch];
		
		switch (level = heading.level)
		case (1) {
			return H1 { children = children; };
		}
		case (2) {
			return H2 { children = children; };
		}
		case (3) {
			return H3 { children = children; };
		}
		case (4) {
			return H4 { children = children; };
		}
		case (5) {
			return H5 { children = children; };
		}
		case (6) {
			return H6 { children = children; };
		}
		else {
			return H1 { children = children; };
		}
	}
	
	shared actual HtmlNode visitHtmlBlock(HtmlBlock htmlBlock) => Raw(htmlBlock.text);
	
	shared actual HtmlNode visitHtmlInline(HtmlInline htmlInline) => Raw(htmlInline.text);
	
	shared actual HtmlNode visitImage(Image image) {
		String text = getText(P {
				children = [for (child in image.children)
						if (is CharacterData|PhrasingCategory|String ch = child.accept(this)) ch];
			});
		
		return Img {
			src = image.destination;
			alt = if (text != "") then text else null;
			title = if (image.title == "") then null else image.title;
		};
	}
	
	String getText(HtmlNode node) {
		variable StringBuilder text = StringBuilder();
		for (child in node.children) {
			if (is String child) {
				text.append(child);
			} else if (is HtmlNode child) {
				text.append(getText(child));
			}
		}
		
		return text.string;
	}
	
	shared actual HtmlNode visitIndentedCode(IndentedCode indentedCode) => Pre {
		HtmlCode {
			children = indentedCode.text.linesWithBreaks;
		}
	};
	
	shared actual HtmlNode visitLink(Link link) => A {
		href = link.destination;
		title = if (link.title == "") then null else link.title;
		children = [for (child in link.children)
				if (is FlowCategory|String ch = child.accept(this)) ch];
	};
	
	shared actual HtmlNode visitListItem(ListItem listItem) {
		if (is List parent = listItem.parent, parent.tight) {
			variable <HtmlNode&FlowCategory|String>[] children = [];
			for (child in listItem.children) {
				value ch = child.accept(this);
				if (is P ch) {
					children = children.append([for (c in ch.children) if (is Em|Strong|A|Img|String c) c]);
				} else if (is FlowCategory|String ch) {
					children = children.append([ch]);
				}
			}
			
			return Li {
				children = children;
			};
		}
		
		return Li {
			children = [for (child in listItem.children)
					if (is FlowCategory|String ch = child.accept(this)) ch];
		};
	}
	
	shared actual HtmlNode visitOrderedList(OrderedList orderedList) => Ol {
		children = [for (child in orderedList.children)
				if (is Li|String ch = child.accept(this)) ch];
	};
	
	shared actual HtmlNode visitParagraph(Paragraph paragraph) => P {
		children = [for (child in paragraph.children)
				if (is PhrasingCategory|String ch = child.accept(this)) ch];
	};
	
	shared actual String visitSoftBreak(SoftBreak softBreak) => "\n";
	
	shared actual HtmlNode visitStrongEmphasis(StrongEmphasis strongEmphasis) => Strong {
		children = [for (child in strongEmphasis.children)
				if (is PhrasingCategory|String ch = child.accept(this)) ch];
	};
	
	shared actual String visitText(Text text) => text.text;
	
	shared actual HtmlNode visitThematicBreak(ThematicBreak thematicBreak) => Hr();
	
	shared actual HtmlNode visitUnorderedList(UnorderedList unorderedList) => Ul {
		children = [for (child in unorderedList.children)
				if (is CharacterData|Li|String ch = child.accept(this)) ch];
	};
}
