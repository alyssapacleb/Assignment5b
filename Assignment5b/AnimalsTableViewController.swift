//
//  AnimalsTableViewController.swift
//  Assignment5b
//
//  Created by Argandona Vite, Angel R on 3/5/19.
//  Copyright © 2019 Pacleb, Alyssa June N. All rights reserved.
//

import UIKit

class Animal {
    
    var name: String
    var scientificName : String
    var _class : String
    var size : String
    var image : String
    
    init(name: String, scientificName: String, _class: String, size: String, image: String){
        self.name = name
        self.scientificName = scientificName
        self._class = _class
        self.size = size
        self.image = image
    }
}

class AnimalsTableViewController: UITableViewController {
    
    var animals = [Animal]()
    
    private func accessAnimalsPlist(){
        let inputFile = Bundle.main.path(forResource:"AnimalsTable", ofType: "plist")
        let inputArray = NSArray(contentsOfFile: inputFile!)
        for input in inputArray as! [Dictionary<String, String>] {
            animals.append(Animal(name: input["name"]!, scientificName: input["scientific name"]!, _class: input["class"]!, size: input["size"]!, image: input["image"]!))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessAnimalsPlist()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell?
        
        if indexPath.row % 2 == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
            let animal = animals[indexPath.row/2]
            cell!.textLabel?.text = animal.name
            cell!.imageView?.image = UIImage(named: animal.image)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath)
            cell!.textLabel?.numberOfLines = 0
            let animal = animals[(indexPath.row-1)/2]
            let text = "Scientific Name: " + animal.scientificName + "\nClass: " + animal._class + "\nSize: " + animal.size
            print(text)
            cell!.textLabel?.text = text
        }

        return cell!
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
