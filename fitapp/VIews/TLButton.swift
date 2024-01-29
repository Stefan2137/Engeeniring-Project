//
//  TLButton.swift
//  fitapp
//
//  Created by Kuba Stefański on 17/11/2023.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let titlebackground: Color
    let action: () -> Void
    var body: some View {
        Button{
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(titlebackground)
                    .bold()
                
            }
        }
      
    }
}

struct TLButton_Previews: PreviewProvider{
    static var previews: some View{
        TLButton(title: "Value", background: .pink,titlebackground: Color.white)
        {
            //action
        }
    }
}
