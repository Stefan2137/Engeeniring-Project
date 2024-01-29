//
//  HeaderView.swift
//  fitapp
//
//  Created by Kuba Stefański on 16/11/2023.
//

import SwiftUI

struct HeaderView: View {
    let tittle: String
    let subtittle: String
    let angel: Double
    let backgroundcolor: Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundcolor)
                .rotationEffect(Angle(degrees: angel))
                
            VStack{
                Text(tittle)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subtittle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 80)
            
        }
        .frame(width: UIScreen.main.bounds.width * 3,height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews : PreviewProvider {
    static var previews: some View{
        HeaderView(tittle: "Tittle",
                   subtittle: "Subtitle",
                   angel: 15,
                   backgroundcolor: Color.pink)
    }
}

