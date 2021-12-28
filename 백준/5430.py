import sys
from collections import deque
def read(): return sys.stdin.readline()

t = int(read())
for _ in range(t):
    cmd = str(read())
    n = int(read())
    if n == 0 or cmd.count('D') > n:
        read()
        if n == 0 and not cmd.count('D'): 
            print('[]')
            continue
        print('error')
        continue
    arr = deque(read()[1:-2].split(','))
    cmd = cmd.replace('RR', '')
    r_flag = 0
    for cmd_word in cmd:
        if cmd_word == 'R' and r_flag == 0: r_flag = 1
        elif cmd_word == 'R' and r_flag == 1: r_flag = 0
        elif cmd_word == 'D' and r_flag == 0: arr.popleft()
        elif cmd_word == 'D' and r_flag == 1: arr.pop()
    if r_flag == 1: arr.reverse()
    print('[', end='')
    for idx in range(len(arr)-1):
        print(arr[idx], end=',')
    print('%s]' %(arr.pop() if len(arr) != 0 else ''))
    