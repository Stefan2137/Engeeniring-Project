//
//  OverviewView.swift
//  fitapp
//
//  Created by Kuba Stefański on 12/01/2024.
//

import SwiftUI

struct OverviewView: View {
    @StateObject var viewModel = OverViewVIewModel()
    let weigth: [Double]
    let reps: [Int]
    let set: Int
    let background: Color
    let Name: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(background)
            VStack{
                Text(Name)
                ForEach(0..<set, id: \.self){ setIndex in
                    HStack {
                        VStack{
                            Text("Set")
                            Text("\(setIndex+1)")
                        }
                        .offset(x:-20)
                        .scaledToFit()
                        VStack {
                            Text("Kg/lbs")
                                .offset(y:6)
                            Text("\(viewModel.forTrailingZero(weigth[setIndex]))")
                                .keyboardType(.decimalPad)
                                .padding()
                                .contentShape(Rectangle())
                                .frame(width: 100 ,height: 30)
                                .border(.black,width:1)
                            
                        }
                        .scaledToFit()
                        VStack {
                            Text("Reps")
                                .offset(x: -2,y: 13)
                            Text("\(reps[setIndex]) ")
                                .frame(width: 70,height: 10)
                                .padding()
                                .contentShape(Rectangle())
                                .border(.black,width:1)
                        }
                        
                    }
                }
            }
        }
        .scaledToFit() 
    }
}


struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView(weigth: [0.0,1.1], reps: [20,20], set: 2, background: .gray, Name: "Cw")
    }
}

