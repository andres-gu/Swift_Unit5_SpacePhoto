//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Andres Gutierrez on 1/30/18.
//  Copyright © 2018 Andres Gutierrez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var apodImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        fetchPhotoInfo { (photoInfo) in
            if let photoInfo = photoInfo {
                DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.descriptionLabel.text = photoInfo.description
                    if let copyright = photoInfo.copyright {
                        self.copyrightLabel.text = "Copyright \(copyright)"
                    } else {
                        self.copyrightLabel.text = "v"
                    }
                }
            }
        }
        
    
     
        
        
    }
    
    
    
    
    
}
