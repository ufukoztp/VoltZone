//
//  HomeViewModel.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 21.06.2022.
//

import Foundation

import MapKit
import SwiftUI
import CoreLocation


class HomeViewModel:ObservableObject{
    
    let service:FirebaseService
    @Published var empireStateBuilding = [Place]()
    @Published var isLoading :Bool = false
    @Published var currentZone : Place?
    @State  var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222,longitude:-0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    
    init(_ serviceInit:FirebaseService){
        self.service=serviceInit
     }
    
    func fetchZones(){
        service.fetchZones(
            completion: {result in
                switch result{
                    
                case .success(let zones):
                    print("\(String(describing: zones.count)) : servisten gelen")
                    for datas in zones{
                        self.empireStateBuilding.append(Place(id:datas.id, name: datas.name,adress: datas.adress,socketOneName:datas.socketOneName,
                                                              open: datas.open,
                        socketOneState:datas.socketOneState,socketTwoName: datas.socketTwoName,socketTwoState: datas.socketTwoState,coordinate: CLLocationCoordinate2D(latitude: datas.latitude, longitude: datas.longitude)))
                    }
                    self.isLoading = true
                    
                case .failure(_):
                print("hata")
                }
            }
        )
       
    }
   
 
     

}


struct Place: Identifiable {
  var id :String
  var name: String
  var adress : String
  var socketOneName : String
  var open : String
  var socketOneState : String
  var socketTwoName : String
  var socketTwoState :String
  var coordinate: CLLocationCoordinate2D
}

