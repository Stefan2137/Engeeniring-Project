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
                            TextField("Execrise Name",text: $viewModel.title)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(5)
                                .disableAutocorrection(true)
                            ForEach(0..<viewModel.numberOfSetsAdded, id: \.self) { index in
                                VStack {
                                    HStack{
                                        VStack {
                                            Text("Set")
                                                .offset(x: -30)
                                            TextField("Set", value: $viewModel.numberOfSetsAdded, formatter: NumberFormatter())
                                                .disabled(true)
                                                .font(.system(size:10))
                                                .padding()
                                                .contentShape(Rectangle())
                                                .border(.black,width:1)
                                        }
                                        
                                        VStack {
                                            Text("Kg/lbs")
                                                .offset(x: -28)
                                            TextField("Kg/lbs", text: $viewModel.weightS)
                                                .keyboardType(.decimalPad)
                                                .padding()
                                                .contentShape(Rectangle())
                                                .border(.black,width:1)
                                        }
                                        
                                        VStack {
                                            Text("Reps")
                                                .offset(x: -2)
                                            Picker("",selection: $viewModel.numberofreps)
                                            {
                                                ForEach(0..<100)
                                                {
                                                    Text("\($0)")
                                                }
                                            }
                                            .frame(width: 30,height: 30)
                                            .font(.system(size: 10))
                                            .padding()
                                            .contentShape(Rectangle())
                                            .border(.black,width:1)
                                        }
                                    }
                                   
                                }
                                .padding()
                            }
                        }
                    }
            
                    DatePicker("Date picker", selection: $viewModel.date)
                   
                    TLButton(title: "+Add Set", background: .gray, titlebackground: .black)
                    {
                        viewModel.addSet()
                    }
                    .padding()
                    TLButton(title: "Add Exercise", background: .gray, titlebackground: .black)
                    {
                        viewModel.addExercise()
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
