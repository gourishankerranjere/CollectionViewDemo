//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Gourishanker on 05/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var animalCV: UICollectionView!
    
    
    var wildAnimalList : [Animal] = []
    var domesticAnimalList : [Animal] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        animalCV.dataSource = self
        animalCV.delegate = self
        populateData()
        print("view did load executed")
    }
    func populateData()
    {
        wildAnimalList.append(Animal(name: "Tiger", picture: "Tiger", population: 100))
        wildAnimalList.append(Animal(name: "Lion", picture: "Lion", population: 200))
        wildAnimalList.append(Animal(name: "Panda", picture: "panda", population: 1))
        wildAnimalList.append(Animal(name: "Elephant", picture: "elephant", population: 2036))
        wildAnimalList.append(Animal(name: "camel", picture: "camel", population: 567))
        wildAnimalList.append(Animal(name: "cat", picture: "cat", population: 5657))
        
        domesticAnimalList.append(Animal(name: "squirrel", picture: "squirrel", population: 6868))
        
        
        domesticAnimalList.append(Animal(name: "Rat", picture: "rat", population: 575765))
        domesticAnimalList.append(Animal(name: "Cat", picture: "cat", population: 575765))
        domesticAnimalList.append(Animal(name: "Dog", picture: "dog", population: 575765))
        domesticAnimalList.append(Animal(name: "Bat", picture: "bat", population: 575765))
        domesticAnimalList.append(Animal(name: "Rabbit", picture: "rabbit", population: 575765))
        domesticAnimalList.append(Animal(name: "Goat", picture: "goat", population: 575765))
    }

}
extension ViewController :UICollectionViewDataSource
{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0
        {
            
            return wildAnimalList.count
        }else {
            return domesticAnimalList
                .count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell 
    {
        
        // create  cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "animalcell", for: indexPath) as! AnimalCell
        
        var animal : Animal
        
        //bind cell
        if indexPath.section == 0{
            animal = wildAnimalList[indexPath.item]
        }else{
            animal = domesticAnimalList[indexPath.item]
        }
        cell.name.text = animal.name
        cell.img.image = UIImage(named: animal.picture)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath) as! SectionHeader
        
        if indexPath.section == 0
        {
            view.headerLabel.text = "Wild Animals"
        }else{
            view.headerLabel.text = "Domestic Animals"
        }
        
        return view
    }
    
    
    
}

extension ViewController : UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       if  indexPath.section == 0
        {
           // wild
           
           let animal = wildAnimalList[indexPath.item]
           let details = "wild animal \(animal.name) population : \(animal.population)"
           showAlert(title: details, msg: nil)
       }else
        {
           //domestic
           let animal = domesticAnimalList[indexPath.item]
           let details = "domestic animal \(animal.name) population : \(animal.population)"
           showAlert(title: details, msg: nil)
       }
    }
}

