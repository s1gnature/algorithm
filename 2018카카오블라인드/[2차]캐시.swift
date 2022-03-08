func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    if cacheSize == 0 { return cities.count * 5 }
    var res = 0
    var cacheStack = [String]()
    cities.forEach { city in
        let city = city.uppercased()
        if let idx = cacheStack.firstIndex(of: city) {
            res += 1
            cacheStack.remove(at: idx)
        } else {
            res += 5
            if cacheStack.count == cacheSize { cacheStack.removeFirst() }
        }
        cacheStack.append(city)
    }
    return res
}