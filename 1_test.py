def solve(a: list) -> int:
    result = 0
    for value in a:
        result += value
    return result


a = list()
a.append(1)
a.append(2)
a.append(3)
for value in a:
    print(value)