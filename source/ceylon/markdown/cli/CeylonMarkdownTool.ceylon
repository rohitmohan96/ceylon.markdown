import com.redhat.ceylon.common.tool {
	description,
	summary,
	CeylonBaseTool,
	argument__SETTER,
	option__SETTER,
	description__SETTER
}
import java.util {
	JList=List
}
import java.lang {
	JString=String
}
import ceylon.file {
	current,
	File,
	Nil
}
import ceylon.markdown.core {
	parse
}
import ceylon.markdown.html {
	HtmlVisitor
}

summary ("Convert Markdown to HTML")
description ("ceylon markdown file.md")
shared class CeylonMarkdownTool() extends CeylonBaseTool() {
	argument__SETTER { multiplicity = "2"; }
	shared variable JList<JString>? arguments = null;
	
	description__SETTER ("Generate Partial HTML`")
	option__SETTER
	shared variable Boolean partialHtml = false;
	
	shared actual void run() {
		variable String string = "";
		if (exists v = arguments) {
			value filePath = current.childPath(v.get(0).string);
			
			if (is File file = filePath.resource) {
				try (reader = file.Reader()) {
					while (exists line = reader.readLine()) {
						string += line;
					}
				}
			}
			
			value tree = parse(string);
			
			value htmlPath = current.childPath(v.get(0).string + ".html");
			if (is Nil loc = htmlPath.resource) {
				value file = loc.createFile();
				try (writer = file.Overwriter()) {
					writer.writeLine(tree.accept(HtmlVisitor(partialHtml)).string);
				}
			}
		} else {
			print("Wrong options. Try `ceylon markdown --help` for help.");
		}
	}
}
