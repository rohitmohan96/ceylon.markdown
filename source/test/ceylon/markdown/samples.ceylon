String sample1Md = "> Lorem ipsum dolor     
                    sit amet.
                    > - Qui *quodsi iracundia*
                    > - aliquando id";

String sample1Tree = """Document: 
                        	BlockQuote: 
                        		Paragraph: 
                        			Text: 
                        				"Lorem ipsum dolor"
                        			HardBreak: 
                        			Text: 
                        				"sit amet."
                        		UnorderedList (bulletChar='-', tight='true'): 
                        			ListItem: 
                        				Paragraph: 
                        					Text: 
                        						"Qui "
                        					Emphasis: 
                        						Text: 
                        							"quodsi iracundia"
                        			ListItem: 
                        				Paragraph: 
                        					Text: 
                        						"aliquando id"
                        """;

String blockQuote1Md = """>>>>>> deeply nested blockquote
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
                          >>>>>> deeply nested blockquote""";

String blockQuote2Md = """> the simple example of a blockquote 
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
                          """;

String blockQuote1Tree = """Document: 
                            	BlockQuote: 
                            		BlockQuote: 
                            			BlockQuote: 
                            				BlockQuote: 
                            					BlockQuote: 
                            						BlockQuote: 
                            							Paragraph: 
                            								Text: 
                            									"deeply nested blockquote"
                            								SoftBreak: 
                            								Text: 
                            									"deeply nested blockquote"
                            								SoftBreak: 
                            								Text: 
                            									"deeply nested blockquote"
                            								SoftBreak: 
                            								Text: 
                            									"deeply nested blockquote"
                            								SoftBreak: 
                            								Text: 
                            									"deeply nested blockquote"
                            								SoftBreak: 
                            								Text: 
                            									"deeply nested blockquote"
                            	BlockQuote: 
                            		Paragraph: 
                            			Text: 
                            				"deeply nested blockquote"
                            		BlockQuote: 
                            			Paragraph: 
                            				Text: 
                            					"deeply nested blockquote"
                            			BlockQuote: 
                            				Paragraph: 
                            					Text: 
                            						"deeply nested blockquote"
                            				BlockQuote: 
                            					Paragraph: 
                            						Text: 
                            							"deeply nested blockquote"
                            					BlockQuote: 
                            						Paragraph: 
                            							Text: 
                            								"deeply nested blockquote"
                            						BlockQuote: 
                            							Paragraph: 
                            								Text: 
                            									"deeply nested blockquote"
                            """;

String blockQuote2Tree = """Document: 
                            	BlockQuote: 
                            		Paragraph: 
                            			Text: 
                            				"the simple example of a blockquote"
                            			SoftBreak: 
                            			Text: 
                            				"the simple example of a blockquote"
                            			SoftBreak: 
                            			Text: 
                            				"the simple example of a blockquote"
                            			SoftBreak: 
                            			Text: 
                            				"the simple example of a blockquote"
                            			SoftBreak: 
                            			Text: 
                            				"... continuation"
                            			SoftBreak: 
                            			Text: 
                            				"... continuation"
                            			SoftBreak: 
                            			Text: 
                            				"... continuation"
                            			SoftBreak: 
                            			Text: 
                            				"... continuation"
                            	Paragraph: 
                            		Text: 
                            			"empty blockquote:"
                            	BlockQuote: 
                            """;

String heading1Md = """# heading
                       ### heading
                       ##### heading
                       
                       # heading #
                       ### heading ###
                       ##### heading \#\#\#\#\######
                       
                       ############ not a heading""";

String heading1Tree = """Document: 
                         	Heading (1): 
                         		Text: 
                         			"heading"
                         	Heading (3): 
                         		Text: 
                         			"heading"
                         	Heading (5): 
                         		Text: 
                         			"heading"
                         	Heading (1): 
                         		Text: 
                         			"heading"
                         	Heading (3): 
                         		Text: 
                         			"heading"
                         	Heading (5): 
                         		Text: 
                         			"heading "
                         		Text: 
                         			"#"
                         		Text: 
                         			"#"
                         		Text: 
                         			"#"
                         		Text: 
                         			"#"
                         		Text: 
                         			"#"
                         		Text: 
                         			"#####"
                         	Paragraph: 
                         		Text: 
                         			"############ not a heading"
                         """;

String heading2Md = """heading
                       ---
                       
                       heading
                       ===================================
                       
                       not a heading
                       ----------------------------------- text""";

