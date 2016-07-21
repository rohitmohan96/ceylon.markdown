import ceylon.test {
	test,
	assertEquals
}
import ceylon.markdown.core {
	parse,
	Document
}

test
shared void testSample1() => assertEquals {
	actual = parse(sample1Md).string;
	expected = sample1Tree;
};

test
shared void testSample2() => assertEquals {
	actual = parse("").string;
	expected = Document().string;
};

test
shared void testBlockQuote1() => assertEquals {
	actual = parse(blockQuote1Md).string;
	expected = blockQuote1Tree;
};

test
shared void testBlockQuote2() => assertEquals {
	actual = parse(blockQuote2Md).string;
	expected = blockQuote2Tree;
};

test
shared void testHeading1() => assertEquals {
	actual = parse(heading1Md).string;
	expected = heading1Tree;
};

test
shared void testHeading2() => assertEquals {
	actual = parse(heading2Md).string;
	expected = heading2Tree;
};

test
shared void testFencedCode() => assertEquals {
	actual = parse(fencedCodeMd).string;
	expected = fencedCodeTree;
};

test
shared void testThematicBreak() => assertEquals {
	actual = parse(thematicBreakMd).string;
	expected = thematicBreakTree;
};

test
shared void testHtmlBlock() => assertEquals {
	actual = parse(htmlBlockMd).string;
	expected = htmlBlockTree;
};

test
shared void testReference() => assertEquals {
	actual = parse(referenceMd).string;
	expected = referenceTree;
};

test
shared void testInlineBackticks() => assertEquals {
	actual = parse(inlineBackticksMd).string;
	expected = inlineBackticksTree;
};

test
shared void testAutolinks() => assertEquals {
	actual = parse(autolinkMd).string;
	expected = autolinkTree;
};
