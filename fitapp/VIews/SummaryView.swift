//
//  SummaryView.swift
//  fitapp
//
//  Created by Kuba Stefański on 23/11/2023.
//

import SwiftUI
import Charts



struct SummaryView: View {
    @StateObject private var viewModelE = ExerciseFieldViewModel()
    @StateObject private var viewModel = infoView()
    @State var selection = "Dumbbell Seated Scaption"
    @State var currentday = Date()
    
    
    var body: some View {
            VStack{
                ScrollView{
                Text("Summary of weights \(selection)")
                Chart(viewModel.chartData){dataPoint in
                    ForEach(dataPoint.weig.indices, id: \.self){ index in
                        BarMark(x: .value("Time", dataPoint.formattedDay, unit: .day),
                                y: .value("Weight", dataPoint.weig[index]))
                        .annotation {
                            Text("\(viewModel.forTrailingZero(dataPoint.weig[index])) KG")
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
                    DatePicker("pick a day", selection: $currentday,displayedComponents: .date
                )
                .padding()
                .task {
                    try? await viewModel.getallsets()
                    try? await viewModel.getallname()
                    viewModel.chartData = []
                    viewModel.searchAndUpdate(searchString: selection, currentday: currentday)
                    }
                .onChange(of: selection)
                    {
                    viewModel.chartData = []
                        viewModel.searchAndUpdate(searchString: selection, currentday: currentday)
                }
                .onChange(of: currentday)
                        {
                        viewModel.chartData = []
                            viewModel.searchAndUpdate(searchString: selection, currentday: currentday)
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
