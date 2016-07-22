import ceylon.html {
	HtmlNode=Node,
	A,
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
	Blockquote
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

shared class HtmlVisitor(Boolean completeHtml = false)
		satisfies Visitor<HtmlNode|<HtmlNode&FlowCategory|String>[]> {
	
	shared actual HtmlNode visitBlockQuote(BlockQuote blockQuote) => Blockquote {
		children = [for (child in blockQuote.children)
				if (is FlowCategory|String ch = child.accept(this)) ch];
	};
	
	shared actual HtmlNode visitCode(Code code) => HtmlCode {
		children = code.text.linesWithBreaks;
	};
	
	shared actual HtmlNode|<HtmlNode&FlowCategory|String>[] visitDocument(Document document) {
		if (completeHtml) {
			return Html {
				Head {
				},
				Body {
					children = [for (child in document.children)
							if (is FlowCategory|String ch = child.accept(this)) ch];
				}
			}; } else {
			return [for (child in document.children)
					if (is FlowCategory|String ch = child.accept(this)) ch];
		}
	}
	
	shared actual HtmlNode visitEmphasis(Emphasis emphasis) => Em {
		children = [for (child in emphasis.children)
				if (is PhrasingCategory|String ch = child.accept(this)) ch];
	};
	
	shared actual HtmlNode visitFencedCode(FencedCode fencedCode) => Pre {
		HtmlCode {
			children = fencedCode.text.linesWithBreaks;
		}
	};
	
	shared actual HtmlNode visitHardBreak(HardBreak hardBreak) => Br();
	
	shared actual HtmlNode visitHeading(Heading heading) {
		value children = [for (child in heading.children)
				if (is PhrasingCategory|String ch = child.accept(this)) ch];
		
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
	
	shared actual HtmlNode visitHtmlBlock(HtmlBlock htmlBlock) => nothing;
	
	shared actual HtmlNode visitHtmlInline(HtmlInline htmlInline) => nothing;
	
	//TODO: get alt from child text or link
	shared actual HtmlNode visitImage(Image image) => Img {
		src = image.destination;
		title = if (image.title == "") then null else image.title;
	};
	
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
	
	shared actual HtmlNode visitListItem(ListItem listItem) => Li {
		children = [for (child in listItem.children)
				if (is FlowCategory|String ch = child.accept(this)) ch];
	};
	
	//TODO: Fix tightness for lists
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
				if (is Li|String ch = child.accept(this)) ch];
	};
}
