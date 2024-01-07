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
    
    var body: some View {
            VStack {
                    TextField("ExerciseName", text: $field)
                    ForEach(viewModel.numberofsets.keys.sorted(), id: \.self){
                        setIndex in ExerciseFieldRepsKG(index: setIndex)
                    }
                    TLButton(title: "+Add Set", background: .gray, titlebackground: .black)
                    {
                        print("Before: \(viewModel.numberofsets)")
                        let currentCount = viewModel.numberofsets.count
                        viewModel.numberofsets[currentCount + 1] = 0
                        viewModel.weightS[currentCount + 1] = ""
                        viewModel.numberofreps[currentCount + 1] = 0
                        print("After: \(viewModel.numberofsets)")
                        
                    }
                
                
                .padding()
            }
        }
        
        private func store() {
            viewModel.title[index] = field
            
        }
    
    }

struct ExerciseFieldPreview : PreviewProvider {
    static var previews: some View{
        ExerciseField(index: 1)
            .environmentObject(NewSetViewViewModel())
    }
}

