'''
# Question
온라인 저지에 가입한 사람들의 나이와 이름이 가입한 순서대로 주어진다. 
이때, 회원들을 나이가 증가하는 순으로, 나이가 같으면 먼저 가입한 사람이 앞에 오는 순서로 정렬하는 프로그램을 작성하시오

# Input
첫째 줄에 온라인 저지 회원의 수 N이 주어진다. (1 ≤ N ≤ 100,000)
둘째 줄부터 N개의 줄에는 각 회원의 나이와 이름이 공백으로 구분되어 주어진다. 
나이는 1보다 크거나 같으며, 200보다 작거나 같은 정수이고, 이름은 알파벳 대소문자로 이루어져 있고, 길이가 100보다 작거나 같은 문자열이다. 
입력은 가입한 순서로 주어진다.

# Output
첫째 줄부터 총 N개의 줄에 걸쳐 온라인 저지 회원을 나이 순, 나이가 같으면 가입한 순으로 한 줄에 한 명씩 나이와 이름을 공백으로 구분해 출력한다.
'''
'''
sort() 함수에서 key= 값을 lambda로 적게되면 함수의 반환값을 가져오게 되며
result.sort(key=lambda age: age[0]) 여기서는 result라는 list를 age라는 parameter로 가져와
result[0]에 있는 원소들에 대해 .sort()를 수행하고 반환한다.
'''
n = int(input())
result = []
for _ in range(n):
    age, name = input().split()
    result.append([age, name])
result.sort(key=lambda age: int(age[0]))
for value in result:
    print('%s %s' %(value[0], value[1]))