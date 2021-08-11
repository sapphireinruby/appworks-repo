import UIKit

var greeting = "Hello, playground"


//Object-Oriented Swift

//1. Declare a class Animal with property gender and method eat(). The data type of gender should be enum Gender as below and when you call eat() method, it will print
//I eat everything!

enum Gender {
    case male
    case female
    case undefined
    }

class Animal {
    let gender: Gender
    let animal: String
    
    init(gender: Gender, animal : String){
        self.animal = animal
        self.gender = gender
    }
    
    func eat(){
        print("I eat everything!")
    }
}

//2. Declare three classes: Elephant, Tiger, Horse that inherits from Animal and override the eat method to print what they usually eat.

class Elephant : Animal{  // 冒號為父子關係, Elephant is the subclass of Animal; Animal is parent or superclass of Elephant
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

let elephant = Elephant(gender: Gender.male, animal: "elephant")
let tiger = Tiger(gender: Gender.female, animal: "tiger") // 冒號為 key: value關係
let horse = Horse(gender: Gender.undefined, animal: "horse")

//let cat = Animal(animal: "cat")
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
//Some differernces of Structures and Classes are:
//Structures instances are value types, Classes instances are reference types;
//Structures instances are values, Classes instances are object with identity; Structures copy the value when used in new places, Classes share their data; Structures are immutable when they're ceclared as constants, while Class properties remain mutable.


// 5. What’s the difference between instance method and type method ?
//
// Methods are functions that are associated with a type. All methods are functions, but not all functions are methods.
// We need an instance to execute an instance method, an instance method cannot be called on a type.
//
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

// "self" is a reference to the current object (“instance”) of a class (or struct), within that class. It can access instance properties and methods.
// This “self” written with in lowercase, and it’s generally followed by a dot and a property or function name.

//struct Weather {
//
//  let speedOfWind: Int
//  let chanceRaining: Int
//
//  init(speedOfWind: Int, chanceOfRain: Int) {
//    self.speedOfWind = speedOfWind
//    self.chanceRaining = chanceRaining
//  }
//
//  func isDayForWalk() -> Bool {
//    let comfortableSpeedOfWind = 5
//    let acceptableChanceRaining = 30
//    return self.windSpeed <= comfortableSpeedOfWind
//      && self.chanceRainingn <= acceptablechanceRaining
//  }
//
//}

//The example above, "self" property inside init(speedOfWind, chanceRaining) and isDayForWalk() is the current instance of this Weather structure. It allows to set and access the structure properties self.speedOfWind and self.chanceRaining.

//In the other hand, "self" refers to a type (rather than to an instance) when used in a type method. It’s often a placeholder for another type, like Self.Element in an array of integer numbers, or the example below.

//struct Const {
//  static let minLimit = 0
//  static let maxLimit = 250
//  static func getLimitRange() -> ClosedRange<Int> {
//    return self.minLimit...self.maxLimit
//  }
//}
//print(Const.getLimitRange()) // => 0...250


// 8. What’s the difference between reference type and value type ?

//Copying a reference implicitly creates "a shared instance." After a copy, two variables then "refer to a single instance of the data", so modifying color in the second variable, the stolenMacBook also affects the original one.

class MacBook {
   
   var year: Int
   var color: String
   
