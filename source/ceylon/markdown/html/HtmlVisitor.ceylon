import ceylon.html {
	Node,
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

shared class HtmlVisitor() satisfies Visitor<Node> {
	shared actual Node visitBlockQuote(BlockQuote blockQuote) => Blockquote {
		children = [for (child in blockQuote.children) if (is FlowCategory|String ch = child.accept(this)) ch];
	};
	
	shared actual Node visitCode(Code code) => HtmlCode {
		children = code.text.linesWithBreaks;
	};
	
	shared actual Node visitDocument(Document document) => Html {
		Head {
		},
		Body {
			children = [for (child in document.children) if (is FlowCategory|String ch = child.accept(this)) ch];
		}
	};
	
	shared actual Node visitEmphasis(Emphasis emphasis) => Em {
		children = [for (child in emphasis.children) if (is PhrasingCategory|String ch = child.accept(this)) ch];
	};
	
	shared actual Node visitFencedCode(FencedCode fencedCode) => Pre {
		HtmlCode {
			children = fencedCode.text.linesWithBreaks;
		}
	};
	
	shared actual Node visitHardBreak(HardBreak hardBreak) => Br();
	
	shared actual Node visitHeading(Heading heading) {
		value children = [for (child in heading.children) if (is PhrasingCategory|String ch = child.accept(this)) ch];
		
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
	
	shared actual Node visitHtmlBlock(HtmlBlock htmlBlock) => nothing;
	
	shared actual Node visitHtmlInline(HtmlInline htmlInline) => nothing;
	
	//TODO: get alt from child text or link
	shared actual Node visitImage(Image image) => Img {
		src = image.destination;
		title = if (image.title == "") then null else image.title;
	};
	
	shared actual Node visitIndentedCode(IndentedCode indentedCode) => Pre {
		HtmlCode {
			children = indentedCode.text.linesWithBreaks;
		}
	};
	
	shared actual Node visitLink(Link link) => A {
		href = link.destination;
		title = if (link.title == "") then null else link.title;
		children = [for (child in link.children) if (is FlowCategory|String ch = child.accept(this)) ch];
	};
	
	shared actual Node visitListItem(ListItem listItem) => Li {
		children = [for (child in listItem.children) if (is FlowCategory|String ch = child.accept(this)) ch];
	};
	
	//TODO: Fix tightness for lists
	shared actual Node visitOrderedList(OrderedList orderedList) => Ol {
		children = [for (child in orderedList.children) if (is Li|String ch = child.accept(this)) ch];
		
	};
	
	shared actual Node visitParagraph(Paragraph paragraph) => P {
		children = [for (child in paragraph.children) if (is PhrasingCategory|String ch = child.accept(this)) ch];
	};
	
	shared actual String visitSoftBreak(SoftBreak softBreak) => "\n";
	
	shared actual Node visitStrongEmphasis(StrongEmphasis strongEmphasis) => Strong {
		children = [for (child in strongEmphasis.children) if (is PhrasingCategory|String ch = child.accept(this)) ch];
	};
	
	shared actual String visitText(Text text) => text.text;
	
	shared actual Node visitThematicBreak(ThematicBreak thematicBreak) => Hr();
	
	shared actual Node visitUnorderedList(UnorderedList unorderedList) => Ul {
		children = [for (child in unorderedList.children) if (is Li|String ch = child.accept(this)) ch];
	};
}
