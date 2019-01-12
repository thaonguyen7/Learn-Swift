class People {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Student: People {
    var field: String
    var grade: String
    
    convenience init(field: String) {
        self.init(field: field, grade: "Very good")
    }
    
    init(field: String, grade: String) {
        self.field = field
        self.grade = grade
        super.init(name: "TNH", age: 31)
    }
}

let student1 = Student(field: "Finance")
let student2 = Student(field: "IT", grade: "Good")