   init(year: Int, color: String) {
       self.year = year
       self.color = color
   }
}


let myMacBook = MacBook(year: 2019, color: "Space Grey")
let stolenMacBook = myMacBook

stolenMacBook.color = "Matte Black"
print(myMacBook.color) //Matte Black

//value type,on the other hand, is that "copying" the effect of assignment, initialization, and argument passing, creates an "independent instance" with its own unique copy of its data.

struct iPhone {
   var number: Int
   var color: String
}


let myiPhone = iPhone(number: 7, color: "White")
var stoleniPhone = myiPhone

stoleniPhone.color = "Rose Gold"
print(myiPhone.color) //White

//The example above, when we declare the stoleniPhone, it's an independent instance. So whe we assign new color to it, the color of myiPhone remain the same.


//Enumerations and Optionals in Swift

//1.
// create an enum named Gasoline to model gasoline

//enum Gasoline: String {
//    case oil92
//    case oil95
//    case oil98
//    case oildiesel
//}


// Every kind of gasoline has its price. Please create a method named getPrice in Gasoline enum that will return different prices depending on different gasoline.

enum Gasoline {
    case oil92
    case oil95
    case oil98
    case oildiesel
    
    }



/*Please establish raw values for Gasoline. The data type of raw value should be String. For example, Gasoline.oil92.rawValue should be "92" */

//enum Gasoline: String {
//    case oil92 = "92", oil95 = "95", oil98 = "98", oildiesel = "diesel"
//}
//
//print (Gasoline.oil92.rawValue)

//func getRawValue(from gas: Gasoline) {
//    print(gas.rawValue)
//}

// test run:getRawValue(from: .oil92) //92

// test run: GasolineRawValue.oil98.rawValue //98

//Assigning raw Value with Int
//
//enum GasolinePrice: Int {
//    case oil92 = 10_000, oil95, oil98, oildiesel
//}
// // 10_000 easier to read the numbers.
// // Assign raw value, it's attching the value to the enum cases. Compiler will automatically increment the values if you provide the first one and leave out the rest
//
//func getPriceTwo(from oil: GasolinePrice) {
//    print(oil.rawValue)
//}
//
//getPriceTwo(from: .oildiesel) //10003


//Please explain what enum associated value is and how it works.

//enum values are themselves by defult.
//However, it’s useful to be able to store values of other types alongside these case values. This additional information is called an associated value, and it varies each time you use that case as a value in your code.
//We can define Swift enumerations to store associated values of any given type, and the value types can be different for each case of the enumeration if needed.


//2.
/*Declare a class Pet with name property and a class People with pet property which will store a Pet instance or nil.*/

class Pet {
    var name: String
    
    init(name: String) {
      self.name = name
    }
}

//let myCat = Pet(name: "Nana")
//myCat.name //Nana


class People {
    
    var pet: Pet?
    init(pet: Pet){
        self.pet = pet
    }
    
    init(){} // init for nil
}


// Please create a People instance and use guard let to unwrap the pet property.

var puppy = Pet(name: "Lucky")
//puppy.name //Lucky

var ladyM = People(pet: puppy)
ladyM.pet //Pet


func getPet(pet: Pet?){
    guard let pet = pet else {
        print("No pet to guard QQ")
        return
    }
    print("This lucky person got a pet, named\(pet.name)!")
}

// getPet(pet: ladyM.pet)  //This lucky person got a pet, Lucky!






// Please create another People instance and use if let to unwrap the pet property.

 // if let

//if let pet = lilyHasADogWonder.pet {
//    print("This person has a pet named \(pet)!")
//} else {
//    print("This poor persone got no pet QQ")
//} //This person has a pet named Wonder!

//The "guard let" assignement will be available for the rest of the function,while the "if let" assignment is only available within the "if let" statement.


// Protocol in Swift
 
//1. Declare a struct Person with a name property type String and a protocol name PoliceMan. There is only one method arrestCriminals with no argument and return void in the protocol.
// protocols: a common contract or a blue print


protocol PoliceMan
{
    func arrestCriminals() -> ()
}

//struct Person {
//    var name: String
//}


//2. Make struct Person conform to PoliceMan protocol.

//struct Person: PoliceMan {
//    func arrestCriminals() { // we can have anything here, but this func must have inside Person
//    }
//}

//Once a type implements all members of a protocol, the type is said to conform to the protocol. A type promises that everything the protocol declares inside of it, the type will have all those things


//3. Declare a protocol ToolMan with a method fixComputer that has no argument and
//return void.

protocol ToolMan {
    func fixComputer() -> ()
}

// Void is actually just a typealias for (). This means you could have written () -> Void as () -> ().
// A function’s parameter list however must always be surrounded by parentheses, so Void -> () or Void -> Void are invalid.

//4. Add a property toolMan to the struct Person with data type ToolMan.

struct Person: PoliceMan {
    var name: String
    
    var toolMan: ToolMan
    
    func arrestCriminals() {
    }
}


//5. Declare a struct named Engineer that conforms to the ToolMan protocol.

struct Engineer: ToolMan {
    func fixComputer() {}
}


//6. Create a Person instance with the name Steven and also create the relative data you need to declare this instance.

let steven = Person(name: "Steven", toolMan: ToolMan.self as! ToolMan)


//Error Handling in Swift
  
enum GuessNumberGameError: Error {
    case wrongNumber
}

class GuessNumerGame {
    var targetNumber = 10

    func guess(number: Int) throws {

        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber
        }

        print("Guess the right number: \(targetNumber)")
    }

}

do {
    let whatsThisGame = GuessNumerGame()
    try whatsThisGame.guess(number: 20)
} catch {
    print("Sorry, it's not the right number.")
}
