import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var sort_d = d
    sort_d.sort()
    
    var sum = budget
    var cnt = 0
    
    for buseo in sort_d{
        if sum - buseo < 0 { break }
        sum -= buseo
        cnt += 1
    }
    
    return cnt
}
