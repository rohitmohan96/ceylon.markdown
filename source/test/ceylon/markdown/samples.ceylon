String sample1Md = "> Lorem ipsum dolor     
                    sit amet.
                    > - Qui *quodsi iracundia*
                    > - aliquando id";

String sample1 = "Document: 
                  	BlockQuote: 
                  		Paragraph: 
                  			Text: 
                  				\"Lorem ipsum dolor     
                  sit amet.\"
                  		List: 
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

String headingMd = "# heading
                    ### heading
                    ##### heading
                    
                    # heading #
                    ### heading ###
                    ##### heading \\#\\#\\#\\#\\######
                    
                    ############ not a heading";

String headingTree = "Document: 
                      \tHeading: 
                      \t\t\"heading\" (1)
                      \tHeading: 
                      \t\t\"heading\" (3)
                      \tHeading: 
                      \t\t\"heading\" (5)
                      \tHeading: 
                      \t\t\"heading\" (1)
                      \tHeading: 
                      \t\t\"heading\" (3)
                      \tHeading: 
                      \t\t\"heading \\#\\#\\#\\#\\######\" (5)
                      \tParagraph: 
                      \t\tText: 
                      \t\t\t\"############ not a heading\"
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
