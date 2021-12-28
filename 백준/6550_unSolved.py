s, t = map(str, input().split())

for char_s in s:
    find_idx = t.find(char_s)
    if find_idx != -1:
        t = t[find_idx+1:]
        print(char_s)
        print(t, end='\n')
    else: 
        print('No')
        exit()
print('Yes')
