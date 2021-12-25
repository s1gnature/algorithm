import sys

def solution(clothes):
    answer = 1
    dic = {}
    cnt_arr = []

    for cloth in clothes:
        value = cloth[0]
        key = cloth[1]
        if key in dic: dic[key] = dic[key] + [value]
        else: dic[key] = [value]

    for key in dic.keys():
        cnt_arr.append(len(dic[key]))

    for cnt in cnt_arr:
        answer *= (cnt + 1)
        
    return answer - 1

tc1 = [["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]]
tc2 = [["crowmask", "face"], ["bluesunglasses", "face"], ["smoky_makeup", "face"]]
print(solution(tc1))