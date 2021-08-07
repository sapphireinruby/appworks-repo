import UIKit

var greeting = "Hello, playground"


//Object-Oriented Swift

//1. Declare a class Animal with property gender and method eat(). The data type of gender should be enum Gender as below and when you call eat() method, it will print
//I eat everything!


class Animal {
    let animal: String // or let animalName: String
    
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

class Elephant : Animal{  // 冒號為父子關係, Animal is parent or superclass
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
let tiger = Tiger(animal: "tiger") // 冒號為 key: value關係
let horse = Horse(animal: "horse")
//let cat = Animal(animal: "cat")
//
//let zoo = Zoo(weeklyHot: cat)
let zoo = Zoo(weeklyHot: tiger)
zoo.weeklyHot = tiger
zoo.weeklyHot = elephant
zoo.weeklyHot = horse


//4. What’s the difference between Struct and Class ?
//
// A class is a blueprint or template for an instance of that class.
// Classes do not come with synthesized memberwise initializers.
// Classes support inheritance, whereas structures don't.
// The inheritance design pattern is very important in object-oriented programming.
//
// In the above question, the Animal class is the parent or superclass of class Elephant, class Tiger and class Horse.
// This means that the Elephant class inherits the properties and behavior of the Animal class. We can initialize another animal instance, by invoking the custom initializer defined in the Animal class.
//
// Structures are value types, which means that they are passed by value.
// A lot of types that we've been using are structures, like Int, Bool, String, Array, and Dictionary.
//
//Other differernces of Structures and Classes are:
//Structures instances are value types, Classes instances are reference types;
//Structures instances are values, Classes instances are object with identity; Structures copy the value when used in new places, Classes share their data; Structures are immutable when they're ceclared as constants, while Class properties remain mutable.


// 5. What’s the difference between instance method and type method ?

// Methods are functions that are associated with a type. All methods are functions, but not all functions are methods.
// We need an instance to execute an instance method, an instance method cannot be called on a type.

// Sometimes there may be a function that's not specific to one instance of a class.  In this case, we can use a type method.  It is a method associated with the type, and not a specific instance. It only be called on the type that defines the type method.


// 6. What does Initilizer do in class and struct ?

// Initialization is the process of preparing an instance of a class, structure, or enumeration for use.
// This process involves setting an initial value for each stored property on that instance and performing any other setup or initialization that’s required before the new instance is ready for use. Swift initializers don’t return a value.
// Classes and structures must set all of their stored properties to an appropriate initial value by the time an instance of that class or structure is created. Stored properties can’t be left in an indeterminate state.

// Initializers are called to create a new instance of a particular type. Written using the init keyword:

//init() {
//    // perform some initialization here
//}

// Structure types automatically receive a memberwise initializer if they don’t define any of their own custom initializers. Unlike a default initializer, the structure receives a memberwise initializer even if it has stored properties that don’t have default values.
// Unlike a struct, a class doesn’t provide a memberwise initializer automatically — which means we must provide it if we need it. Without providing an initializer, the Swift compiler will flag that as an error:

// 7. What does self mean in an instance method and a type method ?
// 8. What’s the difference between reference type and value type ?

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

//Please explain what enum associated value is and how it works.

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
    
    init (name: String) {
      self.name = name
    }
}

class People {
    let owner: String
    var pet: String?
    init (owner: String, pet: String? = nil){
        self.owner = owner
        self.pet = pet
    }

}


let lily = People(owner: "Lily", pet: "Mango")


func getMyPet(owner: String, pet: String?) {
    guard let myPet = People() else {
        return nil
    }

    print(myPet)
}

getMyPet(owner: "Lily", pet: "Mango")


//func getMeaningOfLife() -> Int? {
//    42
//}
//
//func printMeaningOfLife() {
//    guard let name = getMeaningOfLife() else {
//        return
//    }
//
//    print(name)
//}
//printMeaningOfLife()
