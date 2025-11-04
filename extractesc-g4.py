import re

from pathlib import Path
from m2r2 import convert
from lxml import etree

esc_commands = ""

for filename in sorted(Path("docsource/").glob("*.xml")):
    xml_tree = etree.parse(filename)

    with open("xml-to-md.xsl", "rb") as xslt:
        xslt_tree = etree.XSLT(etree.XML(xslt.read()))

    markdown = str(xslt_tree(xml_tree))

    markdown = re.sub(r"\[br\]", "\n", markdown)
    scrubbed_markdown = markdown.replace(r"@ESC", "").replace("@STUB", "").replace(r"@COMMAND", "").replace(r"@MANAGER", "")

    api_sub_dir = "commands" if re.search(r"@COMMAND", markdown) else "managers" if re.search(r"@MANAGER", markdown) else "supporting_classes"

    Path(f"api/{api_sub_dir}/{filename.name}").with_suffix(".md").write_text(scrubbed_markdown)

    test_str = markdown

    if re.search(r"@ESC", test_str):
        test_str = re.sub(r"@ESC", "", test_str)

        is_stub = False

        if re.search(r"@STUB", test_str):
            is_stub = True
            test_str = re.sub(r"@STUB", "", test_str)

        matches = re.search(r"(?s)## Description[^\n]*\n\n(?P<command>[^\n]+)\n\n(?P<description>.*?)(?=\s*\n## |$)", test_str)

        heading = "`%s` `API-Doc </api/%s.html>`__" % (
            matches.group("command"),
            Path(filename).stem
        )

        esc_commands += "%s\n%s\n\n" % (
            heading,
            '~' * len(heading)
        )

        if is_stub:
            esc_commands += "**This command is currently not fully implemented.**\n\n"

        esc_commands += "%s\n\n" % convert(matches.group("description").replace(r"@ESC", "").replace(r"@STUB", "").replace(r"@COMMAND", "").replace(r"@MANAGER", ""))

esc_doc = Path("esc_reference.template.rst").read_text()

esc_doc = re.sub(r"(?s)\.\. ESCCOMMANDS.*\.\. /ESCCOMMANDS", ".. ESCCOMMANDS\n\n%s\n\n.. /ESCCOMMANDS" % esc_commands, esc_doc)
Path("scripting/z_esc_reference.rst").write_text(esc_doc)
