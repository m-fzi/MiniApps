//
//  ImagePicker.swift
//  Instafilter
//
//  Created by f on 22.12.2021.
//

import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    //This class is for the interaction with the UI(when Photo Picker was open)(Functionality Bridge between UIKit view and SwiftUI view(
    class Coordinator: NSObject, PHPickerViewControllerDelegate {  // (Coordinator takes report from picker, so we can interact with UI(delegation).) Because of NSObject, objC can query our coordinator. When runtime of app; ObjectiveC will ask to coordinator 'what is your functionality'. Functionality of this class is PHPickerViewControllerDelegate.
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            //Checks if ther was a selection. If not, exit.
            guard let provider = results.first?.itemProvider else { return }
            
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
    
    // This PHPickerViewController(picker) is a UIView. We are putting it on screen with ImagePicker(which is swiftUI's type view) thanks to UIViewControllerRepresentable protocol.
    func makeUIViewController(context: Context) -> PHPickerViewController {  // Swift runs this code automatically when the struct instance is initiated.
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator //IMPORTANT: This line tells Swift to use coordinator instance as a delegete to picker(so we can interact with the UI. If there is no coordinator as delegate; we would see the photos, but we wouldn't be able to interact with UI. This line means; if anything happens when picker view is on, report that to our coordinator(this, what delegation is).
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator { Coordinator(self) }
}
