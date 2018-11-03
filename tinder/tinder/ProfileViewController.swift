//
//  ProfileViewController.swift
//  tinder
//
//  Created by Julie Bao on 11/2/18.
//  Copyright © 2018 Julie Bao. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    @IBAction func onTap(_sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
