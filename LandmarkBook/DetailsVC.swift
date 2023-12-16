//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by Batuhan Çalın on 16.12.2023.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var landmarkLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarkLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
        
    }
    
}
