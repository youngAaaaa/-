import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var ans = 0
    
    var tmpBoard = board
    var stack = [Int]()
    
    for move in moves{
        for i in 0..<tmpBoard.count{
            let cur = tmpBoard[i][move - 1]
            
            if cur != 0{
                if stack.last == cur{
                    stack.removeLast()
                    ans += 2
                    tmpBoard[i][move - 1] = 0
                }
                else {
                    stack.append(cur)
                    tmpBoard[i][move - 1] = 0
                }
                break
            }
        }
    }
    
    return ans
}
