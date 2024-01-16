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
    let reps:[Int:[Int]]
    var body: some View {
        NavigationView{
            VStack{
                
                ForEach(exName.keys.sorted(), id: \.self) { index in
                    
                    if let setn = setNumber[index], let ename = exName[index]{
                        OverviewView(weigth: "20", reps: 10, set: setn , background: .gray, Name: ename)
                    }
                    else
                    {
                        Text("no Value Found for key \(index)")
                    }
                }
                .navigationTitle(item)
            }
        }
    }
}
    
    
struct SetsOverview_Previews: PreviewProvider {
    static var previews: some View {
        SetsOverview(item: "Elo", exName: [1:"12"], setNumber: [0:0], time1: 23, reps: [0 : [0]])
    }
}
