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
    @State private var isDatePickerPresented = false
    
    
    init(userId: String){
        
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/setsinfo")
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List() { Text("Elo")
                    Text("elo2")
                    //  NavigationLink(destination: SetsOverview(item: item.WName, exName: item.ExeName, setNumber: item.setnumbers, time1: item.time, repsarr: item.numberreps, weightarr: item.weight)) {
                    //     SetCard(title: item.WName, isDone: false)
                }
            }
            .navigationTitle("Workout")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundColor(.blue)
                        /*  .overlay{
                         DatePicker("",selection: $viewModel.EDate
                         ,displayedComponents:.date)
                         .frame(width: 23,height: 20)
                         .clipped()
                         .blendMode(.destinationOver)
                         }
                         */
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
