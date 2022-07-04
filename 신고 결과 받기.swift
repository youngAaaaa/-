import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let reports = Array(Set(report))
    var ans = [Int](repeating: 0, count: id_list.count)
    var id_Idx = [String:Int]() // 유저ID : id_list인덱스번호
    var singo_dict = [String:[String]]() //신고당한유저ID:신고한유저ID

    for (index, id) in id_list.enumerated(){
        id_Idx[id] = index
        singo_dict[id] = []
    }

    for i in reports{
        let input = i.split(separator: " ").map{$0}
        let user_ID = String(input[0])
        let singo_User = String(input[1])
    
        singo_dict[singo_User]!.append(user_ID)
    }

    for i in id_Idx{
        if singo_dict[i.key]!.count >= k{
            singo_dict[i.key]!.forEach({ name in
                ans[id_Idx[name]!] += 1
            })
        }
    }
    
    return ans
}
