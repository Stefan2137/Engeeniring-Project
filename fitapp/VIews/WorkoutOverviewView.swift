//
//  SetsOverview.swift
//  fitapp
//
//  Created by Kuba Stefański on 03/01/2024.
//

import SwiftUI

struct SetsOverview: View {
    let item: String
    let exName: [Int:String]
    let setNumber: [Int:Int]
    let time1: TimeInterval
    let repsarr: [Int:[Int]]
    let weightarr: [Int:[Double]]
    
    var body: some View {
        NavigationView{
            List{
                VStack{
                    ForEach(exName.keys.sorted(), id: \.self) { index in
                        
                        if let setn = setNumber[index], let ename = exName[index],let re=repsarr[index],let wei = weightarr[index] {
                            OverviewView(weigth: wei, reps: re, set: setn , background: .gray, Name: ename)
                        }
                        else
                        {
                            Text("no Value Found for key \(index)")
                        }
                    }
                    .listStyle(DefaultListStyle())
                    
                }
                .navigationBarTitle(item)
                .navigationBarHidden(true)
               
            }
        }
    }
}
    
    
struct SetsOverview_Previews: PreviewProvider {
    static var previews: some View {
        SetsOverview(item: "Elo", exName: [1:"12"], setNumber: [0:0], time1: 23, repsarr: [0 : [0]], weightarr: [0 : [2.1]])
    }
}
