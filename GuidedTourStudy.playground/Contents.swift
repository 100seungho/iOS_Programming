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
        return "The price of \(name) is $\(price). Do you want to order?"
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
//: These values are represented as optionals. An optional value either contains a value or contains nil to indicate that a value is missing
