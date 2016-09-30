//: Playground - noun: a place where people can play

import Foundation
import CoreGraphics

var a = 5
let b = 2

let c: Float = Float(a) / Float(b)

let f = 4

let tab: [String] = []

tab.isEmpty

let dico = [String:Int]()

dico.isEmpty

var villes = ["Paris","Bordeaux","Lyon","Marseille"]
villes.append("St-Etienne")

villes += ["Nantes"]

villes[2] = ""
villes.count
villes[0...f] = ["SF", "New York"]

villes.isEmpty


var nbHabitants = ["Paris" : 2_250_000, "Bordeaux" : 239_000, "Lyon" : 491_268, "Marseille" : 850_636]

nbHabitants["Nantes"] = nil
nbHabitants.removeValue(forKey: "Nantes")

var ensemble: Set<String> = ["Paris"]


for i in 0 ..< 10 {

}

let str = "test"

switch str {
case "toto":
    break
case "test" where f == 5:
    print("test")
case "test" where f == 4:
    print("test2")
default:
    print("default")
}


func say(_ message: String, to destinataire: String) {

    print("Dit: \(message) à \(destinataire)")
}

var str2 = "Bonjour"

say(str2, to: "")


func double(_ number: Int) {
    number * 2
}

double(5)

let intValue: Int! = Int("j2")


let compare = { (n1: Int, n2: Int) -> Bool in
    return n1 > n2
}

compare(100,30)

let tabInt = [5, 10, 54, 2]

tabInt.sorted(by: >)


tabInt


func bigger <T: Comparable > (x1: T, x2: T) -> Bool {

    print(type(of: x1).self)
    return x1>x2
}



bigger(x1: "c", x2: "b")

protocol Living {

    var age: Int { get set }
}

class Animal {

    static var maxAge = 17

    let name: String = "Médor"
}

class Dog: Animal, Living {

    static func specificDog() -> Dog {
        return Dog()
    }

    var age: Int = 0 {

        willSet {
            if age < 0 {

            }
        }

        didSet{
            if age < 0 {
                age = 0
            } else {
                print("Hapy Birthday \(oldValue) \(age)")
            }
        }
    }

    lazy var flemme: String = {
        //open un fichier et récupere une string
        let str = "toto"

        return str
    }()

    func barck() {

    }

    func happyBirthday() {
        age += 1
    }
}

struct Cat: Living {

    static var maxAge = 17

    var age: Int = 0
    let name: String = "Félix"

    var humanAge: Int { return age * 7 }

    mutating func happyBirthday() {
        age += 1
    }
}

let médor = Dog()
var felix = Cat(age: 5)

médor.flemme

médor

let sultan = médor
let garfeild = felix

médor.age += 1
felix.age += 1

sultan.age = -10
sultan.age
Cat.maxAge = 7

struct Point {
    var x: Int
    var y: Int
}

struct Size {
    var height: Int
    var width: Int
}

struct Rect {
    var origin: Point
    var size: Size

    var center: Point {
        get {
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }

        set {
            origin.x = newValue.x - size.width / 2
            origin.y = newValue.y - size.height / 2
        }
    }
}

var rect = Rect(origin: Point(x:10, y:10), size: Size(height:10, width: 10))

rect.center = Point(x: 2, y: 2)
rect.origin

//: ## Transtypage

let aDog = Dog()

let anAnimal = aDog as Animal

let aRealDog = anAnimal as! Dog

class Caniche: Dog {

    var stupidName = ""
    var owner: Owner?
}

class Owner {
    var name = ""
}

let bijou = Caniche() as Animal
let stupid = (bijou as? Caniche)?.stupidName

if bijou is Caniche {
    print("Do !")
    (bijou as? Caniche)?.stupidName
}

let caniche2 = Caniche()
let proprio = caniche2.owner?.name

