import UIKit

//## Git & GitHub
//
//●    git status: Show the working tree status.
//It lets you see which changes have been staged, which haven’t, and which files aren’t being tracked by Git.
//
//●    git add: Add file contents to the index.
//This command updates the index using the current content found in the working tree, to prepare the content staged for the next commit.
//
//●    git commit: Record changes to the repository
//Create a new commit containing the current contents of the index and the given log message describing the changes.
//
//●    git log: Show commit logs.
//List commits that are reachable by following the parent links from the given commit(s), but exclude commits that are reachable from the one(s) given with a ^ in front of them. The output is given in reverse chronological order by default.
//
//●    git push [ Repo_name ] [ Branch_name ]:
//to upload local repository content to a remote repository.
//
//●    git remote -v: Manage set of tracked repositories
//Manage the set of repositories ("remotes") whose branches we track.
//
//●    git branch: List, create, or delete branches.
//
//●    fork: is a copy of a repository (repo) that sits in your account rather than the account from which you forked the data from.

//3.
//
//To create a new repo: use the git init command.
//git init is a one-time command to use during the initial setup of a new repo. Executing this command will create a new .git subdirectory in the current working directory. This will also create a new main branch.
//
//git remote command is used to make the remote connections such as connecting a Git local repository with GitHub remote repository.
//git remote can be considered as a reference to the GitHub repositories which do not provide any real-time access to what you do locally i.e. whatever you do locally will not be reflected on your GitHub repository without your permission.

//## Basic

//1.

let Pi: Double = 3.14


//2.

let az: Int = 9
let otherVaccine: Int = 2
let average: Int = (az + otherVaccine) / 2


//3.

let doubleAverage = Double(average)


//(10 /3) is a number type Int operation return the Int value, the quotient: 3, without the left over.
//( 10.0 / 3.0 ) is a Floating-point type or Double type return the same type, the quotient and remainder: 3.3333


//4.

var flag: Bool = true
var inputString: String = "Hello world."
let bitsInBite: Int = 8
let averageScore: Double = 86.8


//5.

var salary = 22000
salary += 28000


//6.

//Equality operator in swift:  (a == b)


//7.

let constant1 = 10
let constant2 = 3
let remainder = constant1 % constant2


//8.

//let is used to declare a constant value.
//It creates immutable variables, value cannot be changed after it is created.
//
//var defines an ordinary variable.
//It creates mutable variables, the value can be changed to a different value in the future.


//9.

//Constant and variable names can contain almost any character, including Unicode characters.
//
//Constant and variable names can’t contain whitespace characters, mathematical symbols, arrows, nor can they begin with a number
//
//One popular convention is CamelCasing.
//One important tip to naming is to make it effectively communicates the semantic meaning of its value.


//10.

//Swift is a type-safe language, which means the language helps us to be clear about the types of values our code can work with.
//If part of our code requires a String, type safety prevents us from passing it an Int by mistake.
//
//If you don't specify the type of value you need, Swift uses type inference to work out the appropriate type. Type inference enables a compiler to deduce the type of a particular expression automatically when it compiles our code, simply by examining the values we provide.


//11.

//Once the type of a variable is declared (or inferred) the type cannot change. Trying to change the type of it will result in an error.


//## Collection

//1.

var myFriends: [String] = []


//2.

myFriends += ["Ian", "Bomi", "Kevin"]


//3.

myFriends.append("Michael")

//or
//myFriends += ["Michael"]


//4.

myFriends.remove(at: 3)
myFriends.insert("Michael", at: 0)
//or after appended Michael:
//myFriends.swapAt(0,3)


//5.    Use for…in to print all the friends in array.

for friend in myFriends {
    print(friend)
}


//6.    Now I want to know who is at index 5 in the myFriends array, try to find the answer for me. Please explain how you get the answer and why the answer is it.

