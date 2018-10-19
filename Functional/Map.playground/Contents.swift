let numbers = [1, 2, 3, 2, 5, 6, 3]
let scores = [[5,2,7], [4,8], [9,1,3]]
let allScores = scores.flatMap { $0 }
print(allScores)

let myNames: [String?] = ["John", "Joe", "Jack", nil, "test", "oho"]
let myCounts = myNames.compactMap { $0?.count }
print(myCounts)
