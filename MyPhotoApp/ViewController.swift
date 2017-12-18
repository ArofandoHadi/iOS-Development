//
//  ViewController.swift
//  MyPhotoApp
//
//  Created by Arofando, Hadi  on 12/17/17.
//  Copyright © 2017 Arofando, Hadi . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var photoArray: [UIImage] = [#imageLiteral(resourceName: "GD"),#imageLiteral(resourceName: "tree-1"),#imageLiteral(resourceName: "snow"),#imageLiteral(resourceName: "tree-1")]
    var descArray = DetailViewController.descArray
    
    //Adding photos
    
    @IBAction func addButton(_ sender: AnyObject) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoArray.append(image)
            descArray.append("")
        } 
        self.dismiss(animated: true, completion: nil)
        collectionView!.reloadData()
    }
    
    
    //Formatting spaces between cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 3) - 1
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
   //Transition to detail view
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondView = segue.destination as! DetailViewController
        secondView.imageArray = photoArray
        //secondView.descArray = descArray
        secondView.photoNum = Double((collectionView.indexPathsForSelectedItems?[0].item)!)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    // Deleting cells
    
    
    
    
    //Image array data and display
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCell
        cell.myImageView.image = photoArray[indexPath.item]
        return cell
    }

    
    //Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    

}

