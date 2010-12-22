from clang.cindex import *

def code_complete_source(source, line, column):
    index = Index.create()
    files = [('INPUT.c', source)]
    tu = index.parse('INPUT.c', unsaved_files = files)
    return tu.codeComplete('INPUT.c', line, column, unsaved_files = files)

def test_completion_results():
    cr = code_complete_source(""" """, 1, 1)
    assert len(cr.results) > 0 and len(cr.results) < 1000
    assert "extern" in map(lambda x: x.string[0].spelling, cr.results)
    assert "int" in map(lambda x: x.string[0].spelling, cr.results)
    assert "inline" in map(lambda x: x.string[0].spelling, cr.results)

