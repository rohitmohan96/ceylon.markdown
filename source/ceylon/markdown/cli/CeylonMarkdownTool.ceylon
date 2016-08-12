import ceylon.file {
	forEachLine,
	current,
	createFileIfNil,
	File,
	Nil
}
import ceylon.markdown.core {
	parse
}
import ceylon.markdown.html {
	HtmlVisitor
}

import com.redhat.ceylon.common.tool {
	CeylonBaseTool,
	argument=argument__SETTER,
	description__SETTER,
	option=option__SETTER,
	summary,
	description
}

summary ("Convert Markdown to HTML")
description ("ceylon markdown file.md")
shared class CeylonMarkdownTool() extends CeylonBaseTool() {
	
	argument { multiplicity = "1";
		order = 1;
	}
	shared variable String arguments = "";
	
	description__SETTER ("Generate Partial HTML, use `--partialHtml`")
	option
	shared variable Boolean partialHtml = false;
	
	shared actual void run() {
		value filePath = current.childPath(arguments);
		value newPath = current.childPath(arguments + ".html");
		StringBuilder builder = StringBuilder();
		
		if (is File file = filePath.resource) {
			forEachLine(file, (String line) => builder.append(line + "\n"));
		} else {
			print("File does not exist");
			return;
		}
		
		value tree = parse(builder.string);
		
		value html = if (!partialHtml) then HtmlVisitor().renderCompleteHtml(tree)
		else HtmlVisitor().renderPartialHtml(tree);
		
		if (is File|Nil res = newPath.resource) {
			value file = createFileIfNil(res);
			
			try (writer = file.Overwriter()) {
				writer.write(html.string);
			}
		}
	}
}
