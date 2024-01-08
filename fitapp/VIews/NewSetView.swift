//
//  NewSetView.swift
//  fitapp
//
//  Created by Kuba Stefański on 20/12/2023.
//

import SwiftUI

struct NewSetView: View {
    @StateObject var viewModel = NewSetViewViewModel()
    @Binding var newSetItemPresented: Bool
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    TextField("Workout Name",text: $viewModel.WorkoutName)
                    ForEach(0..<viewModel.numberOfExercises, id: \.self){index in
                        VStack{
                            ForEach(viewModel.title.keys.sorted(), id: \.self){exerciseIndex in
                                VStack{
                                    Text(viewModel.title[exerciseIndex] ?? "")
                                        .foregroundColor(.green)
                                    ExerciseField(index: exerciseIndex)
                                        .buttonStyle(.plain)
                                        .environmentObject(viewModel)
                                }
                            }
                        }
                    }
            
                    DatePicker("Date picker", selection: $viewModel.date)
                                        TLButton(title: "Add Exercise", background: .gray, titlebackground: .black)
                    {
                        let currentCount = viewModel.title.count
                        viewModel.title[currentCount + 1] = ""
                    }
                    
                    .padding()
                }
                .formStyle(GroupedFormStyle())
                .navigationTitle("New Set")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing)
                    {
                        TLButton(title: "Save", background: .blue, titlebackground: .white){
                            if viewModel.canSave{
                                viewModel.save()
                                newSetItemPresented = false
                            }else{
                                viewModel.showAlert = true
                                
                            }
                            
                        }
                        .font(.system(size: 20))
                        .contentShape(Rectangle())
                        .padding()
                    }
                }
            }
            
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title:Text ("Error"),message: Text( "please fill the field with correct values"))
            })
        }
    }
}
        
       


struct NewSetView_Previews: PreviewProvider{
    static var previews: some View{
        NewSetView(newSetItemPresented: Binding(get:{
            return true
        }, set: {_ in
        }))
    }
}
