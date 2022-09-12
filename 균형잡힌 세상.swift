import Foundation

while(true){
    let input = readLine()!
    
    if input == "."{
        break
    }
    else{
        let ans = check(input)
        print(ans)
    }
}

func check(_ input: String) -> String{
    var ans = "no"
    var stack = [String]()
    
    for i in input{
        if i == "(" || i == "["{
            stack.append(String(i))
        }
        else{
            if i == ")" || i == "]"{
                if stack.isEmpty {
                    return ans
                }
                if i == ")" && stack.removeLast() != "("{
                    return ans
                }
                if i == "]" && stack.removeLast() != "["{
                    return ans
                }
            }
        }
    }
    if stack.isEmpty{
        ans = "yes"
    }
    return ans
}
