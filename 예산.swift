import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var sortD = d
    sortD.sort()
    
    var sum = budget
    var cnt = 0
    
    for buseo in sortD{
        if sum - buseo < 0 { break }
        sum -= buseo
        cnt += 1
    }
    
    return cnt
}
