//
//  ExerciseField.swift
//  fitapp
//
//  Created by Kuba Stefański on 07/01/2024.
//

import SwiftUI

struct ExerciseField: View {
    @EnvironmentObject var viewModel: NewSetViewViewModel
    let index: Int
    @State private var field = ""
    @State private var numberofset = 1
    @State private var ilosc = [""]
    
    var body: some View {
        VStack {
            TextField("ExerciseName", text: $field)
            .onChange(of: field)
            {
                viewModel.title[index] = field
            }
            ForEach(0..<ilosc.count, id: \.self){
                setIndex in ExerciseFieldRepsKG(index: setIndex)
            }
            TLButton(title: "+Add Set", background: .gray, titlebackground: .black)
            {
                ilosc.append("")
                viewModel.numberofsets[index] = numberofset
                numberofset = numberofset + 1
                
            }
            
            .frame(width: 350 ,height: 20)
            .padding()
            .scaledToFit()
        }
    }
}
    struct ExerciseFieldPreview : PreviewProvider {
        static var previews: some View{
            ExerciseField(index: 1)
                .environmentObject(NewSetViewViewModel())
        }
}

