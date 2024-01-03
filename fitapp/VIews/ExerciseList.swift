//
//  ExerciseList.swift
//  fitapp
//
//  Created by Kuba Stefański on 15/10/2023.
//

import SwiftUI

struct ExerciseList: View {
    @ObservedObject private var viewModel = ExerciseListViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Picker("Sort By", selection: $viewModel.sortOption) {
                    Text("Name").tag(ExerciseListViewViewModel.SortOption.name)
                    Text("Difficulty").tag(ExerciseListViewViewModel.SortOption.diff)
                    Text("Grip").tag(ExerciseListViewViewModel.SortOption.grip)
                    Text("Muscle").tag(ExerciseListViewViewModel.SortOption.muscle)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                List(viewModel.sortedExercises) { exercise in
                    NavigationLink(destination: ExerciseInfromationView(info: exercise.Exercise_Name)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(exercise.Exercise_Name)
                                    .font(.subheadline)
                                Text(exercise.Difficulty_Level)
                                Text(exercise.Grip)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Exercises Library")
            .onAppear() {
                self.viewModel.fetchData()
            }
        }
    }
}

struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseList()
    }
}

