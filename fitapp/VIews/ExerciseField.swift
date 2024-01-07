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
                ExerciseFieldRepsKG(index: 1)
                
                TLButton(title: "+Add Set", background: .gray, titlebackground: .black)
                {
                    viewModel.addSet()
                }
                .frame(width: 350,height: 25)
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

