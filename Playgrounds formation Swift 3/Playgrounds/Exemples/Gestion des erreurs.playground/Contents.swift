/*:
# Gestion des erreurs

## Créer une erreur
*/
//: On utilise une énumération qui se conforme au protocole *ErrorType* afin de définir une erreur.
//: L'énumération est adaptée car elle permet de spécifier différentes erreurs autour d'une même problématique, et même d'associer des valeurs à certains cas (mais dans l'absolu, on pourrait aussi utiliser une structure)

enum FoodDispenserError: Error {
    
    case OutOfStock
    case InsufficientCoins(missing: Int)
    case UnavailableChoice
}

//: On défini ensuite quelques types qui vont nous servir à tester notre génération d'erreur

struct Food {
    
    var remaining: Int
    var price: Int
}

class FoodDispenser {
    
    var inventory = ["Chips" : Food(remaining: 3, price: 2),
        "Cake" : Food(remaining: 10, price: 4)]
    var depositedCoins = 0
    
//: La méthode *vendFood* est déclarée avec *throws* car elle propage une erreur qui peut se déclencher dans son scope.
    func vend(foodName: String) throws {
        
        guard var item = inventory[foodName] else {
            
            print("Bad choice")
            
//: On lève des erreurs avec *throw*, et comme on utilise une enum, on peut préciser directement la cause de l'erreur
            throw FoodDispenserError.UnavailableChoice
        }
        
        guard item.remaining > 0 else {
            
            print("Out Of Stock")
            throw FoodDispenserError.OutOfStock
        }
        
        guard item.price <= depositedCoins else {
            
            print("Insufficient deposit")
            throw FoodDispenserError.InsufficientCoins(missing: item.price - depositedCoins)
        }
        
        print("\(foodName) sold")
        depositedCoins -= item.price
        item.remaining -= 1
        inventory[foodName] = item
        
    }
}

let machine = FoodDispenser()
machine.depositedCoins = 16

//: Ici, on va traiter l'erreur dans un bloc do-catch. On fait appel à la méthode *vendFood* dans le bloc do, avec le mot-clé *try* (car cette méthode est déclarée avec *throws*).

//try machine.vendFood("Bla")

do {
    
    try machine.vend(foodName: "Cake")
    try machine.vend(foodName: "Cake")
    try machine.vend(foodName: "Chips")
    try machine.vend(foodName: "Chips")
    try machine.vend(foodName: "Chips")
    try machine.vend(foodName: "Cips")
    
//: Ensuite, dans les blocs catch, on va attraper l'erreur qui peut survenir. Ici, l'erreur pour manque de monnaie, avec une valeur associée au cas de l'enum que l'on va pouvoir récupérer.
} catch FoodDispenserError.InsufficientCoins(let missingCoins) {
    
    print("Missing \(missingCoins) coins")
    
} catch FoodDispenserError.OutOfStock {
    
    print("Item is out of stock")

//: Si on ne précise pas le type de l'erreur que l'on veut attraper, on va attraper toutes les erreurs. On peut dans ce cas utiliser *error* pour se référer à l'erreur en question.
} catch {
    
    print(error)
}

//: Ici, on traite l'erreur comme un optionnel, avec une syntaxe if-let. Surtout utile pour appliquer un traitement simple dans le cas d'une réussite de l'appel. On peut aussi utiliser guard-let.

if let ok = try? machine.vend(foodName: "Cake") { print("Everything was OK") }

