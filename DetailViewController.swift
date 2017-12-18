//
//  DetailViewController.swift
//  MyPhotoApp
//
//  Created by Arofando, Hadi  on 12/18/17.
//  Copyright © 2017 Arofando, Hadi . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var textDesc: UILabel!
    
    var imageArray = [UIImage]()
    var photoNum = Double()
    static var descArray: [String] = ["", "", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageScrollView.frame = view.frame
        //textDesc.
        
        for i in 0..<imageArray.count{
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            imageView.contentMode = .scaleAspectFit
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.imageScrollView.frame.width, height: self.imageScrollView.frame.height)
            imageScrollView.contentSize.width = imageScrollView.frame.width * CGFloat(i + 1)
            imageScrollView.addSubview(imageView)
        }
        let offset = CGPoint(x: (Double(self.imageScrollView.frame.width) * photoNum), y: 0.0)
        imageScrollView.setContentOffset(offset, animated: false)
    }
    
    
    
    @IBAction func textInput(_ sender: AnyObject) {
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
}
