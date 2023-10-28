import re
from pathlib import Path
import sys

def parsesqltuples1row(sqlrow):
    pattern_insert = r'insert into ([a-z0-9_]+) \([^)]*\) values \('
    res = re.match(pattern_insert, sqlrow, re.I)
    if res is None:
        # print('Skip line')
        return
    sql_begin = res.group()[:-1]
    table_name = res.groups()[0]
    _,j = res.span()
    sqlrow = sqlrow[j-1:-2]
    # print(res.group())
    # print(res.groups())
    # print(res.span())
    # print(sqlrow)
    pattern_tuple =  r'\([^()]*\)'
    res = re.search(pattern_tuple, sqlrow)
    tuples = []
    while (res):
        tuples.append(res.group())
        i,j = res.span()
        sqlrow = sqlrow[j+1:]
        res = re.search(pattern_tuple, sqlrow)
    # print("read", len(tuples), 'lines')
    return table_name, sql_begin, tuples

def readsql(path_or_filename):
    with open(path_or_filename, encoding='utf-8') as f:
        res = list(f)
    return res

def parsesqltuples(sqlrows):
    table_name = ''
    sql_begin = ''
    tuples = []
    for sqlrow in sqlrows:
        next = parsesqltuples1row(sqlrow)
        if next is not None:
            table_name, sql_begin, new_tuples = next
            tuples += new_tuples
    return table_name, sql_begin, tuples

def generate_newsql(
        path_or_filename, table_name, sql_begin, tuples, bunk_size=1000,
        dtOn=True, idOn=True
):
    with open(path_or_filename, encoding='utf-8', mode='w') as f:
        if dtOn:
            print('set dateformat ymd;', file=f)
        if idOn:
            print(f'SET IDENTITY_INSERT {table_name} ON;', file=f)
        n_bunk = len(tuples) // bunk_size
        if len(tuples) % bunk_size != 0:
            n_bunk += 1
        for i in range(0, n_bunk):
            print(
                sql_begin,
                ','.join(tuples[i*bunk_size: (i+1)*bunk_size]),
                ';',
                sep='',
                file=f
            )
        if idOn:
            print(f'SET IDENTITY_INSERT {table_name} OFF;', file=f)

if __name__ == '__main__':
    path = Path(sys.argv[1])
    dtOn = '-dt' in sys.argv
    idOn = '-id' in sys.argv
    # path_new = Path(sys.argv[2]) if len(sys.argv) > 2 else path.parent / (path.name + '2')
    path_new = path.parent / (path.name + '2')
    rows = readsql(path)
    table_name, sql_begin, tuples = parsesqltuples(rows)
    generate_newsql(path_new, table_name, sql_begin, tuples, dtOn=dtOn, idOn=idOn)