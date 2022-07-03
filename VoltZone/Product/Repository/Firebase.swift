//
//  Firebase.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 21.06.2022.
//

import Foundation
import FirebaseFirestore
 

class FirebaseService{
  private  let db = Firestore.firestore()
    
    func fetchZones(completion: @escaping (Result<[ZoneModel],FirebaseError>)->Void){
        var zones = [ZoneModel]()
        db.collection("Zones").getDocuments { data, error in
        
            if error != nil{
                completion(.failure(.clientError))
            }
            guard let response = data else {
                return  completion(.failure(.parseError))
            }
            for doc in response.documents{
                zones.append(ZoneModel(latitude: doc.data()["latitude"] as! Double, longitude: doc.data()["longitude"] as! Double, name: doc.data()["name"] as! String,adress:doc.data()["adress"] as! String, open: doc.data()["open"] as! String,socketOneName: doc.data()["socketOneName"] as! String,socketOneState: doc.data()["socketOneState"] as! String,socketTwoName: doc.data()["socketTwoName"] as! String,socketTwoState: doc.data()["socketTwoState"] as! String,id: doc.data()["id"] as! String))
            }
            completion(.success(zones))
            
        }
    }
    
    func fetchZonesFilter(filter : String ,completion: @escaping (Result<[ZoneModel],FirebaseError>)->Void){
        print(filter)
        var zones = [ZoneModel]()
        db.collection("Zones").whereField("name", isEqualTo:filter).getDocuments { data, error in
        
            if error != nil{
               return completion(.failure(.clientError))
            }
            guard let response = data else {
               return   completion(.failure(.parseError))
            }
            for doc in response.documents{
                zones.append(ZoneModel(latitude: doc.data()["latitude"] as! Double, longitude: doc.data()["longitude"] as! Double, name: doc.data()["name"] as! String,adress:doc.data()["adress"] as! String, open:doc.data()["open"] as! String ,socketOneName: doc.data()["socketOneName"] as! String,socketOneState: doc.data()["socketOneState"] as! String,socketTwoName: doc.data()["socketTwoName"] as! String,socketTwoState: doc.data()["socketTwoState"] as! String,id: doc.data()["id"] as! String
           
                        
                                      ))
            }
            completion(.success(zones))
            
        }
    }
    
    
    func fetchComment(parkId : String, completion :@escaping (Result<[CommentModel],FirebaseError>)->Void){
        var comments : [CommentModel] = [CommentModel]()
        
         db.collection("Comments").getDocuments { data, error in
             if error != nil{
                 return completion(.failure(.clientError))
             }
             
             guard let response = data else {
               return completion(.failure(.parseError))
             }
             
             for doc in response.documents{
                 comments.append(CommentModel(name: doc.data()["name"] as! String, text: doc.data()["text"] as! String, carName:doc.data()["carName"] as! String,photoUrl: doc.data()["photoUrl"] as! String))
             }
             print("geldi data")
             
             completion(.success(comments))
             
 
        }
    }
    
    
    func fetchZoneDetail(_ zoneId:String,completion: @escaping (Result<ZoneModel?,FirebaseError>)->Void){
        var zoneModel : ZoneModel? = nil
        
        db.collection("Zones").whereField("id", isEqualTo: zoneId).getDocuments { data, error in
            if error != nil{
               return completion(.failure(.clientError))
            }
            guard let response = data else {
               return   completion(.failure(.parseError))
            }
            
            for doc in response.documents{
               zoneModel = ZoneModel(latitude: doc.data()["latitude"] as! Double, longitude: doc.data()["longitude"] as! Double, name: doc.data()["name"] as! String,adress:doc.data()["adress"] as! String, open:doc.data()["open"] as! String ,socketOneName: doc.data()["socketOneName"] as! String,socketOneState: doc.data()["socketOneState"] as! String,socketTwoName: doc.data()["socketTwoName"] as! String,socketTwoState: doc.data()["socketTwoState"] as! String,id: doc.data()["id"] as! String
           
                        
                                      )
            }
            completion(.success(zoneModel))
            
        }
    }
}


enum FirebaseError :Error{
    case parseError
    case clientError
}
