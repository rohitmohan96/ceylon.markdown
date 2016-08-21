# ceylon.markdown

A Markdown processor written in Ceylon.

[This project][source] contains a Markdown processor written in Ceylon as my project for GSoC 2016. This project will
be part of the Ceylon SDK. All of my work in this project can be found [here][commits].
The Markdown parser is mainly based on the [CommonMark spec][spec]. 

This repository contains 4 Ceylon modules:

- `ceylon.markdown.core` - Module that contains the AST classes and parser for Markdown.
- `ceylon.markdown.html` - Module to convert Markdown to HTML. This module uses `ceylon.html` to generate the output HTML.
- `ceylon.markdown.plaintext` - Module to convert Markdown to plain text.
- `ceylon.markdown.cli` - Contains the command line Markdown tool to generate HTML from a Markdown file.

## To be done

- Sublists are not handled ([#1])
- List item with multiple children does not work ([#2])
- List references after list items do not work ([#3])
- Some js tests do not pass ([#4])

[source]: https://github.com/rohitmohan96/ceylon.markdown/tree/master/
[spec]: http://spec.commonmark.org/0.26/
[commits]: https://github.com/rohitmohan96/ceylon.markdown/commits/master?author=rohitmohan96

[#1]: https://github.com/rohitmohan96/ceylon.markdown/issues/1
[#2]: https://github.com/rohitmohan96/ceylon.markdown/issues/2
[#3]: https://github.com/rohitmohan96/ceylon.markdown/issues/3
[#4]: https://github.com/rohitmohan96/ceylon.markdown/issues/4
