import Foundation

func PaintingChess(chess: [[String]], startRow: Int, startCol: Int, startColor: String) -> Int{
    var ans = 0
    var expectedColor = startColor
    
    for i in startRow...startRow+7 {
        for j in startCol...startCol+7 {
            let currentColor = chess[i][j]
            if currentColor != expectedColor {
                ans += 1
            }
            if j < (startCol + 7) {
                expectedColor = expectedColor == "W" ? "B" : "W"
            }
        }
    }
    
    return ans
}

let nm = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nm[0]
let m = nm[1]

var chess = [[String]]()
for _ in 0..<n{
    let input = readLine()!.map({ String($0) })
    chess.append(input)
}

var minCnt = 64
for i in 0...n - 8{
    for j in 0...m - 8{
        let wStart = PaintingChess(chess: chess, startRow: i, startCol: j, startColor: "W")
        let bStart = PaintingChess(chess: chess, startRow: i, startCol: j, startColor: "B")
        let change = min(wStart, bStart)
        if change < minCnt {
            minCnt = change
        }
    }
}
print(minCnt)