//We can use
//print(myFriends[5])
//to print out the answer, however, there will be an error.
//Because the index is out of range of the array, which only have 4 items, that the index 5 doesn’t exist.


//7.

myFriends[0]
myFriends.first


//8.

myFriends[(myFriends.count) - 1]
myFriends.last


//9.

var myCountryNumber: [String: Int] = [:]


//10.

myCountryNumber = ["US": 1, "GB": 2, "JP":81]


//11.    Change the ‘GB’ value from 44 to 0.

myCountryNumber["GB"] = 0


//12.

// We can use sytax as:
// var namesOfDictionary: [Int: String] = [:]
// to creat an empty dictionary

//var emptyStringDict: [String: String] = [:]


//13.    How to remove a key-value pair in a dictionary?

//Assign nil to an existing key, the key and its associated value are removed.
myCountryNumber["GB"] = nil


//## Control Flow

//1.

//For-Loop:
let lottoNumbers = [10, 9, 8, 7, 6, 5]
for i in 3..<lottoNumbers.count {
         print(lottoNumbers[i])
                }

//Range:
var lastThreeNumbers = lottoNumbers [3...5]
print(lastThreeNumbers)


//2.    Please use swift syntax to get the result as images list below :
//.5
//.6
//.7
//.8
//.9
//.10
//
//
//.10
//.8
//.6

var lottoNumbersVar = [10, 9, 8, 7, 6, 5]
lottoNumbersVar.reverse()
for i in lottoNumbersVar {
    print(i)
}

//5
//6
//7
//8
//9
//10

for i in lottoNumbers {
    if i % 2 == 0 {
        print(i)
    }
}

//10
//8
//6


//3.    Please use a while loop to solve the above question.

var j = 0
while j < lottoNumbersVar.count {
    let numbers = lottoNumbersVar[j]
    print(numbers)
    j += 1
}

//5
//6
//7
//8
//9
//10

//4.    Please use a repeat-while loop to solve question 2.

var numbers = [10, 9, 8, 7, 6, 5]
var index = 0
repeat {
    print(numbers[index])
    index += 2
} while index < numbers.count

//10
//8
//6


//5.

//The repeat-while loop, also called "Do-loop," it will pass through the loop block first, before considering the loop’s condition. It then continues to repeat the loop until the condition is false.


//6.

//if isRaining = true {
//    print("It’s raining, I don’t want to work today.”)
//} else {
//    print(“Although it’s sunny, I still don’t want to work today.”)
//}



//7. In a company, we usually use numbers to represent job levels. Let’s make an example.
//There are four job levels: Member, Team Leader, Manager, and Director.
//We use 1 for the Member, 2 for Team Leader, 3 for Manager, and 4 for Director.
//Now, create a variable name jobLevel and assign a number to it.
//If the jobLevel number is in our list, print the relative job title name; if not, just print “We don't have this job”. Please use a switch statement to complete this requirement.

var jobLevel = 4

switch jobLevel {
case 1:
  print("Member")
case 2:
  print("Team Leader")
case 3:
  print("Manager")
case 4:
  print("Director")
default:
  print("We don't have this job.")
}


// Function

//1.
print("***")
func greet(person: String) -> String {
     let greeting = "Hello, " + person
     return greeting
     }
    print(greet(person: "Luke"))


//2.    Please declare a function named multiply with two arguments a and b .
//This
//function won’t return any value and will only print out  the result of a * b .
//Be noticed that we want to give argument b a default value of 10.

func multiplyTwoInts(_ a: Int, _ b: Int = 10) -> Int {
    return a * b
}


//3.

//A function declares its parameters in its parameter list.
//When we call a function, we provide values as argument for the function's parameters
//The argument label is used when calling the function; each argument is written in the function call with its argument label before it. The parameter name is used in the implementation of the function. By default, parameters use their parameter name as their argument label.


//4.

//func birthday( ) -> String {
//
//}
// return String type
//func payment( ) -> Double {
//
//}
//
//return Double type
