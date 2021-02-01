
def sec_commonValue(arr):
    set_arr = set(arr)
    result_dic = {}
    for num in set_arr:
        result_dic[num] = arr.count(num)
    result_dic = sorted(result_dic.items(), key=lambda x : x[0])
    result_dic = sorted(result_dic, key=lambda x : x[1], reverse=True)
    
    if len(result_dic) == 1: return result_dic[0][0]
    if result_dic[0][1] == result_dic[1][1]: return result_dic[1][0]
    else: return result_dic[0][0]

def find_common(arr):
    arr = set(arr)
    arr = list(arr)
    arr.sort()
    count_arr = []
    for value in arr:
        count_arr.append(arr.count(value))
    common_value = max(count_arr)
    if count_arr.count(common_value) == 1: return arr[count_arr.index(common_value)]
    else:
        count_arr.remove(count_arr[count_arr.index(common_value)])
        return arr[count_arr.index(common_value)+1]

def find_common2(arr):
    high_count_value = 0
    value_arr = []
    for value in arr:
        count_value = arr.count(value)
        if count_value > high_count_value: 
            value_arr = []
            value_arr.append(value)
            high_count_value = count_value
        elif count_value == high_count_value: value_arr.append(value)
    if len(value_arr) == 1: return value_arr[0]
    else: return value_arr[1]

def find_common3(arr):
    flag = 0
    result = 0
    curr_max_count = 0
    for value in arr:
        count_value = arr.count(value)
        if count_value > len(arr)//2: return value
        if curr_max_count < count_value:
            result = value
            curr_max_count = count_value
            flag = 0
        elif curr_max_count == count_value and flag == 0:
            if value > result:
                flag = 1
                result = value
    return result



import sys
from collections import Counter
def most_common(arr):
    if n == 1: return arr[0]
    result_counter = Counter(arr).most_common(2)
    if result_counter[0][1] == result_counter[1][1]: return result_counter[1][0]
    else: return result_counter[0][0]

# n = int(input())
n = int(sys.stdin.readline())
arr = []
for _ in range(n):
    # arr.append(int(input()))
    arr.append(int(sys.stdin.readline()))
arr.sort()

avg = round(sum(arr) / n)
mid = arr[(len(arr)-1)//2]
range_value = arr[len(arr)-1] - arr[0]
second_commonValue = most_common(arr)
print('%s\n%s\n%s\n%s' %(avg, mid, second_commonValue, range_value))