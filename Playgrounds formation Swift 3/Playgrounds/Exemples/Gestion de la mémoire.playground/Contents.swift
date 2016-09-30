/*:
# Gestion de la mémoire : ARC
En Swift, la gestion de la mémoire est effectuée de manière automatique, mais néanmoins performante.

Un mécanisme, nommé ARC (pour Automatic Reference Counting) analyse notre cote est s'occupe de gérer un "compteur de référence".

Ce compteur de référence indique le nombre de référence qui utilise une instance de classe (les instance de structures sont des types valeur, et ne sont donc pas concernés par ARC)

Le but de ARC est donc de détruire un objet si, et seulement si, il n'est plus référencé nul part. ARC va donc gérer pour nous le compteur de référence de l'objet : l'augmenter si on référence l'objet depuis une autre variable, le diminuer si on déréférence l'objet. Quand le compteur tombe à 0, l'objet n'est plus référencé par aucune variable, il peut donc être détruit en toute sécurité. L'environnement d'exécution (runtime) va alors détruire l'objet

Reprenons donc le code vu dans le chapitre Désinitialisation :
*/
enum Gender {

	case Male
	case Female
}

class Human {

    var age: Int
	let name: String
	var size: Float
	var gender: Gender
	var child: Human?
//    var father: Human?
    weak var father: Human?


	init() {

		self.age = 0
		self.name = "John Doe"
		self.size = 175
		self.gender = Gender.Male

		self.child = nil
		self.father = nil

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
Nous créons donc une instance de notre classe, référencée depuis la variable aHuman
*/
var aHuman: Human? = Human(name: "Paul Auchon", age: 30, size: 180, gender: Gender.Male)
/*:
Nous avons également deux autres variables Human optionnelles
*/
var aSecondHuman: Human?
var aThirdHuman: Human?
/*:
Ces variables optionnelles vont référencer l'instance précédemment créée
*/
aSecondHuman = aHuman
aThirdHuman = aSecondHuman
/*: 
On peut vérifier simplement que ces 3 variables référencent bien le même objet en modifiant l'objet depuis l'un des variables, et en observant le changement pour les autres variables
*/
aHuman!.age = 31

aSecondHuman!.age
aThirdHuman!.age

aHuman! === aSecondHuman!
aSecondHuman! === aThirdHuman!
/*:
Il est donc clair que nos 3 variables référencent la même instance
On va maintenant déréférencer progressivement notre objet. Actuellement, il est utilisé depuis 3 variables, son compteur de référence est donc à 3.
*/
aHuman = nil
/*:
On a détruit une des références vers l'objet, son compteur est maintenant à 2
*/
aThirdHuman = nil
/*:
L'objet n'est plus référencé que par aSecondHuman, son compteur est à 1
*/
aSecondHuman = nil
/*:
Le compteur de l'objet est à 0, il a été détruit.
## Cycles de références fortes
*/
var aFather: Human? = Human(name: "Paul Auchon", age: 35, size: 183, gender: Gender.Male)
var aSon: Human? = Human(name: "Luc Auchon", age: 3, size: 95, gender: Gender.Male)

aFather!.child = aSon
aSon!.father = aFather

aFather = nil
aSon = nil
/*:
On se retrouve ici avec un cycle de référence forte. Les instances aSon et aFather restent en mémoire car elles se référencent l'une l'autre.
Pour éviter ce cas, on peut déclarer la propriété father comme étant une référence faible (*weak*)
Dans la déclaration de la classe si dessus, on déclarera father de cette façon : *weak var father: Human?*

## Cas de l'utilisation de unowned
*unowned*, comme *weak*, indique une référence faible, ne suffisant pas à maintenir une instance "en vie".
À la différence de *weak*, *unowned* ne met pas la référence à *nil* lors de la destruction de l'instance référencée (donc pas d'optionnel à utiliser). *unowned* est à utiliser lorsque l'on est certain que la référence existera pendant tout la durée de vie de l'instance.
*/
class Client {
	let name: String
    var card: CreditCard?
	init(name: String) {

		self.name = name
	}

	deinit{

		print("\(name) is being deinitialized")
	}
}

class CreditCard {
	let number: UInt
    unowned let client: Client
	init(number: UInt, client: Client) {

		self.number = number
		self.client = client
	}

	deinit{
		print("Card number \(number) is being deinitialized")
	}
}

var paul: Client? = Client(name: "Paul")
paul!.card = CreditCard(number: 1234_5678_90, client: paul!)

paul = nil
/*: 
Le fait de mettre paul à nil détruira les instances de paul et de la carte
*/
