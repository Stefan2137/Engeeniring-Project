//
//  CButton.swift
//  fitapp
//
//  Created by Kuba Stefański on 26/11/2023.
//

import SwiftUI
struct CButton: View {
    @State private var count = 0
    var size: CGFloat = 30

    var body: some View {
        VStack {
            Button(action: {
                self.count += 1
            }) {
                ZStack
                {
                    Circle()
                        .foregroundColor(.blue)
                        .frame(width: size, height: size)
                    Text("\(count)")
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}


struct Cbutton_Previews: PreviewProvider{
    static var previews: some View{
        CButton()
    }
}
