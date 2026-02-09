#!/bin/bash

# strips trailing spaces/tabs
python3 -c "import pathlib,re;
p=pathlib.Path('.');
files=[*p.rglob('*.rst')];
for f in files:
    s=f.read_text(encoding='utf-8')
    t=re.sub(r'[ \t]+$', '', s, flags=re.M)
    if t!=s: f.write_text(t, encoding='utf-8')
print('done', len(files))"