String heading2Tree = """Document: 
                         	Heading (2): 
                         		Text: 
                         			"heading"
                         	Heading (1): 
                         		Text: 
                         			"heading"
                         	Paragraph: 
                         		Text: 
                         			"not a heading"
                         		SoftBreak: 
                         		Text: 
                         			"----------------------------------- text"
                         """;

String fencedCodeMd = """``````````text
                         an
                         example
                         ```
                         of
                         
                         
                         a fenced
                         ```
                         code
                         block
                         ``````````
                         """;

String fencedCodeTree = """Document: 
                           	FencedCode: 
                           		"an
                           example
                           ```
                           of
                           
                           
                           a fenced
                           ```
                           code
                           block"
                           """;

String thematicBreakMd = """ * * * * *
                            
                             -  -  -  -  -
                            
                             ________
                            
                            
                             ************************* text
                            """;

String thematicBreakTree = """Document: 
                              	ThematicBreak: 
                              	ThematicBreak: 
                              	ThematicBreak: 
                              	Paragraph: 
                              		Text: 
                              			"*************************"
                              		Text: 
                              			" text"
                              """;

String htmlBlockMd = """<div class="this is an html block">
                        
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
                        ]]>""";

String htmlBlockTree = """Document: 
                          	HtmlBlock: 
                          		"<div class="this is an html block">"
                          	Paragraph: 
                          		Text: 
                          			"blah blah"
                          	HtmlBlock: 
                          		"</div>"
                          	HtmlBlock: 
                          		"<table>
                            <tr>
                              <td>
                                **test**
                              </td>
                            </tr>
                          </table>"
                          	HtmlBlock: 
                          		"<table>"
                          	HtmlBlock: 
                          		"<tr>"
                          	IndentedCode: 
                          		"<td>
                          
                            test
                          
                          </td>
                          "
                          	HtmlBlock: 
                          		"</tr>"
                          	HtmlBlock: 
                          		"</table>"
                          	HtmlBlock: 
                          		"<![CDATA[
                          [[[[[[[[[[[... *cdata section - this should not be parsed* ...]]]]]]]]]]]
                          ]]>"
                          """;

String referenceMd = """[1] [2] [3] [1] [2] [3]
                        
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
                        
                        [[[[[[[[[[[[[[[[[[[[]: this is not a valid reference""";

String referenceTree = """Document: 
                          	Paragraph: 
                          		Link (destination='http://something.example.com/foo/bar', title=''): 
                          			Text: 
                          				"1"
                          		Text: 
                          			" "
                          		Link (destination='http://something.example.com/foo/bar', title='test'): 
                          			Text: 
                          				"2"
                          		Text: 
                          			" "
                          		Link (destination='http://foo/bar', title='test'): 
                          			Text: 
                          				"3"
                          		Text: 
                          			" "
                          		Link (destination='http://something.example.com/foo/bar', title=''): 
                          			Text: 
                          				"1"
                          		Text: 
                          			" "
                          		Link (destination='http://something.example.com/foo/bar', title='test'): 
                          			Text: 
                          				"2"
                          		Text: 
                          			" "
                          		Link (destination='http://foo/bar', title='test'): 
                          			Text: 
                          				"3"
                          	Paragraph: 
                          		Link (destination='111', title='test'): 
                          			Text: 
                          				"looooooooooooooooooooooooooooooooooooooooooooooooooong label"
                          	Paragraph: 
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			" this should not slow down anything "
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			"]"
                          		Text: 
                          			": q"
                          		SoftBreak: 
                          		Text: 
                          			"(as long as it is not referenced anywhere)"
                          	Paragraph: 
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"["
                          		Text: 
                          			"]"
                          		Text: 
                          			": this is not a valid reference"
                          """;

String inlineBackticksMd = """`lots`of`backticks`
                              
                              ``i``wonder``how``this``will``be``parsed``""";

String inlineBackticksTree = """Document: 
                                	Paragraph: 
                                		Code: 
                                			"lots"
                                		Text: 
                                			"of"
                                		Code: 
                                			"backticks"
                                	Paragraph: 
                                		Code: 
                                			"i"
                                		Text: 
                                			"wonder"
                                		Code: 
                                			"how"
                                		Text: 
                                			"this"
                                		Code: 
                                			"will"
                                		Text: 
                                			"be"
                                		Code: 
                                			"parsed"
                                """;

