import Foundation

func binarySearch(target: Int, array: [Int]) -> Int {
    var left = 0, right = array.count - 1
    while left <= right {
        let mid = (left + right) / 2
        if target > array[mid] {
            left = mid + 1
        }
        else if target < array[mid]{
            right = mid - 1
        }
        else { //target == array[mid]
            return 1
        }
        
    }
    return 0
}

let n = Int(readLine()!)!
var arrN = readLine()!.split(separator: " ").map({ Int(String($0))! })
arrN.sort()

let m = Int(readLine()!)!
var arrM = readLine()!.split(separator: " ").map({ Int(String($0))! })
for num in arrM{
    print(binarySearch(target: num, array: arrN))
}
