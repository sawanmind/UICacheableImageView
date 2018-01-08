//
//  ViewController.swift
//  UICacheableImageView
//
//  Created by iOS Developer on 1/8/18.
//  Copyright © 2018 sawanmind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    lazy var cacheableImageView:UICacheableImageView = UICacheableImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cacheableImageView.showWithSpinner(imageView:self.imageView, url:"https://images.unsplash.com/photo-1468818461933-b1d79f62434e?auto=format&fit=crop&w=1051&q=80") {
            (error:UICacheableImageViewError?) in
         //Do something.. after image load
        }
        
    }

}

