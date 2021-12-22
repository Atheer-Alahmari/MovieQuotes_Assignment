//
//  ImageAnswer_ViewController.swift
//  MovieQuotes_Assignment
//
//  Created by Atheer Alahmari on 18/05/1443 AH.
//

import UIKit

class ImageAnswer_ViewController: UIViewController {
    var linkImage_CorrectAns : String?
    @IBOutlet weak var image_CorrectAns: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let linkImage_CorrectAns = linkImage_CorrectAns{
                if let url = URL.init(string:linkImage_CorrectAns) {
                    image_CorrectAns.kf.setImage(with: url)
                   }
        }
        
    }
    

   

}
