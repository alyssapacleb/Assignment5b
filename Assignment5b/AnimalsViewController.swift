//
//  AnimalsViewController.swift
//  Assignment5b
//
//  Created by Argandona Vite, Angel R on 3/7/19.
//  Copyright © 2019 Pacleb, Alyssa June N. All rights reserved.
//

import UIKit

class GalleryItem {
    
    // Description of animal to be displayed
    var imageName: String
    var caption : String
    
    init(imageName: String, caption: String){
        self.imageName = imageName
        self.caption = caption
    }
}

class AnimalsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private let reuseIdentifier = "animalCollectionCell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow: CGFloat = 1
    
    var imagecollection = [GalleryItem]()
    
    @IBOutlet weak var AnimalsCollectionView: UICollectionView!
    
    // Take data from the plist, convert each item into an Animal class.
    private func accessAnimalsCollectionPlist(){
        let inputColFile = Bundle.main.path(forResource:"AnimalsCollection", ofType: "plist")
        let inputColArray = NSArray(contentsOfFile: inputColFile!)
        for input in inputColArray as! [Dictionary<String, String>] {
            for (key,value) in input {
                imagecollection.append(GalleryItem(imageName: key, caption: value))
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessAnimalsCollectionPlist()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagecollection.count
    }
    
    // Adjest the size of the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        print(widthPerItem)
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    // Assign content to each cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //var cell: UICollectionViewCell?
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "animalCollectionCell", for: indexPath) as! photoCell
        
        let collection = imagecollection[indexPath.row]
        cell.displayContent(image: UIImage(named: collection.imageName)!, caption: collection.caption)
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
