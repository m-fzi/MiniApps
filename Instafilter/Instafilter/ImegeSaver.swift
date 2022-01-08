//
//  ImegeSaver.swift
//  Instafilter
//
//  Created by f on 22.12.2021.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        //1. image to save, 2.an object that should be notified about result of the save(successful or not), 3. A method on that object that can be read by ObjectiveC. 4. is a parameter we give to defferantiate this image saving process from another image savin process.
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil) //Selector asks swift to make sure that mathod passed into is exist.
    }
    
    //@objc gives the ability to generate code that can be read by ObjectiveC.
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
    
}
