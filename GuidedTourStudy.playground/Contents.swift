//: @ Oct 20
//: # A Swift Tour
print("Hello, world!")

//: ## let vs. var
let contantName: String = "Seungho Baek"
var variableAge: Int = 25
variableAge += 1

//: ## Double quotation marks & include values in strings
let quotation = """
I said "I am \(variableAge) years old"
Then he said, "Well, I'm older than you dude."
"""

print(quotation)

//: ## Array & Dictionaries
var iDevices = ["iPhone", "iPad", "iPod touch"]
iDevices[0]

var Prices: [String:Any] = [
    "iPhone": 599,
    "iPad": 899,
    "iPod touch":299,
    "Mac":"1999"
]

print(Prices)

//: ### Array methods
iDevices.append("iAm")
iDevices.popLast()

//: ### Empty Array & Dictionaries
//: I used Optional Values, and I don't even know what Optional value exactly does here.
let emptyArray = [String?]()
let emptyDictionary = [String?:String?]()

//: # Control Flow
//: I'm using `class` for fun here. It's gonna be handled in detail later on. So don't worry.
class Coffee {
    var name: String
    var price: Int
    
    init(name: String, price: Int){
        self.name = name
        self.price = price
    }
    
    func priceInfo() -> String {
        return "The price of \(name) is ₩\(price). Do you want to order?"
    }
}

let menus = [Coffee(name: "Americano", price: 4400), Coffee(name: "Latte", price: 5100), Coffee(name: "Cappuchino", price: 5100)]

//: ## `for-in` statement
for menu in menus {
    if menu.price > 5000 {
        print("Sir, \(menu.name) costs more than ₩5000. You gotta pay more")
    } else {
        print("\(menu.name) will be ready in 5 minutes. Thank you.")
    }
}

//: ## `if let` statement
//: You can use `if let` statement to work with values that might be missing. These values are represented as optionals. An optional value either contains a value or contains `nil` to indicate that a value is missing. Write a question mark (?) after the type of a value to mark the value as optional.
//: `if let`

var optionalString: String? = "hello"
print(optionalString == nil)

var optionalName: String? = "Seungho Baek"
var greeting = "hello!"

if let name = optionalName {
    greeting = "Hello, \(name)"
    print(greeting)
} else {
    print("no name")
}

//: ## `??` operator
//: If the optional value is missing, the default value is used instead.
var nickName:String? = nil
var defaultName = "gorgeous"
let informalGreeting = "Hi \(nickName ?? defaultName)"

//: ## Switch statement
//: Switch statement has to be exhaustive
let menuIndex = Int.random(in: 0..<3)
let randomMenu = menus[menuIndex]
switch randomMenu.name {
case "Americano":
    print("Well, Americano is currently sold out")
case "Latte":
    print("Latte has 2 options. Regular size & Venti size. Which one do you prefer?")
default:
    print("Great choice!")
}

//: ## Dictionary with for-in statements
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

//: ## While statements
var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)


//: # Functions and Closures
//: ## Function
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Seungho", day: "Sunday")

//: ### Custom argument label + parameter name
func greet(to whom: String, on day: String) -> String{
    return "Hello \(whom), today is \(day)"
}
greet(to: "Kyle", on: "Sunday")

//: ### Tuple
var scores = [5,3,100,3,9]
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: scores)
print(statistics.sum)
print(statistics.2)

//: ### Nested functions
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

returnFifteen()

//: ### Returning Function
func makeIncrementer() -> ((Int) -> Int){
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()
increment(7)

//: ### Function as argument
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)


//: ## Closures
let mappedNumbers = numbers.map({ (number: Int) -> Int in // Use `in` to seperate the arguments and return type from the body.
    let result: Int
    if number % 2 == 0{
        result = 3 * number
    } else {
        result = 0
    }
    return result
})
print(mappedNumbers)

//: ### Omiting the type of closure's parameters and return type
let mappedNumbers2 = numbers.map({number in 3 * number})
print(mappedNumbers2)

//: ### Refering parameters by number (instead of by name)
let sortedNumbers = numbers.sorted {$0 < $1}
print(sortedNumbers)

//: # Objects and Classes
//: ## Creating an instance of a class
var Americano = Coffee(name: "Americano", price: 4100)
Americano.priceInfo()

class Automobile {
    var name: String
    var price: Int
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    func 얼마야() -> String {
        return "A price of \(self.name) is $\(String(self.price))"
    }
}

let Mercedez = Automobile(name: "e class", price: 50000)
Mercedez.얼마야()
