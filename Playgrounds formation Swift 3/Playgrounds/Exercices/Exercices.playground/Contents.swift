/*: 
# Exercices

## Classes et structures
Implémentez les classes en fonction des informations fournies et testez les. Pour chaque méthodes, et chaque action, faites une sortie console avec print() afin de savoir ce qu'il se passe.

**Classe Véhicule (Vehicule)**

Propriétés :

- name (String)

Méthodes :

- move
- stop

Lorsqu'un véhicule se déplace, il peut soit parcourir une distance définie par l'utilisateur, ou alors il parcourt 1km
*/
// Préparez votre classe Vehicule

/*:
**Structure Moteur (Engine)**

Propriétés :

- name (String)
- fuelConsumptionPerKilometers (Float)

Méthodes :
- tweakEngine

La méthode tweakEngine permet de diminuer la consommation du moteur de 10%
*/
// Préparez votre structure Engine

/*:
**Classe Véhicule motorisé (MotorizedVehicule)**

Propriétés :
- remainingFuel (Float)
- maxFuelCapacity (Float)
- range (propriété calculée, distance pouvant être parcouru en fonction de la consommation et du volume de carburant restant)
- engine (structure Engine)

Méthodes :

- move (surchargé)
- stop (surchargé)
- startEngine
- stopEngine
- refuel

Pour qu'un véhicule motorisé se déplace, son moteur doit être allumé.
Lorsqu'un véhicule motorisé se déplace, il consomme du carburant. On doit pouvoir indiquer pendant combien de kilomètre un véhicule va se déplacer et mettre à jour son volume de carburant restant. Si un véhicule ne possède pas assez de carburant pour parcourir la distance prévue, il parcourt le maximum de distance, puis s'arrête une fois le réservoir vide. Lorsqu'il n'a plus de carburant, son moteur s'arrête également.

Lorsqu'on fait le plein, on fait soit un plein complet, soit un peu préciser le volume de carburant à mettre. Si le volume est trop grand par rapport à la contenance, on s'arrête au volume max.

Par défaut, lors de la création d'une instance, le réservoir de carburant est plein.
*/
// Préparez votre sous-classe MotorizedVehicule 

/*: 
**Tests**
Faites des tests de vos instances pour vérifier leur bon fonctionnement 
*/
// Faites vos tests ici

/*:
## Initialisation

Modifiez les classes implémentées précédemment afin d'intégrer des initialiseurs pour vos classes et structures et utilisez ces initialiseurs.
*/
// Faites vos tests ici
/*:
## Désinitialisation

Modifiez les classes implémentées précédemment afin d'intégrer des désinitialiseurs pour vos classes et afficher un message lors de leurs destruction. Testez.

*/
// Faites vos tests ici
/*:
## Gestion de la mémoire : ARC
Créez une classe Person.
Propriétés : 

- name (String)
- vehicules (tableau de véhicules)
- numberOfVehicule (propriété calculées)

Faites en sorte que vos Véhicules gardent aussi une référence de leur propriétaire, en faisant attention aux cycles de références fortes.
*/
// Faites vos tests ici
