//
//  DetailViewModel.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 2.07.2022.
//

import Foundation

class DetailViewModel : ObservableObject {
    var firebaseService : FirebaseService
    @Published var comment : [CommentModel] = [CommentModel]()
    @Published var zoneDetail : ZoneModel?
 
    init(firebaseService : FirebaseService ) {
        self.firebaseService = firebaseService
    }
    
    func fetchZoneDetail(zoneId : String){
        firebaseService.fetchZoneDetail(zoneId) { result in
            switch result {
            case .success(let zone):
                self.zoneDetail = zone
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    
    func fetchComments(){
        firebaseService.fetchComment(parkId: "hillton") { result in
            
            switch result {
                
            case .success(let comments):
                self.comment = comments
                
                
            case .failure(let excp):
                print(excp.localizedDescription)
            }
        }
    }
    
}
