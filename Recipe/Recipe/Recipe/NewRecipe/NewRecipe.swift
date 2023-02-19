//
//  NewRecipe.swift
//
//
//  Created by Hang Le on 8.6.2022.
//


import SwiftUI

struct NewRecipe: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showImagePicker = false        
    
    static var numberFormat: NumberFormatter {
        let nF = NumberFormatter()
        nF.maximumFractionDigits = 0
        return nF
    }
    var body: some View {
        List {
            if let image = modelData.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    .padding(100)
            }
            HStack {
                Spacer()
                Button {
                    modelData.source = .camera
                    showImagePicker = true
                } label: {
                    ButtonLabel(symbolName: "camera", label: "Ota kuva")
                }
                Spacer()
            }
            HStack {
                Spacer()
                Button {
                    modelData.source = .library
                    showImagePicker = true
                } label: {
                    ButtonLabel(symbolName: "photo", label: "Valitse kuva")
                }
                Spacer()
            } // HStack
            Section(header: Text("Reseptin Info")) {
                TextField("Nimi", text: $modelData.name)
                    .disableAutocorrection(true)
                HStack {
                    Text("Budjetti:")
                        .foregroundColor(.secondary)
                    TextField("euro", value: $modelData.budget, formatter: NewRecipe.numberFormat)
                        .keyboardType(.decimalPad)
                }
                
                HStack {
                    Text("Annos:")
                        .foregroundColor(.secondary)
                    TextField("people", value: $modelData.serving, formatter: NewRecipe.numberFormat)
                        .keyboardType(.decimalPad)
                }
                HStack {
                    Text("Valmistusaika:")
                        .foregroundColor(.secondary)
                    TextField("minute", value: $modelData.cookingTime, formatter: NewRecipe.numberFormat)
                        .keyboardType(.decimalPad)
                }
                HStack {
                    Text("Energia:")
                        .foregroundColor(.secondary)
                    TextField("kcal", value: $modelData.calories, formatter: NewRecipe.numberFormat)
                        .keyboardType(.decimalPad)
                }
            }
            Section(header: Text("Ainekset")) {
                TextEditor(text: $modelData.ingredients)
                    .multilineTextAlignment(.leading)
            }
            Section(header: Text("Ohje")) {
                TextEditor(text: $modelData.instructions)
                    .multilineTextAlignment(.leading)
            }
            Section(header: Text("Kategoriat")) {
                CuisinePicker(selection: $modelData.cuisine)
                CategoryPicker(selection: $modelData.category)
            }
        } // Form
        
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: modelData.source == .library ? .photoLibrary : .camera, selectedImage: $modelData.image)
                .ignoresSafeArea()
        }
    }
}
struct NewRecipe_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipe()
            .environmentObject(ModelData())
    }
}
