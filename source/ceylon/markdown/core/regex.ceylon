import ceylon.regex {
	regex,
	Regex
}

String escapable = "[!\"#$%&\'()*+,./:;<=>?@\\[\\\\\\]^_`{|}~-]";

Regex whitespace = regex("[ \t\r\n]+", true);

String escapedChar = "\\\\" + escapable;

String regChar = "[^\\\\()\\x00-\\x20]";

String inParensNoSP = "\\((" + regChar + "|" + escapedChar + "|\\\\)*\\)";

Regex spnl = regex("^ *(?:\n *)?");

Regex ticksHere = regex("^`+");

Regex reTicks = regex("`+");

String linkLabel = "^\\[(?:[^\\\\\\[\\]]|" + escapedChar + "|\\\\){1,1000}\\]";

Regex linkReferencePattern = regex(linkLabel + ":");

Regex linkTitlePattern = regex("^(?:\"(" + escapedChar + "|[^\"\\x00])*\"" +
			"|" +
			"'(" + escapedChar + "|[^'\\x00])*'" +
			"|" +
			"\\((" + escapedChar + "|[^)\\x00])*\\))");

Regex linkDestinationBraces = regex(
	"^(?:[<](?:[^ <>\\t\\n\\\\\\x00]" + "|" + escapedChar + "|" + "\\\\)*[>])");

Regex linkDestination = regex("^(?:" + regChar + "+|" + escapedChar + "|\\\\|" + inParensNoSP + ")*");

String tagName = "[A-Za-z][A-Za-z0-9-]*";
String attributeName = "[a-zA-Z_:][a-zA-Z0-9:._-]*";

String unQuotedValue = "[^\"'=<>`\\x00-\\x20]+";
String singleQuotedValue = "'[^']*'";
String doubleQuotedValue = "\"[^\"]*\"";
String attributeValue = "(?:" + unQuotedValue + "|" + singleQuotedValue
		+ "|" + doubleQuotedValue + ")";
String attributeValueSpec = "(?:" + "\\s*=" + "\\s*" + attributeValue
		+ ")";
String attribute = "(?:" + "\\s+" + attributeName + attributeValueSpec
		+ "?)";

String openTag = "<" + tagName + attribute + "*" + "\\s*/?>";
String closeTag = "</" + tagName + "\\s*[>]";

Regex atxHeadingPattern = regex("^#{1,6}(?: +|$)");

Regex atxTrailingPattern = regex("(^| ) *#+ *$");

Regex orderedListPattern = regex("^\\d{1,9}[.)](|\\s.*)$");

Regex bulletListPattern = regex("^[*+-](|\\s.*)$");

Regex setextHeadingPattern = regex("^(?:=+|-+) *$");

Regex fencedCodeblockPattern = regex("^`{3,}(?!.*`)|^~{3,}(?!.*~)");

Regex closingCodeblockPattern = regex("^(?:\`{3,}|~{3,})(?= *$)");

Regex thematicBreakPattern = regex("^(?:(?:\\* *){3,}|(?:_ *){3,}|(?:- *){3,}) *$");

Regex[] htmlBlockOpen = [
	regex { expression = "^<(?:script|pre|style)(?:\\s|>|$)"; ignoreCase = true; },
	regex("^<!--"),
	regex("^<[?]"),
	regex("^<![A-Z]"),
	regex("^<!\\[CDATA\\["),
	regex { expression = "^<[/]?(?:" +
				"address|article|aside|" +
				"base|basefont|blockquote|" +
				"body|caption|center|" +
				"col|colgroup|dd|" +
				"details|dialog|dir" +
				"|div|dl|dt|fieldset|" +
				"figcaption|figure|footer|" +
				"form|frame|frameset|" +
				"h1|head|header|hr|" +
				"html|iframe|legend|" +
				"li|link|main|menu|" +
				"menuitem|meta|nav|" +
				"noframes|ol|optgroup|" +
				"option|p|param|section|" +
				"source|title|summary|" +
				"table|tbody|td|tfoot|" +
				"th|thead|title|tr|track|ul)" +
				"(?:\\s|[/]?[>]|$)";
		ignoreCase = true; },
	regex { expression = "^(?:" + openTag + "|" + closeTag + ")\\s*$"; ignoreCase = true; }
];

Regex[] htmlBlockClose = [
	regex { expression = "<\\/(?:script|pre|style)>"; ignoreCase = true; },
	regex("-->"),
	regex("\\?>"),
	regex(">"),
	regex("\\]\\]>")
];
