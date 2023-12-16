//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Batuhan Çalın on 16.12.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
        tableView.dataSource = self
        tableView.delegate = self
    
        
        landmarkNames.append("Machu Picchu")
        landmarkNames.append("Angkor Wat")
        landmarkNames.append("Petra")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Çin Seddi")
        landmarkNames.append("Parthenon")
        landmarkNames.append("Tac Mahal")
        landmarkNames.append("Paskalya Adası")
        landmarkNames.append("Giza Piramitleri")
        landmarkNames.append("Chichén Itzá")
        
        
        landmarkImages.append(UIImage(named: "machu-picchu.png")!)
        landmarkImages.append(UIImage(named: "angkor-wat.jpg")!)
        landmarkImages.append(UIImage(named: "petra.jpg")!)
        landmarkImages.append(UIImage(named: "Stonehenge.jpg")!)
        landmarkImages.append(UIImage(named: "cin-seddi.jpg")!)
        landmarkImages.append(UIImage(named: "The-Parthenon.jpg")!)
        landmarkImages.append(UIImage(named: "tac-mahal.jpg")!)
        landmarkImages.append(UIImage(named: "paskalya-adasi.jpg")!)
        landmarkImages.append(UIImage(named: "giza-piramitleri.jpg")!)
        landmarkImages.append(UIImage(named: "Chichen-Itza.jpg")!)

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            
            let destinatitonVC = segue.destination as! DetailsVC
            destinatitonVC.selectedLandmarkName = chosenLandmarkName
            destinatitonVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
}

