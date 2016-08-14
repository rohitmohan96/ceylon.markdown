String sample1Md = "> Lorem ipsum dolor     
                    sit amet.
                    > - Qui *quodsi iracundia*
                    > - aliquando id";

String sample1Tree = "Document: 
                      \tBlockQuote: 
                      \t\tParagraph: 
                      \t\t\tText: 
                      \t\t\t\t\"Lorem ipsum dolor\"
                      \t\t\tHardBreak: 
                      \t\t\tText: 
                      \t\t\t\t\"sit amet.\"
                      \t\tUnorderedList (bulletChar='-', tight='true'): 
                      \t\t\tListItem: 
                      \t\t\t\tParagraph: 
                      \t\t\t\t\tText: 
                      \t\t\t\t\t\t\"Qui \"
                      \t\t\t\t\tEmphasis: 
                      \t\t\t\t\t\tText: 
                      \t\t\t\t\t\t\t\"quodsi iracundia\"
                      \t\t\tListItem: 
                      \t\t\t\tParagraph: 
                      \t\t\t\t\tText: 
                      \t\t\t\t\t\t\"aliquando id\"
                      ";

String blockQuote1Md = ">>>>>> deeply nested blockquote
                        >>>>> deeply nested blockquote
                        >>>> deeply nested blockquote
                        >>> deeply nested blockquote
                        >> deeply nested blockquote
                        > deeply nested blockquote
                        
                        > deeply nested blockquote
                        >> deeply nested blockquote
                        >>> deeply nested blockquote
                        >>>> deeply nested blockquote
                        >>>>> deeply nested blockquote
                        >>>>>> deeply nested blockquote";

String blockQuote2Md = "> the simple example of a blockquote 
                        > the simple example of a blockquote
                        > the simple example of a blockquote
                        > the simple example of a blockquote
                        ... continuation
                        ... continuation
                        ... continuation
                        ... continuation
                        
                        empty blockquote:
                        
                        >
                        >
                        >
                        >
                        ";

String blockQuote1Tree = "Document: 
                          \tBlockQuote: 
                          \t\tBlockQuote: 
                          \t\t\tBlockQuote: 
                          \t\t\t\tBlockQuote: 
                          \t\t\t\t\tBlockQuote: 
                          \t\t\t\t\t\tBlockQuote: 
                          \t\t\t\t\t\t\tParagraph: 
                          \t\t\t\t\t\t\t\tText: 
                          \t\t\t\t\t\t\t\t\t\"deeply nested blockquote\"
                          \t\t\t\t\t\t\t\tSoftBreak: 
                          \t\t\t\t\t\t\t\tText: 
                          \t\t\t\t\t\t\t\t\t\"deeply nested blockquote\"
                          \t\t\t\t\t\t\t\tSoftBreak: 
                          \t\t\t\t\t\t\t\tText: 
                          \t\t\t\t\t\t\t\t\t\"deeply nested blockquote\"
                          \t\t\t\t\t\t\t\tSoftBreak: 
                          \t\t\t\t\t\t\t\tText: 
                          \t\t\t\t\t\t\t\t\t\"deeply nested blockquote\"
                          \t\t\t\t\t\t\t\tSoftBreak: 
                          \t\t\t\t\t\t\t\tText: 
                          \t\t\t\t\t\t\t\t\t\"deeply nested blockquote\"
                          \t\t\t\t\t\t\t\tSoftBreak: 
                          \t\t\t\t\t\t\t\tText: 
                          \t\t\t\t\t\t\t\t\t\"deeply nested blockquote\"
                          \tBlockQuote: 
                          \t\tParagraph: 
                          \t\t\tText: 
                          \t\t\t\t\"deeply nested blockquote\"
                          \t\tBlockQuote: 
                          \t\t\tParagraph: 
                          \t\t\t\tText: 
                          \t\t\t\t\t\"deeply nested blockquote\"
                          \t\t\tBlockQuote: 
                          \t\t\t\tParagraph: 
                          \t\t\t\t\tText: 
                          \t\t\t\t\t\t\"deeply nested blockquote\"
                          \t\t\t\tBlockQuote: 
                          \t\t\t\t\tParagraph: 
                          \t\t\t\t\t\tText: 
                          \t\t\t\t\t\t\t\"deeply nested blockquote\"
                          \t\t\t\t\tBlockQuote: 
                          \t\t\t\t\t\tParagraph: 
                          \t\t\t\t\t\t\tText: 
                          \t\t\t\t\t\t\t\t\"deeply nested blockquote\"
                          \t\t\t\t\t\tBlockQuote: 
                          \t\t\t\t\t\t\tParagraph: 
                          \t\t\t\t\t\t\t\tText: 
                          \t\t\t\t\t\t\t\t\t\"deeply nested blockquote\"
                          ";

