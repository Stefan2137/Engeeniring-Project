//
//  BmiCalculator.swift
//  fitapp
//
//  Created by Kuba Stefański on 15/10/2023.
//

import SwiftUI

struct BmiCalculator: View {
   @State private var weight = 0.0
   @State private var height = 0
    var body: some View {
        VStack{
            Text("BMI Calculator")
            HStack{
                TextField("", value: $weight ,format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100, height: 100)
                Text("KG/LBS")
            }
            HStack{
                TextField("", value: $height ,format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100, height: 100)
                Text("Height in CM")
            }
            .offset(x: 20,y: -50)
            TLButton(title: "Calculate", background: .blue, titlebackground: .white) {
                //
            }
            .frame(width: 300, height: 40)
        }
        
        
    }
}

struct BmiCalculatorView_Previews : PreviewProvider {
    static var previews: some View{
        BmiCalculator()
    }
}
