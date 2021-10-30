import re

from pathlib import Path

esc_commands = ""

for filename in sorted(Path("api").glob("*.md")):
    test_str = Path(filename).read_text()
    
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

        esc_commands += "%s\n\n" % matches.group("description")

esc_doc = Path("scripting/z_esc_reference.rst").read_text()

esc_doc = re.sub(r"(?s)\.\. ESCCOMMANDS.*\.\. /ESCCOMMANDS", ".. ESCCOMMANDS\n\n%s\n\n.. /ESCCOMMANDS" % esc_commands, esc_doc)
Path("scripting/z_esc_reference.rst").write_text(esc_doc)
