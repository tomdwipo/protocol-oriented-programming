import Foundation

//Defining a protocol
protocol MyProtocol {
    // protocol definition here
}
//How to use in struct
struct MyStruct: MyProtocol {
    //implementation here
}
//How to use in class
class MyClass: MyProtocol {
    //implementation here
}

//Property requirements read-write properties
protocol FullNames {
    var firstName: String { get set }
    var lastName: String { get set }
}

//Property requirements read properties
protocol ReadOnly {
    var readOnly: String { get }
}

//Property requirements read with static properties
protocol StaticRead {
    static var typeProperty: String { get }
}

//Method requirement
protocol FullName {
    var firstName: String { get set }
    var lastName: String { get set }
    
    func getFullName() -> String
}

//if we want to modify the instances that it belongs to, we use mutating --> it is only use for value type (struct, enum) not for class (reference type)
// mutating func changeName()

//optional Requirement
//It is important to note that only classes can adopt protocols that use the
//@objc attribute. Structures and enumerations cannot adopt these
//protocols

@objc protocol Phone {
 var phoneNumber: String {get set}
 @objc optional var emailAddress: String {get set}
 func dialNumber()
 @objc optional func getEmail()
}

// to use optional Requirement
class PhoneImpl: Phone {
    var phoneNumber: String
    
    init(phoneNumber: String){
        self.phoneNumber = phoneNumber
    }
    
    func dialNumber() {
        
    }
}

//Protocol inheritance
protocol Persona: FullName {
    var age: Int { get set }
}

// example to use
struct Student: Persona {
    var age: Int = 0
    var firstName: String = ""
    var lastName: String = ""
   
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }
}

//Protocol composition
//Protocol composition lets our types adopt multiple protocols.
//This is a major advantage that we get when we use protocols rather than a class hierarchy because classes, in Swift and other single-inheritance languages, can only inherit from one superclass.
 //example
//struct MyStruct: ProtocolOne, ProtocolTwo, Protocolthree {
// //implementation here
//}
//Protocol composition allows us to break our requirements into many smaller components
//rather than inheriting all the requirements from a single protocol or single superclass.


//Using protocols as a type
protocol Person {
 var firstName: String {get set}
 var lastName: String {get set}
 var birthDate: Date {get set}
 var profession: String {get}
 init(firstName: String, lastName: String, birthDate: Date)
}

struct Personn: Person {
    var firstName: String
    
    var lastName: String
    
    var birthDate: Date
    
    var profession: String
    
    init(firstName: String, lastName: String, birthDate: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        self.profession = ""
    }
    
    
}


func updatePerson(person: Person) -> Person {
    let newPersona: Person = person
    // Code to update person goes here
    return newPersona
}

var personArray = [Person]()
var personDict = [String: Person]()

struct SwiftProgrammer: Person {
    var firstName: String
    var lastName: String
    var birthDate: Date
    var profession: String
    
    init(firstName: String, lastName: String, birthDate: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        self.profession = ""
    }
}

struct FootballPlayer: Person {
    var firstName: String
    var lastName: String
    var birthDate: Date
    var profession: String
    
    init(firstName: String, lastName: String, birthDate: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        self.profession = ""
    }
}

//Polymorphism with protocol
var myPerson: Person
myPerson = SwiftProgrammer(firstName: "Jon", lastName: "Hoffman",birthDate: Date())
myPerson = FootballPlayer(firstName: "Dan", lastName: "Marino", birthDate: Date())
//=================|||||===================

var programmer = SwiftProgrammer(firstName: "Jon", lastName: "Hoffman", birthDate: Date())
var player = FootballPlayer(firstName: "Dan", lastName: "Marino",
 birthDate: Date())

var people: [Person] = []
people.append(programmer)
people.append(player)

//Type casting with protocols
if myPerson is SwiftProgrammer {
 print("(person.firstName) is a Swift Programmer")
}

for person in people where person is SwiftProgrammer {
 print("\(person.firstName) is a Swift Programmer")
}

if let _ = myPerson as? SwiftProgrammer {
 print("(person.firstName) is a Swift Programmer")
}

//Associated types with protocols
protocol Queue {
 associatedtype QueueType
 mutating func addItem(item: QueueType)
 mutating func getItem() -> QueueType?
 func count() -> Int
}
//The associated type basically says: we don't know the exact type to use therefore, when a type adopts this protocol, it will define it.
struct IntQueue: Queue {
    typealias QueueType = Int
    var items = [Int]()
    mutating func addItem(item: Int) {
        items.append(item)
    }
    
    mutating func getItem() -> Int? {
        if items.count > 0 {
            return items.remove(at: 0)
        }else{
            return nil
        }
    }
    
    func count() -> Int {
        return items.count
    }
    
    
    
}
