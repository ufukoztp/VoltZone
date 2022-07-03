//
//  SearchViewModel.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 23.06.2022.
//

import Foundation
import MapKit

class SearchViewModel : ObservableObject{
    
    let service:FirebaseService
    @Published var places = [Place]()

    init(_ serviceInit:FirebaseService){
        self.service=serviceInit
     }
    
    func fetchZonesFilter(filter : String){
        service.fetchZonesFilter(
            filter:filter,
            completion: {result in
                switch result{
                    
                case .success(let zones):
                    print("\(String(describing: zones.count)) : servisten gelen")
                    self.places.removeAll()
                    for datas in zones{
                        self.places.append(Place(id: datas.id,name: datas.name,adress: datas.adress,socketOneName:datas.socketOneName, open: datas.open,
                        socketOneState:datas.socketOneState,socketTwoName: datas.socketTwoName,socketTwoState: datas.socketTwoState,coordinate: CLLocationCoordinate2D(latitude: datas.latitude, longitude: datas.longitude)))
                    }
 
                case .failure(_):
                print("hata")
                }
            }
        )
       
    }

    
    func fetchZones(){
        service.fetchZones(
             completion: {result in
                switch result{
                    
                case .success(let zones):
                    print("\(String(describing: zones.count)) : servisten gelen")
                    self.places.removeAll()
                    for datas in zones{
                        self.places.append(Place(id: datas.id, name: datas.name,adress: datas.adress,socketOneName:datas.socketOneName, open: datas.open,
                        socketOneState:datas.socketOneState,socketTwoName: datas.socketTwoName,socketTwoState: datas.socketTwoState,coordinate: CLLocationCoordinate2D(latitude: datas.latitude, longitude: datas.longitude)))
                    }
 
                case .failure(_):
                print("hata")
                }
            }
        )
       
    }
    
}
