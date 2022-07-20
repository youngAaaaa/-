import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var failRate = [(Int, Double)]()
    var cnt = [Int](repeating: 0, count: N + 2) // 스테이지에 머물러 있는 인원수
    
    stages.forEach {
        cnt[$0] += 1
    }
    
    var player = stages.count
    for i in 1...N{
        let fail = Double(cnt[i]) / Double(player)
        failRate.append((i, fail))
        player -= cnt[i]
    }
    
    return failRate.sorted(by: { $0.1 > $1.1 }).map({ $0.0 })
}
