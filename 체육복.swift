import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    var check = [Int](repeating: 1, count: n + 1)
    
    for i in 0..<reserve.count{
        check[reserve[i]] = 2
    }
    
    for i in 0..<lost.count{
        if check[lost[i]] == 2 { check[lost[i]] = 1 }
        else { check[lost[i]] = 0 }
    }
    
    for i in 1...n{
        if check[i] == 0{
            if check[i - 1] == 2 {
                check[i] = 1
                check[i - 1] = 1
                continue
            }
            if i != n {
                if check[i + 1] == 2 {
                    check[i] = 1
                    check[i + 1] = 1
                }
            }
        }
    }
    
    return check.filter{$0 > 0}.count - 1 // check[0] = 1으로 되어 있기 때문에, -1을 해야됨
}
