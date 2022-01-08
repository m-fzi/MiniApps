//
//  ContentView.swift
//  Instafilter
//
//  Created by f on 20.12.2021.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    @State private var filterIntensity = 0.5
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    
    @State private var showingImagePicker = false
    @State private var showingFilterSheet = false
    
    let context = CIContext()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    Text("Tap to select a photo")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture { showingImagePicker = true }
                
                HStack {
                    Text("Intensity:")
                    Slider(value: $filterIntensity)
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter") { showingFilterSheet = true }
                    Spacer()
                    Button("Save") { save() }
                }
            }
                .padding([.bottom, .horizontal])
                .navigationTitle("Instafilter")
                .sheet(isPresented: $showingImagePicker) { ImagePicker(image: $inputImage) }
                .confirmationDialog("select a filter", isPresented: $showingFilterSheet) {
                    Button("Cyristallize") { setFilter(CIFilter.crystallize()) }
                    Button("Edges") { setFilter(CIFilter.edges()) }
                    Button("Cancel", role: .cancel) { }
                }
                .onChange(of: inputImage) { _ in loadImage() }
                .onChange(of: filterIntensity) { _ in applyProcessing() }
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }  // UIImage
        
        let ciImg = CIImage(image: inputImage)
        currentFilter.setValue(ciImg, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() { // Change the filterIntensity's nature, apply that to image. And give me an output image.
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity*200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity*10, forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage else { return }
        if let cgImg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImg = UIImage(cgImage: cgImg)
            image = Image(uiImage: uiImg)
            processedImage = uiImg
        }
    }
    
    func save() {
        guard let processedImage = processedImage else { return }
        
        let imageSaver = ImageSaver()
        
        imageSaver.successHandler = { print("Success!") }
        imageSaver.errorHandler = { print("Failure, \($0.localizedDescription)") }
        
        imageSaver.writeToPhotoAlbum(image: processedImage)

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
