import sys

def solution(participant, completion):
    result = set(participant) - set(completion)
    if len(result) == 0:
        for value in completion:
            if participant.count(value) - completion.count(value) == 1: return value
    else: return list(result)[0]

print(solution(["leo", "kiki", "eden"], ["eden", "kiki"]))