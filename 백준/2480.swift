let input = readLine()!.split(separator: " ").sorted(by: <)
if (input[0] == input[1]) && (input[1] == input[2]) { print("\(10000 + Int(input[0])! * 1000)")}
else if (input[0] == input[1]) || (input[1] == input[2]) { print("\(1000 + Int(input[1])! * 100)")}
else { print("\(Int(input[2])! * 100)")}
