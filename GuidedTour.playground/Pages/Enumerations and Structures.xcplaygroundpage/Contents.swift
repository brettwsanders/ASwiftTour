//: ## Enumerations and Structures
//:
//: Use `enum` to create an enumeration. Like classes and all other named types, enumerations can have methods associated with them.
//:
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
            case .ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
let king = Rank.king
let kingRawValue = king.rawValue
let seven = Rank.seven
let sevenRawValue = seven.rawValue

func maxCard(card1: Rank, card2: Rank) -> Int {
    if (card1.rawValue > card2.rawValue) {
        return card1.rawValue
    } else {
        return card2.rawValue
    }
}

var result1: Int =  maxCard(card1: ace, card2: king)
var result2: Int =  maxCard(card1: king, card2: seven)
var result3: Int =  maxCard(card1: seven, card2: ace)

print(result1, "should be 13")
print(result2, "should be 13")
print(result3, "should be 7")

//: - Experiment:
//: Write a function that compares two `Rank` values by comparing their raw values.
//:
//: By default, Swift assigns the raw values starting at zero and incrementing by one each time, but you can change this behavior by explicitly specifying values. In the example above, `Ace` is explicitly given a raw value of `1`, and the rest of the raw values are assigned in order. You can also use strings or floating-point numbers as the raw type of an enumeration. Use the `rawValue` property to access the raw value of an enumeration case.
//:
//: Use the `init?(rawValue:)` initializer to make an instance of an enumeration from a raw value. It returns either the enumeration case matching the raw value or `nil` if there is no matching `Rank`.
//:
if let convertedRank = Rank(rawValue: 1) {
    let ace = convertedRank.simpleDescription()
}
if let convertedRank = Rank(rawValue: 11) {
    let eleven = convertedRank.simpleDescription()
}
if let convertedRank = Rank(rawValue: 0) {
    let zero = convertedRank.simpleDescription()
}
if let convertedRank = Rank(rawValue: 15) {
    let fifteen = convertedRank.simpleDescription()
}


//: The case values of an enumeration are actual values, not just another way of writing their raw values. In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one.
//:
enum Suit: Int {
    case spades = 1
    case hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
            case .spades:
                return "spades"
            case .hearts:
                return "hearts"
            case .diamonds:
                return "diamonds"
            case .clubs:
                return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        default:
            return "error"
        }
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

let clubs = Suit.clubs
let clubsColor = clubs.color()

enum Month: Int {
    case jan = 1
    case feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec
    func getMonthNum() -> Int {
        return self.rawValue
    }
}

let d = Month.dec
let j = Month.jan
d.getMonthNum()
j.getMonthNum()


//: - Experiment:
//: Add a `color()` method to `Suit` that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
//:
//: Notice the two ways that the `hearts` case of the enumeration is referred to above: When assigning a value to the `hearts` constant, the enumeration case `Suit.hearts` is referred to by its full name because the constant doesn’t have an explicit type specified. Inside the switch, the enumeration case is referred to by the abbreviated form `.hearts` because the value of `self` is already known to be a suit. You can use the abbreviated form anytime the value’s type is already known.
//:
//: If an enumeration has raw values, those values are determined as part of the declaration, which means every instance of a particular enumeration case always has the same raw value. Another choice for enumeration cases is to have values associated with the case—these values are determined when you make the instance, and they can be different for each instance of an enumeration case. You can think of the associated values as behaving like stored properties of the enumeration case instance. For example, consider the case of requesting the sunrise and sunset times from a server. The server either responds with the requested information, or it responds with a description of what went wrong.
//:
enum ServerResponse {
    case result(String, String)
    case owner(String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let owner = ServerResponse.owner("Brett")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
    case let .result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
    case let .owner(name):
        print("Server owner name is \(name)")
    case let .failure(message):
        print("Failure...  \(message)")
}

switch owner {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .owner(name):
    print("Server owner name is \(name)")
case let .failure(message):
    print("Failure...  \(message)")
}

//: - Experiment:
//: Add a third case to `ServerResponse` and to the switch.
//:
//: Notice how the sunrise and sunset times are extracted from the `ServerResponse` value as part of matching the value against the switch cases.
//:
//: Use `struct` to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.
//:
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    func createDeck() -> [Card] {
        var n = 1
        var deck = [Card]()
        // loop through each suit
        while let s = Suit(rawValue: n) {
            // loop through each rank
            var m = 1
            while let r = Rank(rawValue: m) {
                // add suit-rank card to deck
                deck.append(Card(rank: r, suit: s))
                m += 1
            }
            n += 1
        }
        return deck
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
let deck = threeOfSpades.createDeck()

//: - Experiment:
//: Add a method to `Card` that creates a full deck of cards, with one card of each combination of rank and suit.
//:


//: [Previous](@previous) | [Next](@next)
