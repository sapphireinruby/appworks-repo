import UIKit

var greeting = "Hello, playground"


//Object-Oriented Swift

//1. Declare a class Animal with property gender and method eat(). The data type of gender should be enum Gender as below and when you call eat() method, it will print
//I eat everything!
//enum Gender {
//    case male
//    case female
//    case undefined
//}


class Animal {
    let animal: String // let animalName: String
    enum Gender {
        case male
        case female
        case undefined
        }
    init(animal : String){
        self.animal = animal
    }
    
    func eat(){
        print("I eat everything!")
    }
}

//2. Declare three classes: Elephant, Tiger, Horse that inherits from Animal and override the eat method to print what they usually eat.

class Elephant : Animal{  //父子關係
    override func eat() {
        print("I eat fruit!")
    }
}
class Tiger : Animal{
    override func eat() {
        print("I eat other animals!")
    }
}
class Horse : Animal{
    override func eat() {
        print("I eat grass!")
    }
}


//3. Declare a class Zoo with a property weeklyHot which means the most popular one in the zoo this week. The codes below can’t work correctly, please find what data type should A be and solve the problem. Note that tiger, elephant, and horse are instances of class Tiger, Elephant, and Horse, respectively.

//class Zoo {
//    var weeklyHot: A
//    init(weeklyHot: A) { }
//}
//let zoo = Zoo(weeklyHot: Tiger())
//zoo.weeklyHot = tiger
//zoo.weeklyHot = elephant
//zoo.weeklyHot = horse

class Zoo {
    var weeklyHot: Animal
    init(weeklyHot: Animal) {
        self.weeklyHot = weeklyHot
    }
}

let elephant = Elephant(animal: "elephant")
let tiger = Tiger(animal: "tiger")
let horse = Horse(animal: "horse")
let cat = Animal(animal: "cat")

let zoo = Zoo(weeklyHot: cat)
zoo.weeklyHot = tiger
zoo.weeklyHot = elephant
zoo.weeklyHot = horse


/*4. What’s the difference between Struct and Class ?
 5. What’s the difference between instance method and type method ?
 6. What does Initilizer do in class and struct ?
 7. What does self mean in an instance method and a type method ?
 8. What’s the difference between reference type and value type ?**/

//Enumerations and Optionals in Swift

//1

enum Gasoline: String {
    case oil92, oil95, oil98, oildiesel
}

enum GasolinePrice: Int {
    case oil92 = 10, oil95, oil98, oildiesel
}

func getPrice(from oil: GasolinePrice) {
    print(oil.rawValue)
}

getPrice(from: .oildiesel)

enum GasolineValue: String {
    case oil92 = "92", oil95 = "95", oil98 = "98", oildiesel = "diesel"
}
func getRawValue(from oil: GasolineValue) {
    print(oil.rawValue)
}

getRawValue(from: .oil95)


//enum values are themselves by defult.
//However, it’s useful to be able to store values of other types alongside these case values. This additional information is called an associated value, and it varies each time you use that case as a value in your code.
//We can define Swift enumerations to store associated values of any given type, and the value types can be different for each case of the enumeration if needed.


//2.
/*2. Optional is a very special data type in Swift. Take var a: Int? = 10 for example, the value of a will be nil or Int. You should have learned how to deal with Optional.
 ● People would like to have pets, but not everyone could have one.
 Declare a class Pet with name property and a class People with pet property which will store a Pet instance or nil.
 Please try to figure out what data type is suitable for these properties in Pet and People.
 ● Please create a People instance and use guard let to unwrap the pet property.
 ● Please create another People instance and use if let to unwrap the pet property.*/

class Pet {
    var name: String
    
    init(name: String) {
      self.name = name
    }
}

class People {
    //var a: Int? = 10
    var pet: String?
}

let lily = People()

//func getMyPet() {
//    guard let myPet = People() else {
//        return
//    }
//
//    print(myPet)
//}
//
//getMyPet(lily)


func getMeaningOfLife() -> Int? {
    42
}

func printMeaningOfLife() {
    guard let name = getMeaningOfLife() else {
        return
    }

    print(name)
}
printMeaningOfLife()
