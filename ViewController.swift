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
                updateUI(with: photoInfo)
            }
        }
        
        func updateUI(with photoInfo: PhotoInfo) {
            print("photoInfo.url:: ", photoInfo.url)
            guard let url = photoInfo.url.withHTTPS() else { return }
            print(url)
            
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if let data = data, let image = UIImage(data: data) { DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.apodImageView.image = image
                    self.descriptionLabel.text = photoInfo.description
                    
                    if let copyright = photoInfo.copyright {
                        self.copyrightLabel.text = copyright
                    } else {
                        self.copyrightLabel.isHidden = true
                    }
                    
                    }
                }
            })
            task.resume()
        }
        
    }
    
    
    
    
    
}