String autolinkMd = """closed (valid) autolinks:
                       
                       <ftp://1.2.3.4:21/path/foo>
                       <http://foo.bar.baz?q=hello&id=22&boolean>
                       <http://veeeeeeeeeeeeeeeeeeery.loooooooooooooooooooooooooooooooong.autolink/>
                       <teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest@gmail.com>
                       
                       these are not autolinks:
                       
                       <ftp://1.2.3.4:21/path/foo
                       <http://foo.bar.baz?q=hello&id=22&boolean
                       <http://veeeeeeeeeeeeeeeeeeery.loooooooooooooooooooooooooooooooong.autolink
                       <teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest@gmail.com
                       < http://foo.bar.baz?q=hello&id=22&boolean >""";

String autolinkTree = """Document: 
                         	Paragraph: 
                         		Text: 
                         			"closed (valid) autolinks:"
                         	Paragraph: 
                         		Link (destination='ftp://1.2.3.4:21/path/foo', title=''): 
                         			Text: 
                         				"ftp://1.2.3.4:21/path/foo"
                         		SoftBreak: 
                         		Link (destination='http://foo.bar.baz?q=hello&id=22&boolean', title=''): 
                         			Text: 
                         				"http://foo.bar.baz?q=hello&id=22&boolean"
                         		SoftBreak: 
                         		Link (destination='http://veeeeeeeeeeeeeeeeeeery.loooooooooooooooooooooooooooooooong.autolink/', title=''): 
                         			Text: 
                         				"http://veeeeeeeeeeeeeeeeeeery.loooooooooooooooooooooooooooooooong.autolink/"
                         		SoftBreak: 
                         		Link (destination='mailto:teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest@gmail.com', title=''): 
                         			Text: 
                         				"teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest@gmail.com"
                         	Paragraph: 
                         		Text: 
                         			"these are not autolinks:"
                         	Paragraph: 
                         		Text: 
                         			"<"
                         		Text: 
                         			"ftp://1.2.3.4:21/path/foo"
                         		SoftBreak: 
                         		Text: 
                         			"<"
                         		Text: 
                         			"http://foo.bar.baz?q=hello"
                         		Text: 
                         			"&"
                         		Text: 
                         			"id=22"
                         		Text: 
                         			"&"
                         		Text: 
                         			"boolean"
                         		SoftBreak: 
                         		Text: 
                         			"<"
                         		Text: 
                         			"http://veeeeeeeeeeeeeeeeeeery.loooooooooooooooooooooooooooooooong.autolink"
                         		SoftBreak: 
                         		Text: 
                         			"<"
                         		Text: 
                         			"teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest@gmail.com"
                         		SoftBreak: 
                         		Text: 
                         			"<"
                         		Text: 
                         			" http://foo.bar.baz?q=hello"
                         		Text: 
                         			"&"
                         		Text: 
                         			"id=22"
                         		Text: 
                         			"&"
                         		Text: 
                         			"boolean >"
                         """;

String emphasisMd = """*this* *is* *your* *basic* *boring* *emphasis*
                       
                       _this_ _is_ _your_ _basic_ _boring_ _emphasis_
                       
                       **this** **is** **your** **basic** **boring** **emphasis**""";

String emphasisTree = """Document: 
                         	Paragraph: 
                         		Emphasis: 
                         			Text: 
                         				"this"
                         		Text: 
                         			" "
                         		Emphasis: 
                         			Text: 
                         				"is"
                         		Text: 
                         			" "
                         		Emphasis: 
                         			Text: 
                         				"your"
                         		Text: 
                         			" "
                         		Emphasis: 
                         			Text: 
                         				"basic"
                         		Text: 
                         			" "
                         		Emphasis: 
                         			Text: 
                         				"boring"
                         		Text: 
                         			" "
                         		Emphasis: 
                         			Text: 
                         				"emphasis"
                         	Paragraph: 
                         		Emphasis: 
                         			Text: 
                         				"this"
                         		Text: 
                         			" "
                         		Emphasis: 
                         			Text: 
                         				"is"
                         		Text: 
                         			" "
                         		Emphasis: 
                         			Text: 
                         				"your"
                         		Text: 
                         			" "
                         		Emphasis: 
                         			Text: 
                         				"basic"
                         		Text: 
                         			" "
                         		Emphasis: 
                         			Text: 
                         				"boring"
                         		Text: 
                         			" "
                         		Emphasis: 
                         			Text: 
                         				"emphasis"
                         	Paragraph: 
                         		StrongEmphasis: 
                         			Text: 
                         				"this"
                         		Text: 
                         			" "
                         		StrongEmphasis: 
                         			Text: 
                         				"is"
                         		Text: 
                         			" "
                         		StrongEmphasis: 
                         			Text: 
                         				"your"
                         		Text: 
                         			" "
                         		StrongEmphasis: 
                         			Text: 
                         				"basic"
                         		Text: 
                         			" "
                         		StrongEmphasis: 
                         			Text: 
                         				"boring"
                         		Text: 
                         			" "
                         		StrongEmphasis: 
                         			Text: 
                         				"emphasis"
                         """;

