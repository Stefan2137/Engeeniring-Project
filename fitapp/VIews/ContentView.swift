//
//  ContentView.swift
//  fitapp
//
//  Created by Kuba Stefański on 23/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView()
        SetsView()
        BmiCalculator()
        ExerciseList()
        TimerView()
    }
    
}
struct ContentView_Previews : PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
