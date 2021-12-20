import sys

def solution(participant, completion):
    for value in completion:
        if value in participant: participant.remove(value)
    return participant[0]

print(solution(["leo", "kiki", "eden"], ["eden", "kiki"]))