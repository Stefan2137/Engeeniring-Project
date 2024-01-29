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
                ScrollView{
                Text("Summary of weights \(selection)")
                Chart(viewModel.chartData){dataPoint in
                    ForEach(dataPoint.weig.indices, id: \.self){ index in
                        BarMark(x: .value("Time", dataPoint.formattedDay, unit: .day),
                                y: .value("Weight", dataPoint.weig[index]))
                        .annotation {
                            Text("\(viewModel.forTrailingZero(dataPoint.weig[index]))")
                        }
                        .position(by:.value("weight", dataPoint.weig[index]))
                    }
                    
                    // .position(by:.value("day", dataPoint.formattedDay))
                    
                    
                }
                .chartXAxis
                {
                    AxisMarks(values: .stride(by: .day))
                    { date in
                        AxisGridLine()
                        AxisValueLabel(format: .dateTime.weekday(.narrow), centered: true)
                    }
                }
                .aspectRatio(1,contentMode: .fit)
                Picker("", selection: $selection) {
                            ForEach(self.viewModel.exeName, id: \.id) { exercise in
                                Text(exercise.id).tag(exercise.id)
                            }
                        }
                        .pickerStyle(.menu)
                .padding()
                .task {
                    try? await viewModel.getallsets()
                    try? await viewModel.getallname()
                    viewModel.searchAndUpdate(searchString: selection)
                    }
                .onChange(of: selection)
                    {
                    viewModel.chartData = []
                    viewModel.searchAndUpdate(searchString: selection)
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
