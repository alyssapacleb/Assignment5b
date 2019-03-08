//
//  AnimalsTableViewController.swift
//  Assignment5b
//
//  Created by Argandona Vite, Angel R on 3/5/19.
//  Copyright © 2019 Pacleb, Alyssa June N. All rights reserved.
//

import UIKit

// Class that defines each Animal.
class Animal {
    
    // Description of animal to be displayed
    var gallery_name: String
    var identifier: String
    var name: String
    var scientificName : String
    var _class : String
    var size : String
    var image : String
    
    init(gallery_name: String, identifier: String, name: String, scientificName: String, _class: String, size: String, image: String){
        self.gallery_name = gallery_name
        self.identifier = identifier
        self.name = name
        self.scientificName = scientificName
        self._class = _class
        self.size = size
        self.image = image
    }
}

struct currentGallery {
    static var currentIdentifier = "shark"
    static var currentGalleryName = "Shark Images"
}

class AnimalsTableViewController: UITableViewController {
    
    // Array of each animal class
    var animals = [Animal]()
    
    // Take data from the plist, convert each item into an Animal class.
    private func accessAnimalsPlist(){
        let inputFile = Bundle.main.path(forResource:"AnimalsTable", ofType: "plist")
        let inputArray = NSArray(contentsOfFile: inputFile!)
        for input in inputArray as! [Dictionary<String, String>] {
            animals.append(Animal(gallery_name: input["gallery_name"]!, identifier: input["identifier"]!, name: input["name"]!, scientificName: input["scientific name"]!, _class: input["class"]!, size: input["size"]!, image: input["image"]!))
        }
    }
    
    // set up the first page with the animals array.
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        accessAnimalsPlist()
        tableView.rowHeight = 80
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // The number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        // The number of rows is the number of animals multiplied by 2.
        return 2*animals.count
    }
    
    // Populate the contents of each cell.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Each cell is assigned as the variable "cell"
        var cell : UITableViewCell?
        
        // If the cell is even (aka 0, 2, 4, 6): This is an image cell
        if indexPath.row % 2 == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
            let animal = animals[indexPath.row/2]
            cell!.textLabel?.text = animal.name
            cell!.imageView?.image = UIImage(named: animal.image)
        }
        
        // if this is an odd cell (aka 1, 3, 5, 7): this is an info cell
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath)
            cell!.textLabel?.numberOfLines = 0
            let animal = animals[(indexPath.row-1)/2]
            let text = "Scientific Name: " + animal.scientificName + "\nClass: " + animal._class + "\nSize: " + animal.size
            //print(text)
            cell!.textLabel?.text = text
        }

        return cell!
    }

    
    // Determine which animal's gallery to display based on which cell was selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            currentGallery.currentIdentifier = animals[indexPath.row/2].identifier
            currentGallery.currentGalleryName = animals[indexPath.row/2].gallery_name
            print("Animal selected: \(currentGallery.currentIdentifier)")
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    */

}
