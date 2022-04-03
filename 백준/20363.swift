let xy = readLine()!.split(separator: " ").map{ Int($0)! }
print(xy[0]+xy[1]+min(xy[0], xy[1])/10)