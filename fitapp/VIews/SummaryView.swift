//
//  SummaryView.swift
//  fitapp
//
//  Created by Kuba Stefański on 23/11/2023.
//

import SwiftUI
import Charts



struct SummaryView: View {
    @ObservedObject private var viewModelE = ExerciseFieldViewModel()
    @ObservedObject private var viewModel = infoView()
    @State var selection = ""
    var body: some View {
        VStack{
           /* Picker("", selection: $selection) {
                ForEach(viewModelE.exercises, id: \.self) { exercise in
                    Text(exercise.Exercise_Name).tag(exercise.Exercise_Name)
             */
                        ForEach(viewModel.info){ infor in
                        Text(infor.WName)
                        
                    }
                }
        .task {
         try? await viewModel.getallsets()
            viewModel.search()
        }
    }
}

struct SummaryView_Previews : PreviewProvider {
    static var previews: some View{
        SummaryView()
    }
}
