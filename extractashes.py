import re

from pathlib import Path
from m2r2 import convert
from lxml import etree

ashes_commands = ""
script_tag = "@ASHES"

for filename in sorted(Path("docsource/").glob("*.xml")):
    xml_tree = etree.parse(filename)

    with open("xml-to-md.xsl", "rb") as xslt:
        xslt_tree = etree.XSLT(etree.XML(xslt.read()))

    markdown = str(xslt_tree(xml_tree))

    markdown = re.sub(r"\[br\]", "\n", markdown)
    scrubbed_markdown = markdown.replace(script_tag, "").replace("@STUB", "").replace(r"@COMMAND", "").replace(r"@MANAGER", "")

    api_sub_dir = "commands" if re.search(r"@COMMAND", markdown) else "managers" if re.search(r"@MANAGER", markdown) else "supporting_classes"

    # Ensure the sub directory exists and write the file
    api_file_path = Path(f"api/{api_sub_dir}/{filename.name}").with_suffix(".md")
    api_file_path.parent.mkdir(parents=True, exist_ok=True)
    api_file_path.write_text(scrubbed_markdown)

    test_str = markdown

    if re.search(script_tag, test_str):
        test_str = re.sub(script_tag, "", test_str)

        is_stub = False

        if re.search(r"@STUB", test_str):
            is_stub = True
            test_str = re.sub(r"@STUB", "", test_str)

        matches = re.search(r"(?s)## Description[^\n]*\n\n(?P<command>[^\n]+)\n\n(?P<description>.*?)(?=\s*\n## |$)", test_str)

        heading = "`%s` `API-Doc </api/commands/%s.html>`__" % (
            matches.group("command"),
            Path(filename).stem
        )

        ashes_commands += "%s\n%s\n\n" % (
            heading,
            '~' * len(heading)
        )

        if is_stub:
            ashes_commands += "**This command is currently not fully implemented.**\n\n"

        ashes_commands += "%s\n\n" % convert(matches.group("description").replace(script_tag, "").replace(r"@STUB", "").replace(r"@COMMAND", "").replace(r"@MANAGER", ""))

ashes_doc = Path("ashes_reference.template.rst").read_text()

ashes_doc = re.sub(r"(?s)\.\. ESCCOMMANDS.*\.\. /ESCCOMMANDS", ".. ESCCOMMANDS\n\n%s\n\n.. /ESCCOMMANDS" % ashes_commands, ashes_doc)

ashes_reference = Path("scripting/z_ashes_reference.rst")
ashes_reference.parent.mkdir(exist_ok=True)
ashes_reference.write_text(ashes_doc)
