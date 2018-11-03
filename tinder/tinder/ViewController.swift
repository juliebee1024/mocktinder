//
//  ViewController.swift
//  tinder
//
//  Created by Julie Bao on 10/27/18.
//  Copyright © 2018 Julie Bao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var cardInitialCenter: CGPoint! //instance variable for the initial center
    var keepCenter: CGPoint! //variable to hold the center
    var initialLocation: CGPoint! //point user touches initially
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didPanImage(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if sender.state == .began
        {
            print("at begin")
            //store the image's center into the cardInitialCenter variable
            cardInitialCenter = imageView.center
            keepCenter = imageView.center
        }
        else if sender.state == .changed
        {
            print("at changed")

            if(initialLocation.y<cardInitialCenter.y)
            {
                imageView.transform = CGAffineTransform(rotationAngle: translation.x * (CGFloat.pi/180) * 0.10)
            }
            else
            {
                imageView.transform = CGAffineTransform(rotationAngle: -translation.x * (CGFloat.pi/180) * 0.10)
            }
            
            //only x is changing, y stays the same
            imageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
        }
        else if sender.state == .ended
        {
            print("at ended")
            //If the x translation is greater than 50, animate it off screen to the right. If the x translation is less than 50, animate it off screen to the left. Otherwise, restore the original center and transform.
            if(translation.x > 50)
            {
                print("end right")
                UIView.animate(withDuration: 0.3)
                {
                    self.imageView.center.x = 1000
                }
            }
            else if(translation.x < -50)
            {
                print("end left")
                UIView.animate(withDuration: 0.3)
                {
                    self.imageView.center.x = -1000
                }
            }
            else
            {
                print("restore")
                UIView.animate(withDuration: 0.5)
                {
                    self.imageView.transform = CGAffineTransform.identity
                    self.imageView.center = self.keepCenter
                }
            }
        }
    }
    @IBAction func onTap(_sender: Any)
    {
        self.performSegue(withIdentifier: "segue", sender: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        initialLocation = touches.first!.location(in: view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let view = segue.destination as! ProfileViewController
        view.profilePic = imageView
    }
}

