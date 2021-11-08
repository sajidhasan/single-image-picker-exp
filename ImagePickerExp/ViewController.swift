//
//  ViewController.swift
//  ImagePickerExp
//
//  Created by Sajid Hasan on 08/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectImageButton: UIButton!
    
    
    var imagePicker: UIImagePickerController = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImagePicker()
    }
    
    @IBAction func selectImageButtonPressed(_ sender: UIButton) {
        pickImage()
        print("Select Image button pressed")
    }
    
    
    fileprivate func configureImagePicker(){
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        //imagePicker.allowsEditing = false
        imagePicker.mediaTypes = ["public.image"]
    }
    fileprivate func pickImage(){
        present(imagePicker, animated: true)
    }
    


}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else
        {
            fatalError("error: no photo picked")
        }
        
        picker.dismiss(animated: true) {
            self.imageView.image = selectedImage
        }
        print("UIImagePickerControllerDelegate -> imagePickerController called")
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true) {
            print("UIImagePickerController: dismissed")
        }
        
    }
}

