import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var waitTruckQueue = truck_weights
    var endTimeQueue = [Int]()
    var drivingTruckQueue = [Int]()
    var currWeight = 0
    var timer = 1
    while true {
        if waitTruckQueue.isEmpty && drivingTruckQueue.isEmpty { return timer - 1}
        if let endTime = endTimeQueue.last {
            if timer == endTime {
                endTimeQueue.popLast()
                currWeight -= drivingTruckQueue.popLast()!
            }
        }
        if let nextTruckWeight = waitTruckQueue.first {
            if (currWeight + nextTruckWeight) <= weight {
                let truckWeight = waitTruckQueue.removeFirst()
                currWeight += truckWeight
                drivingTruckQueue.insert(truckWeight, at: 0)
                endTimeQueue.insert(timer + bridge_length, at: 0)
            }
        }
        
        print("currTime: \(timer)")
        print("waitQueue: \(waitTruckQueue)")
        print("endTimeQueue: \(endTimeQueue)")
        print("drivingQueue: \(drivingTruckQueue)")
        print("currWeight: \(currWeight)")
        print()
        timer += 1
    }
    return 0
}

let tc1_bridge_length = 2
let tc1_weight = 10
let tc1_truck_weights = [7,4,5,6]

let tc2_bridge_length = 100
let tc2_weight = 100
let tc2_truck_weights = [10]

let tc3_bridge_length = 100
let tc3_weight = 100
let tc3_truck_weights = [10,10,10,10,10,10,10,10,10,10]

print(solution(tc3_bridge_length, tc3_weight, tc3_truck_weights))

