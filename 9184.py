mem_arr = [[[0] * 21 for _ in range(21)] for _ in range(21)]
def w(a, b, c):
    if a <= 0 or b <= 0 or c <= 0: return 1
    if a > 20 or b > 20 or c > 20: return w(20, 20, 20)
    if mem_arr[a][b][c] != 0: return mem_arr[a][b][c]
    if a < b and b < c: 
        mem_arr[a][b][c] = w(a, b, c-1) + w(a, b-1, c-1) - w(a, b-1, c)
        return mem_arr[a][b][c]
    else: 
        mem_arr[a][b][c] = w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)
        return mem_arr[a][b][c]
while True:
    a, b, c = map(int, input().split())
    if a == b == c == -1: exit()
    print('w(%d, %d, %d) = %d' %(a, b, c, w(a, b, c)))