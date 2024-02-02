//
//  ExerciseFieldViewModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 22/01/2024.
//

import FirebaseFirestore
import Foundation
import FirebaseFirestoreSwift
class ExerciseFieldViewModel: ObservableObject{
    @Published private(set) var exeName:[String] = []
    @Published var selectedExercise: String = ""
    
    func getallname() async throws {
        do {
            let names = try await FirebaseMenager.shared.getALLExeIDs()

            DispatchQueue.main.async {
                self.exeName = names
            }
        } catch {
            print("Error fetching exercise names: \(error)")
        }
    }
}
