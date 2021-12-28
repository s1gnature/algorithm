'''
# Question
2차원 평면 위의 점 N개가 주어진다. 
좌표를 x좌표가 증가하는 순으로, x좌표가 같으면 y좌표가 증가하는 순서로 정렬한 다음 출력하는 프로그램을 작성하시오.

# Input
첫째 줄에 점의 개수 N (1 ≤ N ≤ 100,000)이 주어진다. 
둘째 줄부터 N개의 줄에는 i번점의 위치 xi와 yi가 주어진다. 
(-100,000 ≤ xi, yi ≤ 100,000) 좌표는 항상 정수이고, 위치가 같은 두 점은 없다.

# Output
첫째 줄부터 N개의 줄에 점을 정렬한 결과를 출력한다.
'''

'''
class point:
    x = 0
    y = []

    def __init__(self, x, y):
        self.x = x
        self.y = [y]
    def newValue(self, y):
        self.y.append(y)
    def sort(self):
        self.y.sort()
        self.y.reverse()

n = int(input())
dic = dict()
x_list = []

for _ in range(n):
    x, y = map(int, input().split())
    x_list.append(x)
    if not x in dic: dic[x] = point(x, y)
    else: dic[x].newValue(y)

x_list.sort()
for key in x_list:
    dic[key].sort()

for key in x_list:
    print('%d %d' %(key, dic[key].y.pop()))
'''
n = int(input())
arr = []
for _ in range(n):
    x, y = map(int, input().split())
    arr.append([x,y])
arr.sort()
for value in arr:
    print('%d %d' %(value[0], value[1]))