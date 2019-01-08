import Foundation
import UIKit


class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    @IBOutlet var profileImage: UIImageView!
    
    @objc var name: String?  //? Means this value can be nil
    
    @objc let images: [String] = ["puppy", "horse", "zebra", "whale", "lion"]  //An array of image names (Strings). "let" means this is a constant and cannot change.
    
    @objc let noImage = "noimage" //image name if no name was available.
    
    override func viewDidLoad() {
        
        if name != nil && name != "" {
            self.welcomeLabel.text = "Hello, \(name!)" //use the ! to unwrap the optional value.
            loadImage(true)
        } else {
            //no name available.
            self.welcomeLabel.text = "Oops, You forgot a name!"
            loadImage(false)
        }
    }
    
    @objc func loadImage(_ hasName: Bool) {
        
        if hasName {
            
            //name is available, show random image from profile images array
            
            let randomIndex = Int(arc4random_uniform(UInt32(images.count)))
            
            self.profileImage.image = UIImage(named: images[randomIndex])
            
        } else {
            self.profileImage.image = UIImage(named: noImage)
        }
    }
    
    @IBAction func dismissBtnPressed(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: {
            //if you need to do anything when view finishes dismissing, do it here.
        })
    }
}
