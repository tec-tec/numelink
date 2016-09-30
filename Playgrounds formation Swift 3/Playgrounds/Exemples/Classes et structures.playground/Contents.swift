/*:
# Classes et structures

## Bases sur les structures et les classes : Propriétés et instanciation

Définition d'une structure avec quelques propriétés

*/

struct Engine {
    
    var name = "Engine"
    var horsePower = 0
    var nbOfCylinder = 0
    var fuel = "Diesel"
}

//: On peut créer une instance de Engine en utilisant les valeurs par défaut avec cette syntaxe

var defaultEngine = Engine()

//: Libre à nous, ensuite, de personnaliser nos propriétés non constantes
defaultEngine.name = "Default Engine"
defaultEngine.horsePower = 90
defaultEngine.nbOfCylinder = 4
defaultEngine.fuel = "Super"

//: Ou on peut créer une instance personnalisée avec l'initialiseur automatiquement généré pour la structure (c'est une des spécificités des structures : elles possèdent un initialiseur par défaut qui permet de définir toutes les propriétés).
let anotherEngine = Engine(name: "Another Engine", horsePower: 120, nbOfCylinder: 4, fuel: "Ethanol")

//: Il n'est pas possible de modifier les propriétés d'une instance de structure constante, même si la propriété est variable (vous pouvez décommenter le code pour tester)
//anotherEngine.horsePower = 150
//: Définition d'une classe avec quelques propriétés

class Vehicule {
    
    //Propriétés stockées
    var name = "Not Branded"
    var speed = 0
    var engine = Engine()
    
}
/*:

Création d'un véhicule avec les valeurs par défaut. **Il n'existe pas d'initialiseur généré automatiquement pour une classe.** Ce sera à nous d'écrire cet initialiseur, comme nous allons le voir dans le chapitre suivant.

*/

var aVehicule = Vehicule()

//: Et on le personnalise

aVehicule.name = "A vehicule with a default engine"
aVehicule.engine = defaultEngine

/*: Les classes, à la différences des structures, peuvent hériter les unes des autres.

Définition d'une classe héritant d'un autre classe
*/

class Car: Vehicule {
    
    var convertible = false
    var automatic = false
}

var myCar = Car()
myCar.name = ""

/*:

## Propriétés calculées

On rajoute à la classe Engine une propriété calculée en utilisant une extension (on parlera plus en détail de l'extension plus tard). Une propriété calculée ne stocke aucune valeur, mais met à disposition des accesseurs (get et set). Si une propriété calculée ne sert qu'a retourner une valeur, on peut ne pas déclarer de set. Elle sera alors en "lecture seule".
*/

extension Engine {

    var computedName: String {
        
        get {
            
            return "Moteur \(fuel) \(horsePower) ch"
            
        }
        
        set (newComputedName){
            print(newComputedName)
        }
        
    }
    
}

var eng = Engine(name: "Engine1", horsePower: 120, nbOfCylinder: 4, fuel: "Diesel")

eng.computedName
defaultEngine.computedName
//defaultEngine.computedName = "Toto"

/*:

## Propriétés de type

Définition de propriétés de type calculées et stockées pour une structure

*/

struct MyStruct {
    
    static var aStoredTypeProperty = "Some value"
    
    static var aComputedTypeProperty: Int {
        
        return 42
    }
}

print(MyStruct.aStoredTypeProperty)
print(MyStruct.aComputedTypeProperty)

//: Définition de propriétés de type calculée pour une classe

class MyClass {
    
    static var aComputedTypeProperty: Int {
        
        return 42
    }
}

print(MyClass.aComputedTypeProperty)

/*:
## Observateurs

L'ajout d'observateurs permet d'executer un code particulier à chaque fois qu'une propriété est modifiée. On peut éxécuter du code juste avant la modification (et récupérer la future valeur avec newValue), ou juste après (et récupérer la valeur qu'avait la propriété avant le changement avec oldValue).

*/
class AnotherClass{
    
//:Cette classe possède une propriété stockée avec des observateurs
    var observedProperty: String = "Initial Value" {
        
        willSet{
            print("Will set \"\(newValue)\" instead of \"\(observedProperty)\"")
        }
        
        didSet{
            print("Did set \"\(observedProperty)\" instead of \"\(oldValue)\"")
        }
    }
}

var anInstance = AnotherClass()
anInstance.observedProperty

//: Si on modifie la valeur, les observateurs en sont notifiés (voir résultat sur la console)
anInstance.observedProperty = "A new string value"

/*: # Méthodes

Les méthodes sont des fonctions définies pour un type en particulier. Elles se déclarent donc exactement comme des fonctions.

Nommage des paramètres de méthodes en Swift

*/
extension Car {
    
    func increaseSpeed(by increment: Int){
        speed += increment
    }
    
    func increaseSpeed(by increment: Int, numberOfTime:Int){
        speed += increment * numberOfTime
    }
    
/*: La convention par défaut est à **utiliser autant que possible**. Cependant, dans certains cas, il peut être souhaitable de ne pas avoir de noms pour nos arguments (attention dans ce cas à ce que le role de chaque argument soit évident).
    
    Méthode dans laquelle on a explicitement retiré les noms externes pour les paramètres en utilisant un _.
*/
    
    func changeColor(_ red: Int, _ blue: Int, _ green: Int) {
        
    }
    
/*: À l'inverse, parfois on peut souhaiter préciser un nom pour un argument pour une meilleure compréhension.
    
    Méthode pour laquelle on a modifié le nom externe pour le premier paramètre en le précisant.
    
*/
    
    func changeColor(withRed red: Int, blue: Int, green: Int) {
        
    }
}

myCar.increaseSpeed(by: 50)
myCar.increaseSpeed(by: 10, numberOfTime: 5)

myCar.changeColor(255, 255, 255)
myCar.changeColor(withRed: 255, blue: 255, green: 255)

/*: 
Afin de permettre a un type valeur (instance de structure par exemple) la modification de ses propriétés depuis une méthode, il faut que celle-ci soit déclarée mutating. *Cela n'est pas nécéssaire avec les types référence (instance de classes).*
*/

extension Engine {
    
    mutating func add(newCylinders numberOfNewCylinders: Int) {
        
        nbOfCylinder = nbOfCylinder + numberOfNewCylinders
        
    }
}

defaultEngine.add(newCylinders: 2)


extension Vehicule {
    
    func replaceNameBy(name: String){
        
        self.name = name
    }
}

