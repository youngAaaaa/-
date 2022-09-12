import Foundation

while(true){
    let input = readLine()!
    let reversedInput = String(input.reversed())
    
    if input == "0" {
        break
    }
    else{
        if input == reversedInput{
            print("yes")
        }
        else{ print("no")}
    }
}
