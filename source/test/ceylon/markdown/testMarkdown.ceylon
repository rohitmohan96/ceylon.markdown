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
	expected = sample1;
};

test
shared void testSample2() => assertEquals {
	actual = parse("").string;
	expected = Document().string;
};

