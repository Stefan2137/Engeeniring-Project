//
//  SetsView.swift
//  fitapp
//
//  Created by Kuba Stefański on 15/10/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct SetsView: View {
    @StateObject var viewModel: SetsViewViewModel
    @FirestoreQuery var items: [SetInformation]
    @State var show = true
    init(userId: String){
        
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/setsinfo")
        
        self._viewModel = StateObject(wrappedValue: SetsViewViewModel(userId: userId))
        
    }
    
    var body: some View {
            NavigationView{
                VStack{
                    List(items) { item in
                        NavigationLink(destination: SetsOverview(item: item.WName, exName: item.ExeName, setNumber: item.setnumbers, time1: item.time, repsarr: item.numberreps, weightarr: item.weight))
                        {
                            if show {
                                SetCard(item: item)
                                    .buttonStyle(.borderless)
                                    .swipeActions{
                                        Button{
                                            viewModel.delete(id: item.id)
                                        } label: {
                                            Text("Delete")
                                                .tint(Color.red)
                                        }
                                    }
                            }
                        }
                        
                        
                        
                    }
                }
                .navigationTitle("Workout")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        HStack{
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
                .onAppear()
                {
                    show = true
                }
                .onDisappear()
                {
                    show = false
                }
            }
        }
    }
    

struct SetsView_Previews : PreviewProvider {
    static var previews: some View{
        SetsView(userId: "UlGceoDOlTUvw2eWJCNUACbQu5b2")
    }
}