String blockQuote2Tree = "Document: 
                          \tBlockQuote: 
                          \t\tParagraph: 
                          \t\t\tText: 
                          \t\t\t\t\"the simple example of a blockquote\"
                          \t\t\tSoftBreak: 
                          \t\t\tText: 
                          \t\t\t\t\"the simple example of a blockquote\"
                          \t\t\tSoftBreak: 
                          \t\t\tText: 
                          \t\t\t\t\"the simple example of a blockquote\"
                          \t\t\tSoftBreak: 
                          \t\t\tText: 
                          \t\t\t\t\"the simple example of a blockquote\"
                          \t\t\tSoftBreak: 
                          \t\t\tText: 
                          \t\t\t\t\"... continuation\"
                          \t\t\tSoftBreak: 
                          \t\t\tText: 
                          \t\t\t\t\"... continuation\"
                          \t\t\tSoftBreak: 
                          \t\t\tText: 
                          \t\t\t\t\"... continuation\"
                          \t\t\tSoftBreak: 
                          \t\t\tText: 
                          \t\t\t\t\"... continuation\"
                          \tParagraph: 
                          \t\tText: 
                          \t\t\t\"empty blockquote:\"
                          \tBlockQuote: 
                          ";

String heading1Md = "# heading
                     ### heading
                     ##### heading
                     
                     # heading #
                     ### heading ###
                     ##### heading \\#\\#\\#\\#\\######
                     
                     ############ not a heading";

String heading1Tree = "Document: 
                       \tHeading (1): 
                       \t\tText: 
                       \t\t\t\"heading\"
                       \tHeading (3): 
                       \t\tText: 
                       \t\t\t\"heading\"
                       \tHeading (5): 
                       \t\tText: 
                       \t\t\t\"heading\"
                       \tHeading (1): 
                       \t\tText: 
                       \t\t\t\"heading\"
                       \tHeading (3): 
                       \t\tText: 
                       \t\t\t\"heading\"
                       \tHeading (5): 
                       \t\tText: 
                       \t\t\t\"heading \"
                       \t\tText: 
                       \t\t\t\"#\"
                       \t\tText: 
                       \t\t\t\"#\"
                       \t\tText: 
                       \t\t\t\"#\"
                       \t\tText: 
                       \t\t\t\"#\"
                       \t\tText: 
                       \t\t\t\"#\"
                       \t\tText: 
                       \t\t\t\"#####\"
                       \tParagraph: 
                       \t\tText: 
                       \t\t\t\"############ not a heading\"
                       ";

String heading2Md = "heading
                     ---
                     
                     heading
                     ===================================
                     
                     not a heading
                     ----------------------------------- text";

String heading2Tree = "Document: 
                       \tHeading (2): 
                       \t\tText: 
                       \t\t\t\"heading\"
                       \tHeading (1): 
                       \t\tText: 
                       \t\t\t\"heading\"
                       \tParagraph: 
                       \t\tText: 
                       \t\t\t\"not a heading\"
                       \t\tSoftBreak: 
                       \t\tText: 
                       \t\t\t\"----------------------------------- text\"
                       ";

