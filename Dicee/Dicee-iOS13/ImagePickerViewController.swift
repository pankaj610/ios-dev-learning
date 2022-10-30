//
//  ImagePickerViewController.swift
//  Dicee-iOS13
//
//  Created by Pankaj on 31/07/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTap(_ sender: UIButton) {
        let imagePickerView = UIImagePickerController()
        imagePickerView.delegate = self
        imagePickerView.allowsEditing = false
        imagePickerView.sourceType = .camera
        self.present(imagePickerView, animated: true, completion: nil)

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancel tapped")
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageView.image = image
        self.dismiss(animated: true, completion: nil)
    }
}
