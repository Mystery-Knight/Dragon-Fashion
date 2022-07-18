//
//  ViewController.swift
//  Dragon Fashion
//
//  Created by DPI STUDENT 9 on 7/6/22.
//

import UIKit

class ViewController: UIViewController {
    var dragon: Dragon!

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: dragon.imageName)
    }


}

