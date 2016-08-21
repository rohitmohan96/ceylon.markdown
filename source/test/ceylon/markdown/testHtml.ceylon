import ceylon.markdown.core {
	parse,
	Document
}
import ceylon.markdown.html {
	renderCompleteHtml
}
import ceylon.test {
	test,
	assertEquals,
	tag
}

test
tag("unstable")
shared void testHtmlSample1() => assertEquals {
	actual = renderCompleteHtml(parse(sample1Md)).string;
	expected = sample1Html;
};

test
shared void testHtmlSample2() => assertEquals {
	actual = renderCompleteHtml(Document()).string;
	expected = sample2Html;
};