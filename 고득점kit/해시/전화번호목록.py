import sys

def solution(phone_book):
    phone_book = sorted(phone_book)
    for pivot in range(0, len(phone_book)-1):
        prefixWord = phone_book[pivot]
        targetPrefixWord = phone_book[pivot+1][:len(prefixWord)]
        if prefixWord == targetPrefixWord: return False
    return True

print(solution(["12","123","121","1211","1235","567","88"]))