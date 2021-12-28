import sys
from collections import deque

queue = deque([])
n = int(sys.stdin.readline())
for _ in range(n):
    cmd = sys.stdin.readline().split()
    if 'push' in cmd: cmd, num = cmd[0], cmd[1]
    else: cmd = cmd[0]

    if cmd == 'push': queue.append(num)
    elif cmd == 'pop':
        if len(queue) == 0: print(-1)
        else: print(queue.popleft())
    elif cmd == 'size': print(len(queue))
    elif cmd == 'empty': print(1 if len(queue) == 0 else 0)
    elif (cmd == 'front' or cmd == 'back') and (len(queue) == 0): print(-1)
    elif cmd == 'front': print(queue[0])
    elif cmd == 'back': print(queue[-1])

