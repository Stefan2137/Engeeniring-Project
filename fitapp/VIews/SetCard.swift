//
//  SetCard.swift
//  fitapp
//
//  Created by Kuba Stefański on 11/11/2023.
//

import SwiftUI

struct customShadow:ViewModifier{
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2),radius: 20, x:0 ,y: 0)
    }
}


struct SetCard: View {
    
    let title: String
    let isDone: Bool
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .offset(x: -100 ,y:-10)
                    .font(.title2)
                    .frame(width: 160,alignment: .leadingFirstTextBaseline)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                    .scaledToFit()
                    
            }
            .bold()
            .frame(width: 400, height: 30)
            .minimumScaleFactor(0.6)
        }
        .offset(x: 20, y: -20)
        .frame(width: 380, height: 110)
        .background(.white)
        .cornerRadius(10)
        .modifier(customShadow())
    }
}

struct SetCard_Previews: PreviewProvider {
    static var previews: some View {
        SetCard(title: "Dsadasd" ,isDone: false)
    }
}
