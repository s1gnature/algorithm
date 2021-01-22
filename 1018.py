'''
# 1018. 체스판 다시 칠하기

# Question
첫째 줄에 N과 M이 주어진다. N과 M은 8보다 크거나 같고, 50보다 작거나 같은 자연수이다. 
둘째 줄부터 N개의 줄에는 보드의 각 행의 상태가 주어진다. B는 검은색이며, W는 흰색이다.

# Output
첫째 줄에 지민이가 다시 칠해야 하는 정사각형 개수의 최솟값을 출력한다.
'''

# WB, BW 로 이루어진 체스판과 BW, WB 로 이루어진 체스판을 기준으로 
# 현재 가져온 8x8 사이즈의 체스판에서 둘 중 바꿔야 할 문자가 적은 값을 반환합니다.
def WBBW_Board_min(arr, x, y):
    WB_diff_cnt = 0
    BW_diff_cnt = 0
    x_start_index = x-8
    y_start_index = y-8
    for y_index in range(y_start_index, y):
        index = 0
        for x_index in range(x_start_index, x):
            if int(y_index) % 2 == 0:
                if WB_borad[index] != arr[y_index][x_index]: WB_diff_cnt += 1
                if BW_borad[index] != arr[y_index][x_index]: BW_diff_cnt += 1
            else:
                if BW_borad[index] != arr[y_index][x_index]: WB_diff_cnt += 1
                if WB_borad[index] != arr[y_index][x_index]: BW_diff_cnt += 1
            index += 1
    return (WB_diff_cnt if WB_diff_cnt < BW_diff_cnt else BW_diff_cnt)


WB_borad = 'WBWBWBWB'
BW_borad = 'BWBWBWBW'
n, m = map(int, input().split())
arr = []
for _ in range(n):
    arr.append(input())

WB_result_arr = []
BW_result_arr = []
result_arr = []
for y_index in range(8, n+1):
    for x_index in range(8, m+1):
        result_arr.append(WBBW_Board_min(arr, x_index, y_index))
print(min(result_arr))