//: ## Enums
/*
enum FlightStatus: String {
    case late
    case onTime
    case cancelledWithNoReasons
}

struct Flight {

    let flightNumber: String
    var status: FlightStatus
}

var af89 = Flight(flightNumber: "AF89", status: .onTime)

af89.status.rawValue
let ws = "LATE"
let status = FlightStatus(rawValue: ws)
*/

enum FlightStatus {
    case late (delay: Int, message: String?)
    case onTime
    case cancelled (message: String)

    func stringValue() -> String {
        switch self {
        case .late:
            return "Late"
        case .onTime:
            return "On Time"
        case .cancelled:
            return "Cancelled"
        }
    }

    static func status(from string: String) -> FlightStatus? {
        switch string {
        case "Late":
            return .late(delay: 0, message: nil)
        case "On Time":
            return .onTime
        case "Cancelled":
            return .cancelled(message: "No info yet")
        default:
            return nil
        }
    }
}

struct Flight {

    let flightNumber: String
    var status: FlightStatus
}

var af89 = Flight(flightNumber: "AF89", status: .onTime)
af89.status = .late(delay: 5, message: nil)

switch af89.status {
case .onTime:
    print("Tout va bien… Pour le moment…")
case .late (let delay,_) where delay <= 15:
    print("Retard de \(delay) minutes, mais tout va bien.")
case .late (let delay,let message) where delay > 15:
    print("Retard de \(delay) minutes, Ça commence à faire long.")
case .late:
    print("Retard")
case .cancelled:
    print("Dommage pour les vacances")
}

if let stat = FlightStatus.status(from: "Late") {
    af89.status = stat
} else {
    af89.status = .onTime
}

//nil-coalescing operator
af89.status = FlightStatus.status(from: "Late") ?? .onTime

struct Encapsulator {

    var encaps: String

    init?(fileUrl: String) {

        guard fileUrl.characters.count > 3 else {
            return nil
        }

        //Open the file

        defer {
            //Close the file
            b = "Fini"
        }

        var b = "ahah"

        guard fileUrl.characters.count > 3 else {
            return nil
        }

        b = "b"
        print(b)
        guard fileUrl.characters.count > 3 else {
            return nil
        }

        guard fileUrl.characters.count > 3 else {
            return nil
        }

        encaps = "Toto"
    }
}


let result = try? JSONSerialization.jsonObject(with: Data(), options: .allowFragments)

//:### Petite fonction de log qui peut servir

enum LogLevel: String {
    case Log = ""
    case Warn = "WARN: "
    case Info = "INFO: "
    case Error = "ERROR: "
}

func log(_ str: String, level: LogLevel = .Log, file: String = #file, function: String = #function) {
//    #if DEBUG
        let urlOfFile = NSURL(fileURLWithPath: file)
        let file = urlOfFile.deletingPathExtension!.lastPathComponent
        let errorLocalization = file + "." + function
        printWithDatePrefix(errorLocalization + " -> " + level.rawValue + str)
//    #endif
}

private func printWithDatePrefix(_ str: String) {

    print(Date().description + " " + str)
}


log("Toto")
log("Danger", level: .Error)

//: ### Bon moyen de stocker des constantes

struct Constants {
    struct Defaults {
        static let userAge = "userAge"
    }

    struct Notifs {
        static let didSave = "NotificationOfBiduleDidChange"
    }
}

enum FormError: Error {
    case nameTooShort
    case invalidBirthDate
    case missingCoins (coinsMissing: Int)
}

func doSomethingRisky() throws -> String {

    throw FormError.missingCoins(coinsMissing: 5)
}

func somethingElseRisky() {

    var str: String = "toto"

    do {
        str = try doSomethingRisky()
    } catch FormError.missingCoins (let missing) {
        print("There is not enough coins, missing : \(missing)")
    } catch {
        print(error)
    }

    print(str)
}

somethingElseRisky()


do {
    try FileManager().attributesOfItem(atPath: "Roto")
} catch {
    print(error)
}



