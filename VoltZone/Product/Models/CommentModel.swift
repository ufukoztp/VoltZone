//
//  CommentModel.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 2.07.2022.
//

import Foundation

struct CommentModel : Identifiable{
    var id = UUID()
    var name : String
    var text : String
    var carName :String
    var photoUrl : String
    
}
