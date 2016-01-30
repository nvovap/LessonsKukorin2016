//
//  PhotoTkingHelper.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 29.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit

typealias PhotoTakingHelperCallback  = UIImage? -> Void

class PhotoTakingHelper: NSObject {
    
    var callback: PhotoTakingHelperCallback
    //View controller on which AlertViewContriller and UIImagePickerController are presented
    weak var viewController: UIViewController!
    
    var imagePicerController: UIImagePickerController?
    
    init(viewController: UIViewController, callback: PhotoTakingHelperCallback){
        self.viewController = viewController
        self.callback = callback
        
        super.init()
        
        showPhotoSourceSelection()
    }
    
    func showPhotoSourceSelection() {
        let allertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cancelAction  = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        allertController.addAction(cancelAction)
        
        
        let photoLibraryAction = UIAlertAction(title: "Photo from library", style: UIAlertActionStyle.Default) { (action) -> Void in
            
            self.showImagePikerController(.PhotoLibrary)
        }
        
        allertController.addAction(photoLibraryAction)
        
        
        if UIImagePickerController.isCameraDeviceAvailable(.Rear) {
            let cameraAction = UIAlertAction(title: "Photo from Camera", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                
                self.showImagePikerController(.PhotoLibrary)
            })
            
            allertController.addAction(cameraAction)
        }
        
        viewController.presentViewController(allertController, animated: true, completion: nil)
        
    }
    
    
    
    func showImagePikerController(sourceType: UIImagePickerControllerSourceType){
        imagePicerController = UIImagePickerController()
        imagePicerController!.sourceType = sourceType
        
        imagePicerController!.delegate = self
        
        self.viewController.presentViewController(imagePicerController!, animated: true, completion: nil)
    }
    
}


extension PhotoTakingHelper: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        viewController.dismissViewControllerAnimated(false, completion: nil)
        callback(image)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        viewController.dismissViewControllerAnimated(false, completion: nil)
    }
    
    
    
    
}