String nestedEmphasisMd = """*this *is *a *bunch* of* nested* emphases*
                             
                             __this __is __a __bunch__ of__ nested__ emphases__
                             
                             ***this ***is ***a ***bunch*** of*** nested*** emphases***""";

String nestedEmphasisTree = """Document: 
                               	Paragraph: 
                               		Emphasis: 
                               			Text: 
                               				"this "
                               			Emphasis: 
                               				Text: 
                               					"is "
                               				Emphasis: 
                               					Text: 
                               						"a "
                               					Emphasis: 
                               						Text: 
                               							"bunch"
                               					Text: 
                               						" of"
                               				Text: 
                               					" nested"
                               			Text: 
                               				" emphases"
                               	Paragraph: 
                               		StrongEmphasis: 
                               			Text: 
                               				"this "
                               			StrongEmphasis: 
                               				Text: 
                               					"is "
                               				StrongEmphasis: 
                               					Text: 
                               						"a "
                               					StrongEmphasis: 
                               						Text: 
                               							"bunch"
                               					Text: 
                               						" of"
                               				Text: 
                               					" nested"
                               			Text: 
                               				" emphases"
                               	Paragraph: 
                               		StrongEmphasis: 
                               			Emphasis: 
                               				Text: 
                               					"this "
                               				Emphasis: 
                               					Text: 
                               						"is "
                               					Emphasis: 
                               						Text: 
                               							"a "
                               						Emphasis: 
                               							Text: 
                               								"bunch"
                               						Text: 
                               							" of"
                               					Text: 
                               						" nested"
                               				Text: 
                               					" emphases"
                               """;

String emphasisWorstMd = """*this *is *a *worst *case *for *em *backtracking
                            
                            __this __is __a __worst __case __for __em __backtracking
                            
                            ***this ***is ***a ***worst ***case ***for ***em ***backtracking""";

String emphasisWorstTree = """Document: 
                              	Paragraph: 
                              		Text: 
                              			"*"
                              		Text: 
                              			"this "
                              		Text: 
                              			"*"
                              		Text: 
                              			"is "
                              		Text: 
                              			"*"
                              		Text: 
                              			"a "
                              		Text: 
                              			"*"
                              		Text: 
                              			"worst "
                              		Text: 
                              			"*"
                              		Text: 
                              			"case "
                              		Text: 
                              			"*"
                              		Text: 
                              			"for "
                              		Text: 
                              			"*"
                              		Text: 
                              			"em "
                              		Text: 
                              			"*"
                              		Text: 
                              			"backtracking"
                              	Paragraph: 
                              		Text: 
                              			"__"
                              		Text: 
                              			"this "
                              		Text: 
                              			"__"
                              		Text: 
                              			"is "
                              		Text: 
                              			"__"
                              		Text: 
                              			"a "
                              		Text: 
                              			"__"
                              		Text: 
                              			"worst "
                              		Text: 
                              			"__"
                              		Text: 
                              			"case "
                              		Text: 
                              			"__"
                              		Text: 
                              			"for "
                              		Text: 
                              			"__"
                              		Text: 
                              			"em "
                              		Text: 
                              			"__"
                              		Text: 
                              			"backtracking"
                              	Paragraph: 
                              		Text: 
                              			"***"
                              		Text: 
                              			"this "
                              		Text: 
                              			"***"
                              		Text: 
                              			"is "
                              		Text: 
                              			"***"
                              		Text: 
                              			"a "
                              		Text: 
                              			"***"
                              		Text: 
                              			"worst "
                              		Text: 
                              			"***"
                              		Text: 
                              			"case "
                              		Text: 
                              			"***"
                              		Text: 
                              			"for "
                              		Text: 
                              			"***"
                              		Text: 
                              			"em "
                              		Text: 
                              			"***"
                              		Text: 
                              			"backtracking"
                              """;

String escapesMd = """\t\e\s\t\i\n\g \e\s\c\a\p\e \s\e\q\u\e\n\c\e\s
                      
                      \!\\\"\#\$\%\&\'\(\)\*\+\,\.\/\:\;\<\=\>\?
                      
                      \@ \[ \] \^ \_ \` \{ \| \} \~ \- \'
                      
                      \
                      \\
                      \\\
                      \\\\
                      \\\\\
                      
                      \<this\> \<is\> \<not\> \<html\>""";

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