String fencedCodeMd = "\`\`\`\`\`\`\`\`\`\`text
                       an
                       example
                       \`\`\`
                       of
                       
                       
                       a fenced
                       \`\`\`
                       code
                       block
                       \`\`\`\`\`\`\`\`\`\`
                       ";

String fencedCodeTree = "Document: 
                         \tFencedCode: 
                         \t\t\"an
                         example
                         \`\`\`
                         of
                         
                         
                         a fenced
                         \`\`\`
                         code
                         block\"
                         ";

String thematicBreakMd = " * * * * *
                          
                           -  -  -  -  -
                          
                           ________
                          
                          
                           ************************* text
                          ";

String thematicBreakTree = "Document: 
                            	ThematicBreak: 
                            	ThematicBreak: 
                            	ThematicBreak: 
                            	Paragraph: 
                            		Text: 
                            			\"*************************\"
                            		Text: 
                            			\" text\"
                            ";

String htmlBlockMd = "<div class=\"this is an html block\">
                      
                      blah blah
                      
                      </div>
                      
                      <table>
                        <tr>
                          <td>
                            **test**
                          </td>
                        </tr>
                      </table>
                      
                      <table>
                      
                        <tr>
                      
                          <td>
                      
                            test
                      
                          </td>
                      
                        </tr>
                      
                      </table>
                      
                      <![CDATA[
                      [[[[[[[[[[[... *cdata section - this should not be parsed* ...]]]]]]]]]]]
                      ]]>";

String htmlBlockTree = "Document: 
                        \tHtmlBlock: 
                        \t\t\"<div class=\"this is an html block\">\"
                        \tParagraph: 
                        \t\tText: 
                        \t\t\t\"blah blah\"
                        \tHtmlBlock: 
                        \t\t\"</div>\"
                        \tHtmlBlock: 
                        \t\t\"<table>
                          <tr>
                            <td>
                              **test**
                            </td>
                          </tr>
                        </table>\"
                        \tHtmlBlock: 
                        \t\t\"<table>\"
                        \tHtmlBlock: 
                        \t\t\"<tr>\"
                        \tIndentedCode: 
                        \t\t\"<td>
                        
                          test
                        
                        </td>
                        \"
                        \tHtmlBlock: 
                        \t\t\"</tr>\"
                        \tHtmlBlock: 
                        \t\t\"</table>\"
                        \tHtmlBlock: 
                        \t\t\"<![CDATA[
                        [[[[[[[[[[[... *cdata section - this should not be parsed* ...]]]]]]]]]]]
                        ]]>\"
                        ";

String referenceMd = "[1] [2] [3] [1] [2] [3]
                      
                      [looooooooooooooooooooooooooooooooooooooooooooooooooong label]
                      
                      [1]: <http://something.example.com/foo/bar>
                      [2]: http://something.example.com/foo/bar 'test'
                      [3]:
                      http://foo/bar
                      [    looooooooooooooooooooooooooooooooooooooooooooooooooong   label    ]:
                      111
                      'test'
                      [[[[[[[[[[[[[[[[[[[[ this should not slow down anything ]]]]]]]]]]]]]]]]]]]]: q
                      (as long as it is not referenced anywhere)
                      
                      [[[[[[[[[[[[[[[[[[[[]: this is not a valid reference";

String referenceTree = "Document: 
                        \tParagraph: 
                        \t\tLink (destination='http://something.example.com/foo/bar', title=''): 
                        \t\t\tText: 
                        \t\t\t\t\"1\"
                        \t\tText: 
                        \t\t\t\" \"
                        \t\tLink (destination='http://something.example.com/foo/bar', title='test'): 
                        \t\t\tText: 
                        \t\t\t\t\"2\"
                        \t\tText: 
                        \t\t\t\" \"
                        \t\tLink (destination='http://foo/bar', title='test'): 
                        \t\t\tText: 
                        \t\t\t\t\"3\"
                        \t\tText: 
                        \t\t\t\" \"
                        \t\tLink (destination='http://something.example.com/foo/bar', title=''): 
                        \t\t\tText: 
                        \t\t\t\t\"1\"
                        \t\tText: 
                        \t\t\t\" \"
                        \t\tLink (destination='http://something.example.com/foo/bar', title='test'): 
                        \t\t\tText: 
                        \t\t\t\t\"2\"
                        \t\tText: 
                        \t\t\t\" \"
                        \t\tLink (destination='http://foo/bar', title='test'): 
                        \t\t\tText: 
                        \t\t\t\t\"3\"
                        \tParagraph: 
                        \t\tLink (destination='111', title='test'): 
                        \t\t\tText: 
                        \t\t\t\t\"looooooooooooooooooooooooooooooooooooooooooooooooooong label\"
                        \tParagraph: 
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\" this should not slow down anything \"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\": q\"
                        \t\tSoftBreak: 
                        \t\tText: 
                        \t\t\t\"(as long as it is not referenced anywhere)\"
                        \tParagraph: 
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"[\"
                        \t\tText: 
                        \t\t\t\"]\"
                        \t\tText: 
                        \t\t\t\": this is not a valid reference\"
                        ";

String inlineBackticksMd = "\`lots\`of\`backticks\`
                            
                            \`\`i\`\`wonder\`\`how\`\`this\`\`will\`\`be\`\`parsed\`\`";

String inlineBackticksTree = "Document: 
                              \tParagraph: 
                              \t\tCode: 
                              \t\t\t\"lots\"
                              \t\tText: 
                              \t\t\t\"of\"
                              \t\tCode: 
                              \t\t\t\"backticks\"
                              \tParagraph: 
                              \t\tCode: 
                              \t\t\t\"i\"
                              \t\tText: 
                              \t\t\t\"wonder\"
                              \t\tCode: 
                              \t\t\t\"how\"
                              \t\tText: 
                              \t\t\t\"this\"
                              \t\tCode: 
                              \t\t\t\"will\"
                              \t\tText: 
                              \t\t\t\"be\"
                              \t\tCode: 
                              \t\t\t\"parsed\"
                              ";

String autolinkMd = "closed (valid) autolinks:
                     
                     <ftp://1.2.3.4:21/path/foo>
                     <http://foo.bar.baz?q=hello&id=22&boolean>
                     <http://veeeeeeeeeeeeeeeeeeery.loooooooooooooooooooooooooooooooong.autolink/>
                     <teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest@gmail.com>
                     
                     these are not autolinks:
                     
                     <ftp://1.2.3.4:21/path/foo
                     <http://foo.bar.baz?q=hello&id=22&boolean
                     <http://veeeeeeeeeeeeeeeeeeery.loooooooooooooooooooooooooooooooong.autolink
                     <teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest@gmail.com
                     < http://foo.bar.baz?q=hello&id=22&boolean >";

String autolinkTree = "Document: 
                       \tParagraph: 
                       \t\tText: 
                       \t\t\t\"closed (valid) autolinks:\"
                       \tParagraph: 
                       \t\tLink (destination='ftp://1.2.3.4:21/path/foo', title=''): 
                       \t\t\tText: 
                       \t\t\t\t\"ftp://1.2.3.4:21/path/foo\"
                       \t\tSoftBreak: 
                       \t\tLink (destination='http://foo.bar.baz?q=hello&id=22&boolean', title=''): 
                       \t\t\tText: 
                       \t\t\t\t\"http://foo.bar.baz?q=hello&id=22&boolean\"
                       \t\tSoftBreak: 
                       \t\tLink (destination='http://veeeeeeeeeeeeeeeeeeery.loooooooooooooooooooooooooooooooong.autolink/', title=''): 
                       \t\t\tText: 
                       \t\t\t\t\"http://veeeeeeeeeeeeeeeeeeery.loooooooooooooooooooooooooooooooong.autolink/\"
                       \t\tSoftBreak: 
                       \t\tLink (destination='mailto:teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest@gmail.com', title=''): 
                       \t\t\tText: 
                       \t\t\t\t\"teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest@gmail.com\"
                       \tParagraph: 
                       \t\tText: 
                       \t\t\t\"these are not autolinks:\"
                       \tParagraph: 
                       \t\tText: 
                       \t\t\t\"<\"
                       \t\tText: 
                       \t\t\t\"ftp://1.2.3.4:21/path/foo\"
                       \t\tSoftBreak: 
                       \t\tText: 
                       \t\t\t\"<\"
                       \t\tText: 
                       \t\t\t\"http://foo.bar.baz?q=hello\"
                       \t\tText: 
                       \t\t\t\"&\"
                       \t\tText: 
                       \t\t\t\"id=22\"
                       \t\tText: 
                       \t\t\t\"&\"
                       \t\tText: 
                       \t\t\t\"boolean\"
                       \t\tSoftBreak: 
                       \t\tText: 
                       \t\t\t\"<\"
                       \t\tText: 
                       \t\t\t\"http://veeeeeeeeeeeeeeeeeeery.loooooooooooooooooooooooooooooooong.autolink\"
                       \t\tSoftBreak: 
                       \t\tText: 
                       \t\t\t\"<\"
                       \t\tText: 
                       \t\t\t\"teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest@gmail.com\"
                       \t\tSoftBreak: 
                       \t\tText: 
                       \t\t\t\"<\"
                       \t\tText: 
                       \t\t\t\" http://foo.bar.baz?q=hello\"
                       \t\tText: 
                       \t\t\t\"&\"
                       \t\tText: 
                       \t\t\t\"id=22\"
                       \t\tText: 
                       \t\t\t\"&\"
                       \t\tText: 
                       \t\t\t\"boolean >\"
                       ";

String emphasisMd = "*this* *is* *your* *basic* *boring* *emphasis*
                     
                     _this_ _is_ _your_ _basic_ _boring_ _emphasis_
                     
                     **this** **is** **your** **basic** **boring** **emphasis**";

String emphasisTree = "Document: 
                       \tParagraph: 
                       \t\tEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"this\"
                       \t\tText: 
                       \t\t\t\" \"
                       \t\tEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"is\"
                       \t\tText: 
                       \t\t\t\" \"
                       \t\tEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"your\"
                       \t\tText: 
                       \t\t\t\" \"
                       \t\tEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"basic\"
                       \t\tText: 
                       \t\t\t\" \"
                       \t\tEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"boring\"
                       \t\tText: 
                       \t\t\t\" \"
                       \t\tEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"emphasis\"
                       \tParagraph: 
                       \t\tEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"this\"
                       \t\tText: 
                       \t\t\t\" \"
                       \t\tEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"is\"
                       \t\tText: 
                       \t\t\t\" \"
                       \t\tEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"your\"
                       \t\tText: 
                       \t\t\t\" \"
                       \t\tEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"basic\"
                       \t\tText: 
                       \t\t\t\" \"
                       \t\tEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"boring\"
                       \t\tText: 
                       \t\t\t\" \"
                       \t\tEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"emphasis\"
                       \tParagraph: 
                       \t\tStrongEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"this\"
                       \t\tText: 
                       \t\t\t\" \"
                       \t\tStrongEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"is\"
                       \t\tText: 
                       \t\t\t\" \"
                       \t\tStrongEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"your\"
                       \t\tText: 
                       \t\t\t\" \"
                       \t\tStrongEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"basic\"
                       \t\tText: 
                       \t\t\t\" \"
                       \t\tStrongEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"boring\"
                       \t\tText: 
                       \t\t\t\" \"
                       \t\tStrongEmphasis: 
                       \t\t\tText: 
                       \t\t\t\t\"emphasis\"
                       ";

String nestedEmphasisMd = "*this *is *a *bunch* of* nested* emphases*
                           
                           __this __is __a __bunch__ of__ nested__ emphases__
                           
                           ***this ***is ***a ***bunch*** of*** nested*** emphases***";

String nestedEmphasisTree = "Document: 
                             \tParagraph: 
                             \t\tEmphasis: 
                             \t\t\tText: 
                             \t\t\t\t\"this \"
                             \t\t\tEmphasis: 
                             \t\t\t\tText: 
                             \t\t\t\t\t\"is \"
                             \t\t\t\tEmphasis: 
                             \t\t\t\t\tText: 
                             \t\t\t\t\t\t\"a \"
                             \t\t\t\t\tEmphasis: 
                             \t\t\t\t\t\tText: 
                             \t\t\t\t\t\t\t\"bunch\"
                             \t\t\t\t\tText: 
                             \t\t\t\t\t\t\" of\"
                             \t\t\t\tText: 
                             \t\t\t\t\t\" nested\"
                             \t\t\tText: 
                             \t\t\t\t\" emphases\"
                             \tParagraph: 
                             \t\tStrongEmphasis: 
                             \t\t\tText: 
                             \t\t\t\t\"this \"
                             \t\t\tStrongEmphasis: 
                             \t\t\t\tText: 
                             \t\t\t\t\t\"is \"
                             \t\t\t\tStrongEmphasis: 
                             \t\t\t\t\tText: 
                             \t\t\t\t\t\t\"a \"
                             \t\t\t\t\tStrongEmphasis: 
                             \t\t\t\t\t\tText: 
                             \t\t\t\t\t\t\t\"bunch\"
                             \t\t\t\t\tText: 
                             \t\t\t\t\t\t\" of\"
                             \t\t\t\tText: 
                             \t\t\t\t\t\" nested\"
                             \t\t\tText: 
                             \t\t\t\t\" emphases\"
                             \tParagraph: 
                             \t\tStrongEmphasis: 
                             \t\t\tEmphasis: 
                             \t\t\t\tText: 
                             \t\t\t\t\t\"this \"
                             \t\t\t\tEmphasis: 
                             \t\t\t\t\tText: 
                             \t\t\t\t\t\t\"is \"
                             \t\t\t\t\tEmphasis: 
                             \t\t\t\t\t\tText: 
                             \t\t\t\t\t\t\t\"a \"
                             \t\t\t\t\t\tEmphasis: 
                             \t\t\t\t\t\t\tText: 
                             \t\t\t\t\t\t\t\t\"bunch\"
                             \t\t\t\t\t\tText: 
                             \t\t\t\t\t\t\t\" of\"
                             \t\t\t\t\tText: 
                             \t\t\t\t\t\t\" nested\"
                             \t\t\t\tText: 
                             \t\t\t\t\t\" emphases\"
                             ";

String emphasisWorstMd = "*this *is *a *worst *case *for *em *backtracking
                          
                          __this __is __a __worst __case __for __em __backtracking
                          
                          ***this ***is ***a ***worst ***case ***for ***em ***backtracking";

String emphasisWorstTree = "Document: 
                            \tParagraph: 
                            \t\tText: 
                            \t\t\t\"*\"
                            \t\tText: 
                            \t\t\t\"this \"
                            \t\tText: 
                            \t\t\t\"*\"
                            \t\tText: 
                            \t\t\t\"is \"
                            \t\tText: 
                            \t\t\t\"*\"
                            \t\tText: 
                            \t\t\t\"a \"
                            \t\tText: 
                            \t\t\t\"*\"
                            \t\tText: 
                            \t\t\t\"worst \"
                            \t\tText: 
                            \t\t\t\"*\"
                            \t\tText: 
                            \t\t\t\"case \"
                            \t\tText: 
                            \t\t\t\"*\"
                            \t\tText: 
                            \t\t\t\"for \"
                            \t\tText: 
                            \t\t\t\"*\"
                            \t\tText: 
                            \t\t\t\"em \"
                            \t\tText: 
                            \t\t\t\"*\"
                            \t\tText: 
                            \t\t\t\"backtracking\"
                            \tParagraph: 
                            \t\tText: 
                            \t\t\t\"__\"
                            \t\tText: 
                            \t\t\t\"this \"
                            \t\tText: 
                            \t\t\t\"__\"
                            \t\tText: 
                            \t\t\t\"is \"
                            \t\tText: 
                            \t\t\t\"__\"
                            \t\tText: 
                            \t\t\t\"a \"
                            \t\tText: 
                            \t\t\t\"__\"
                            \t\tText: 
                            \t\t\t\"worst \"
                            \t\tText: 
                            \t\t\t\"__\"
                            \t\tText: 
                            \t\t\t\"case \"
                            \t\tText: 
                            \t\t\t\"__\"
                            \t\tText: 
                            \t\t\t\"for \"
                            \t\tText: 
                            \t\t\t\"__\"
                            \t\tText: 
                            \t\t\t\"em \"
                            \t\tText: 
                            \t\t\t\"__\"
                            \t\tText: 
                            \t\t\t\"backtracking\"
                            \tParagraph: 
                            \t\tText: 
                            \t\t\t\"***\"
                            \t\tText: 
                            \t\t\t\"this \"
                            \t\tText: 
                            \t\t\t\"***\"
                            \t\tText: 
                            \t\t\t\"is \"
                            \t\tText: 
                            \t\t\t\"***\"
                            \t\tText: 
                            \t\t\t\"a \"
                            \t\tText: 
                            \t\t\t\"***\"
                            \t\tText: 
                            \t\t\t\"worst \"
                            \t\tText: 
                            \t\t\t\"***\"
                            \t\tText: 
                            \t\t\t\"case \"
                            \t\tText: 
                            \t\t\t\"***\"
                            \t\tText: 
                            \t\t\t\"for \"
                            \t\tText: 
                            \t\t\t\"***\"
                            \t\tText: 
                            \t\t\t\"em \"
                            \t\tText: 
                            \t\t\t\"***\"
                            \t\tText: 
                            \t\t\t\"backtracking\"
                            ";

String escapesMd = "\\t\\e\\s\\t\\i\\n\\g \\e\\s\\c\\a\\p\\e \\s\\e\\q\\u\\e\\n\\c\\e\\s
                    
                    \\!\\\\\\\"\\#\\$\\%\\&\\'\\(\\)\\*\\+\\,\\.\\/\\:\\;\\<\\=\\>\\?
                    
                    \\@ \\[ \\] \\^ \\_ \\\` \\{ \\| \\} \\~ \\- \\'
                    
                    \\
                    \\\\
                    \\\\\\
                    \\\\\\\\
                    \\\\\\\\\\
                    
                    \\<this\\> \\<is\\> \\<not\\> \\<html\\>";

String escapesTree = "Document: 
                      \tParagraph: 
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"t\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"e\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"s\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"t\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"i\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"n\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"g \"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"e\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"s\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"c\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"a\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"p\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"e \"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"s\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"e\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"q\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"u\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"e\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"n\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"c\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"e\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"s\"
                      \tParagraph: 
                      \t\tText: 
                      \t\t\t\"!\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"\"\"
                      \t\tText: 
                      \t\t\t\"#\"
                      \t\tText: 
                      \t\t\t\"$\"
                      \t\tText: 
                      \t\t\t\"%\"
                      \t\tText: 
                      \t\t\t\"&\"
                      \t\tText: 
                      \t\t\t\"'\"
                      \t\tText: 
                      \t\t\t\"(\"
                      \t\tText: 
                      \t\t\t\")\"
                      \t\tText: 
                      \t\t\t\"*\"
                      \t\tText: 
                      \t\t\t\"+\"
                      \t\tText: 
                      \t\t\t\",\"
                      \t\tText: 
                      \t\t\t\".\"
                      \t\tText: 
                      \t\t\t\"/\"
                      \t\tText: 
                      \t\t\t\":\"
                      \t\tText: 
                      \t\t\t\";\"
                      \t\tText: 
                      \t\t\t\"<\"
                      \t\tText: 
                      \t\t\t\"=\"
                      \t\tText: 
                      \t\t\t\">\"
                      \t\tText: 
                      \t\t\t\"?\"
                      \tParagraph: 
                      \t\tText: 
                      \t\t\t\"@\"
                      \t\tText: 
                      \t\t\t\" \"
                      \t\tText: 
                      \t\t\t\"[\"
                      \t\tText: 
                      \t\t\t\" \"
                      \t\tText: 
                      \t\t\t\"]\"
                      \t\tText: 
                      \t\t\t\" \"
                      \t\tText: 
                      \t\t\t\"^\"
                      \t\tText: 
                      \t\t\t\" \"
                      \t\tText: 
                      \t\t\t\"_\"
                      \t\tText: 
                      \t\t\t\" \"
                      \t\tText: 
                      \t\t\t\"\`\"
                      \t\tText: 
                      \t\t\t\" \"
                      \t\tText: 
                      \t\t\t\"{\"
                      \t\tText: 
                      \t\t\t\" \"
                      \t\tText: 
                      \t\t\t\"|\"
                      \t\tText: 
                      \t\t\t\" \"
                      \t\tText: 
                      \t\t\t\"}\"
                      \t\tText: 
                      \t\t\t\" \"
                      \t\tText: 
                      \t\t\t\"~\"
                      \t\tText: 
                      \t\t\t\" \"
                      \t\tText: 
                      \t\t\t\"-\"
                      \t\tText: 
                      \t\t\t\" \"
                      \t\tText: 
                      \t\t\t\"'\"
                      \tParagraph: 
                      \t\tHardBreak: 
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tSoftBreak: 
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tHardBreak: 
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tSoftBreak: 
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \t\tText: 
                      \t\t\t\"\\\"
                      \tParagraph: 
                      \t\tText: 
                      \t\t\t\"<\"
                      \t\tText: 
                      \t\t\t\"this\"
                      \t\tText: 
                      \t\t\t\">\"
                      \t\tText: 
                      \t\t\t\" \"
                      \t\tText: 
                      \t\t\t\"<\"
                      \t\tText: 
                      \t\t\t\"is\"
                      \t\tText: 
                      \t\t\t\">\"
                      \t\tText: 
                      \t\t\t\" \"
                      \t\tText: 
                      \t\t\t\"<\"
                      \t\tText: 
                      \t\t\t\"not\"
                      \t\tText: 
                      \t\t\t\">\"
                      \t\tText: 
                      \t\t\t\" \"
                      \t\tText: 
                      \t\t\t\"<\"
                      \t\tText: 
                      \t\t\t\"html\"
                      \t\tText: 
                      \t\t\t\">\"
                      ";
