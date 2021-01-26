'''
# Question
따라서, 숌은 첫 번째 영화의 제목은 세상의 종말 666, 두 번째 영화의 제목은 세상의 종말 1666 이렇게 이름을 지을 것이다. 
일반화해서 생각하면, N번째 영화의 제목은 세상의 종말 (N번째로 작은 종말의 숫자) 와 같다.
숌이 만든 N번째 영화의 제목에 들어간 숫자를 출력하는 프로그램을 작성하시오. 
숌은 이 시리즈를 항상 차례대로 만들고, 다른 영화는 만들지 않는다.

# Input
첫째 줄에 숫자 N이 주어진다. N은 10,000보다 작거나 같은 자연수이다.

# Output
첫째 줄에 N번째 영화의 제목에 들어간 수를 출력한다.
'''
'''
666
1666
2666
3666
4666
5666
6660
6661
6662
6663
6664
6665
6666
6667
6668
6669
7666
8666
9666
10666
'''

def firstAnswer():
    n = int(input())
    result = 666
    while True:
        result_str = str(result)
        for idx in range(len(result_str)-2):
            if result_str[idx] == result_str[idx+1] == result_str[idx+2] == '6': 
                n -= 1
                if n == 0: 
                    print(result_str)
                    exit()
                break
        result += 1

# 간결한 답지
n = int(input())
result = 665
while n:
    result += 1
    if '666' in str(result): n -= 1
print(result)