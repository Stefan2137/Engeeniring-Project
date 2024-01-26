//
//  SummarizingViewViewModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 24/01/2024.
//

import FirebaseFirestore
import Foundation
import FirebaseFirestoreSwift

class infoView:ObservableObject {
    
    @Published private(set) var info:[SetInformation] = []
    
    func getallsets() async throws
    {
        self.info = try await  FirebaseMenager.shared.FetchData()
    }
    
}
