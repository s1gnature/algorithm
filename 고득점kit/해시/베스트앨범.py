import sys
from functools import reduce

def solution(genres, plays):
    answer = []
    dic = {}
    playSum_tuple = []

    for i, play in zip(range(0, len(genres)), plays):
        if not genres[i] in dic:
            dic[genres[i]] = [(play, i)]
        else:
            dic[genres[i]] += [(play, i)]
    
    for key in dic.keys():
        sumOfPlays = reduce(lambda base, x: base + x[0], dic[key], 0)
        playSum_tuple.append((key, sumOfPlays))

    playSum_tuple.sort(key=lambda x: x[1], reverse=True)

    print(dic)

    for value in playSum_tuple:
        genre = value[0]
        arr = sorted(dic[genre], key=lambda x: x[0], reverse=True)[:2]
        print(arr)
        if len(arr) == 1: answer.append(arr[0][1])
        elif arr[0][0] == arr[1][0] and arr[0][0] > arr[1][0]: answer += [arr[1][1], arr[0][1]]
        else: answer += [arr[0][1], arr[1][1]]
        
    return answer

print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 500, 500, 2500]))