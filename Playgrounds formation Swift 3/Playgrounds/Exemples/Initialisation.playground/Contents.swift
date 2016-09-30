/*:
# Initialisation

On reprend les classes et structures vues précédemment.
*/
struct Engine {

	var name = "Engine"
	var horsePower = 0
	var nbOfCylinder = 0
	var fuel = "Diesel"
}

class Vehicule {

	var name = "Not Branded"
	var speed = 0
	var engine = Engine()
}

class Car: Vehicule {

	var convertible = false
	var automatic = false
}
/*: 
Aucune de nos classe ou structure ne possède d'initialiseurs (mis à par l'initialiseur par défaut qui utilise les valeurs initiales de nos propriétés, ou l'initialiseur généré de la structure). Ça n'est cependant pas gênant car toutes les propriétés ont une valeur par défaut. On peut donc créer des instances.
*/
var myCar = Car()
/*:
Cependant nous n'avons pas de moyen de spécifier des valeurs personnalisée directement lors de la construction de l'instance. Nous sommes obligés de le faire ensuite.
*/
myCar.name = "Kit"
myCar.speed = 50
myCar.automatic = true
/*:
Nous pouvons définir un initialiseur afin de simplifier la création de nos instances en passant directement les valeurs initiales. La présence d'un initialiseur nous permet également d'affecter une valeur spécifique à une propriété constante.
Définissons une nouvelle classe, dans laquelle nous allons définir des initialiseurs.
*/

enum Gender {
    
    case Male
    case Female
}

class Human {

	var age: Int
    var name: String
	var size: Float
	var gender: Gender
	var childrens: [String]?

	//Voici un initialiseur par défaut. Il ne prend pas de paramètres, et affecte uniquement des valeurs par défaut.
	init() {

		self.age = 0
		self.name = "John Doe"
		self.size = 175
		self.gender = Gender.Male

		self.childrens = nil
	}

	//Et voici un initialiseur personnalisé qui prend des paramètres et affecte directement les bonnes valeurs
	init(name: String, age: Int, size: Float, gender: Gender) {

		self.name = name
		self.age = age
		self.size = size
		self.gender = gender
	}

}
/*:
On peut maintenant instancier un Human soit avec l'initialiseur par défaut, soit avec l'initialiseur qui prend des paramètres.
*/
var john = Human()
var me = Human(name: "Ludovic", age: 28, size: 183, gender: Gender.Male)
/*:
Voyons le cas d'une sous-classe maintenant. Si on redéfini un initialiseur existant dans la classe parente, il faut le définir comme étant une **surcharge** avec le préfixe *override*.
On peut appeler les initialiseurs définis dans la classe parente avec *super*.
*/

class Student: Human {

	var school = "Not enrolled"
	var serious = false
	var grade = 0

	override init() {

		self.school = "Not enrolled"
		self.serious = false
		self.grade = 0
		
		super.init()
	}

	init(school: String, isSerious: Bool, grade: Int) {
        
        
		self.school = school
		self.serious = isSerious
		self.grade = grade
		
        super.init()
	}

	init(name: String, age: Int, size: Float, gender: Gender, school: String, isSerious: Bool, grade: Int) {

		self.school = school
		self.serious = isSerious
		self.grade = grade

		super.init(name: name, age: age, size: size, gender: gender)
	}

}
/*: 
On peut ensuite instancier notre classe avec les initialiseurs fournis 
*/
var aStudent = Student(school: "UPMC", isSerious: true, grade: 15)
var anotherStudent = Student(name: "Mystery Student", age: 20, size: 180, gender: Gender.Male, school: "UPMC", isSerious: false, grade: 3)
var student3 = Student()
