//
//  SetCard.swift
//  fitapp
//
//  Created by Kuba Stefański on 11/11/2023.
//

import SwiftUI

struct customShadow:ViewModifier{
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2),radius: 20, x:0 ,y: 0)
    }
}


struct SetCard: View {
    @StateObject var viewModel = SetCardViewViewModel()
    @Environment(\.colorScheme) var colorScheme
    let item:SetInformation
    var body: some View {
        HStack{
            VStack(alignment: .leading)
             {
             
                 Text(item.WName)
                    .offset(x: -80 ,y:10)
                    .foregroundColor(colorScheme == .dark ? Color.black : Color.black)
                    .font(.title2)
                    .frame(width: 160,alignment: .leadingFirstTextBaseline)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                    .scaledToFit()
                    .bold()
                    .frame(width: 300, height: 30)
                    .minimumScaleFactor(0.6)
                    
                    
            }
            
            
            Button{
                viewModel.toogleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ?
                      "checkmark.circle.fill": "circle")
            }
            .offset(x:-20,y: 17)
            
        }
        .offset(x: 20, y: -20)
        .frame(width: 380, height: 80)
        .background(colorScheme == .dark ? Color.gray : Color.white)
        .cornerRadius(10)
        .modifier(customShadow())
        
        
        
    }
}

struct SetCard_Previews: PreviewProvider {
    static var previews: some View {
        SetCard( item: SetInformation(id: "xd", ExeName: [1:"gg"], setnumbers: [0 : 0], time: 311231, isDone: true, numberreps: [2 : [2]], weight: [2 : [55.5]], WName: "Elo"))
    }
}
