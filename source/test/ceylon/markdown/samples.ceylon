String sample1Md = "> Lorem ipsum dolor     
                    sit amet.
                    > - Qui *quodsi iracundia*
                    > - aliquando id";

String sample1Tree = "Document: 
                      	BlockQuote: 
                      		Paragraph: 
                      			Text: 
                      				\"Lorem ipsum dolor     
                      sit amet.\"
                      		UnorderedList (bulletChar='-', tight='true'): 
                      			ListItem: 
                      				Paragraph: 
                      					Text: 
                      						\"Qui *quodsi iracundia*\"
                      			ListItem: 
                      				Paragraph: 
                      					Text: 
                      						\"aliquando id\"
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
                          \t\t\t\t\t\t\t\t\t\"deeply nested blockquote
                          deeply nested blockquote
                          deeply nested blockquote
                          deeply nested blockquote
                          deeply nested blockquote
                          deeply nested blockquote\"
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
                          \t\t\t\t\"the simple example of a blockquote 
                          the simple example of a blockquote
                          the simple example of a blockquote
                          the simple example of a blockquote
                          ... continuation
                          ... continuation
                          ... continuation
                          ... continuation\"
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
                       \t\t\t\"heading \\#\\#\\#\\#\\######\"
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
                       \t\t\t\"not a heading
                       ----------------------------------- text\"
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
                         	FencedCode: 
                         		\"
                         an
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
                            			\"************************* text\"
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
