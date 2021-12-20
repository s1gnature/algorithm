    for column in range(m):
        for row in range(n):
            if (column == 0 and row == 0) or (array[column][row] == "*"): continue
            if column == 0: array[column][row] += array[column][row-1]
            if row == 0: array[column][row] += array[column-1][row]

    return array[m-1][n-1]