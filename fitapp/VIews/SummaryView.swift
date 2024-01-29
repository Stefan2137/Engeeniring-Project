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
    @State var selection = "Dumbbell Seated Scaption"
    
    var body: some View {
        VStack{
            Chart(viewModel.chartData){dataPoint in
                ForEach(dataPoint.weig.indices, id: \.self){ index in
                    BarMark(x: .value("Time", dataPoint.formattedDay),
                            y: .value("Weight", dataPoint.weig[index]))
                }
                
            }
            .chartXScale(domain: 0...32)
            Picker("", selection: $selection) {
                ForEach(viewModelE.exercises, id: \.self) { exercise in
                    Text(exercise.Exercise_Name).tag(exercise.Exercise_Name)
                    
                }
            }
            
            .task {
                try? await viewModel.getallsets()
                viewModel.searchAndUpdate(searchString: selection)
                for data in viewModel.chartData {
                    print(data.formattedDay)
                    print(data.weig)
                }
            }
        }
    }
}

struct SummaryView_Previews : PreviewProvider {
    static var previews: some View{
        SummaryView()
    }
}
