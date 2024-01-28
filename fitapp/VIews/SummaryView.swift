//
//  SummaryView.swift
//  fitapp
//
//  Created by Kuba Stefański on 23/11/2023.
//

import SwiftUI
import Charts



struct SummaryView: View {
   // @ObservedObject private var viewModelE = ExerciseFieldViewModel()
    @ObservedObject private var viewModel = infoView()
    @State var selection = ""
    var body: some View {
        VStack{
                  /*  ForEach(viewModel.info){ infor in
                        Text(infor.WName)
                        
                    }*/
            Picker("", selection: $selection) {
                ForEach(viewModel.exeName, id: \.self) { exercise in
                    Text(exercise.id).tag(exercise.id)
                
                }
            }
                }
        .task {
        try? await viewModel.getallname()
        try? await viewModel.getallsets()
        }
    }
}

struct SummaryView_Previews : PreviewProvider {
    static var previews: some View{
        SummaryView()
    }
}
