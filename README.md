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

- Handle sublists and lists with multiple children. 

[source]: https://github.com/rohitmohan96/ceylon.markdown/tree/master/
[spec]: http://spec.commonmark.org/0.26/
[commits]: https://github.com/rohitmohan96/ceylon.markdown/commits/master?author=rohitmohan96
