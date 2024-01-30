//
//  SetCardViewViewModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 19/12/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class SetCardViewViewModel: ObservableObject
{
    init(){}
    
    func toogleIsDone(item: SetInformation)
    {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else
        {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("setsinfo")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
