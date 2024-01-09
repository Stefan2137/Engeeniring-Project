//
//  SetsView.swift
//  fitapp
//
//  Created by Kuba Stefański on 15/10/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct SetsView: View {
    @StateObject var viewModel = SetsViewViewModel()
    @FirestoreQuery var items: [SetInformation]
    
    init(userId: String){
        
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/setsinfo")
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    NavigationLink(destination: SetsOverview(item: item.WName ,exName: item.ExeName)) {
                                        SetCard(title: item.WName, isDone: false)
                                    }
                                }
                            }
            .navigationTitle("Workout")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    HStack{
                        Button {
                            viewModel.showingNewSetItemView = true
                        } label: {
                            Image(systemName: "calendar")
                        }
                        .offset(x:-4,y: -5)
                        
                        Button{
                            viewModel.showingNewSetItemView = true
                        }label: {
                            Image(systemName: "plus")
                        }
                        .offset(x:0,y:-5)

                    }
                }
                
                
            }
            .sheet(isPresented: $viewModel.showingNewSetItemView) {
                NewSetView(newSetItemPresented: $viewModel.showingNewSetItemView)
            }
        }
    }
}
    

struct SetsView_Previews : PreviewProvider {
    static var previews: some View{
        SetsView(userId: "UlGceoDOlTUvw2eWJCNUACbQu5b2")
    }
}
