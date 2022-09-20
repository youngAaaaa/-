import Foundation

func visit(_ n: Int, _ r: Int, _ c: Int) -> Int{
    if n == 0{
        return 0
    }
    let half = Int(pow(Double(2), Double(n - 1)))
    
    if r < half, c < half { return visit(n-1, r, c) }
    else if r < half, c >= half { return 1 * half * half + visit(n-1, r, c-half) }
    else if r >= half, c < half { return 2 * half * half + visit(n-1, r-half, c) }
    else { return 3 * half * half + visit(n-1, r-half, c-half) }
}


let nrc = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nrc[0], r = nrc[1], c = nrc[2]

print(visit(n, r, c))
