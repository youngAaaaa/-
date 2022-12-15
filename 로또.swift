import Foundation

while true {
    let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
    if input[0] == 0 { exit(0) }
    
    let k = input[0]
    let s = input[1...input.count-1].map({ $0 })
    
    var selected = [Int]()
    
    dfs(0)
    
    func dfs(_ depth: Int) {
        if depth == 6 {
            print(selected.map({ String($0) }).joined(separator: " "))
            return
        }
        
        for data in s {
            if !selected.contains(data), selected.last ?? 0 <= data {
                selected.append(data)
                dfs(depth + 1)
                selected.removeLast()
            }
        }
    }
    
    print()
}
