/*:
# Désinitialisation

Compte tenu de son mode de fonctionnement, un playground peut ne pas désinitialiser notre objet directement. Dans ce cas, testez donc ce code depuis une console REPL (Read Eval Print Loop). Pour cela, ouvrez un Terminal sur OS X, et tapez la commande swift .
Une fois en mode REPL, collez le code ci-dessous dans la fenêtre, ou tapez le, ligne après ligne
*/
enum Gender {

	case Male
	case Female
	case Undetermined
}

class Human {

	var age: Int
	let name: String
	var size: Float
	var gender: Gender

	init() {

		self.age = 0
		self.name = "John Doe"
		self.size = 175
		self.gender = .Male

		print("\(self.name) is being created")
	}

	init(name: String, age: Int, size: Float, gender: Gender) {

		self.name = name
		self.age = age
		self.size = size
		self.gender = gender

		print("\(self.name) is being created")
	}

	deinit{

		print("\(self.name) is being destroyed")
	}
}
/*:
Afin de pouvoir détruire notre instance (= lui affecter la valeur nil), il faut que la variable soit un optionnel (d'où la précision du type Human?)
*/
var aHuman: Human?
aHuman = Human()
/*:
Notre initialiseur à bien été appelé. Pour que le désinitialiseur soit appelé, il faut que nous indiquions que nous ne souhaitons plus utiliser notre instance. On peut faire cela en lui affectant la valeur *nil*. Notre désinitialiseur sera alors appelé.
*/
aHuman = nil
