import re
from pathlib import Path
import sys

def sqlfy(e):
    if e == '\\N':
        res = "NULL"
    elif e.isdigit():
        res = e
    else:
        res = "'" + e.replace("'", "''") + "'"
    return res

def parsesqltuples1row(sqlrow):
    dataraw = sqlrow.split('\t')
    data = ",".join(sqlfy(e) for e in dataraw)
    return f"({data})"

def readsql(path_or_filename):
    with open(path_or_filename, encoding='utf-8') as f:
        res = list(f)
    return res

def parsesqltuples(sqlrows):
    table_name = None
    columns = None
    tuples = []
    pattern_copy = r'copy ([a-z0-9_]+) (\([^)]*\))'
    for sqlrow in sqlrows:
        if len(sqlrow) > 0:
            sqlrow = sqlrow[:-1]
        if table_name is None:
            res = re.match(pattern_copy, sqlrow, re.I)
            if res is None:
                print("Skip Line: ", sqlrow[:10])
                continue
            table_name, columns = res.groups()
            if table_name.endswith('s'):
                table_name = table_name[:-1]
            print('Table:', table_name)
            continue
        if sqlrow.startswith('\\.'):
            break
        new_row = parsesqltuples1row(sqlrow)
        if new_row is not None:
            tuples.append(new_row)
    return table_name, columns, tuples

def generate_newsql(
        path_or_filename, 
        table_name, 
        columns, 
        tuples, 
        bunk_size=1000,
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
                f'INSERT INTO {table_name} {columns} VALUES \n',
                ',\n'.join(tuples[i*bunk_size: (i+1)*bunk_size]),
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
    table_name, columns, tuples = parsesqltuples(rows)
    generate_newsql(path_new, table_name, columns, tuples, dtOn=dtOn, idOn=idOn)