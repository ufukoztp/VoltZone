//
//  ContentView.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 21.06.2022.
//

import SwiftUI

import MapKit

struct ContentView: View {
    @State var selectedIndex : Int = 0
    
    @StateObject var home_presenter = HomeViewModel(FirebaseService())
    
 
    var body: some View {
        NavigationView{
            
            switch selectedIndex{
            case 0 :
                ZStack{
                   if home_presenter.isLoading == true{
                       Map(coordinateRegion: home_presenter.$region,annotationItems: home_presenter.empireStateBuilding){
                           place in
                           MapAnnotation(coordinate: place.coordinate) {
                               PlaceAnnotationView(onTap: {
                                   home_presenter.currentZone = place
                               }, title: place.name)
                               }
                       }
                       
                    
                       VStack( spacing: 10){
                        
                           NavigationLink  {
                               SearchView()
                           } label: {
                               Rectangle().fill(.white).frame(width: 240, height: 32).overlay {
                                    HStack{
                                       Image(systemName:"magnifyingglass").renderingMode(.template).foregroundColor(Color.gray).padding()
                                       Spacer()
                                       Text("Şarj istasyonu ara").font(.subheadline).foregroundColor(Color.gray)
                                       Spacer()
                                   }
                               }.cornerRadius(8).padding(.top,54)
                           }
                           Spacer()
                            if home_presenter.currentZone != nil {
                                NavigationLink(destination: ZoneDetail(zoneId: home_presenter.currentZone!.id).navigationBarHidden(true)) {
                                    DetailCard(data: home_presenter.currentZone!) {
                                        home_presenter.currentZone = nil
                                    }
                                }
                        
                           } else {
                               
                          BottomBar(selectedIndex: $selectedIndex)
                           }
                       }
                   }else{
                       Text("Yükleniyor...")
                    }
                   
                 
               } .ignoresSafeArea()
            
                
            

            default:
                VStack {
                    Spacer()
                    Image("page_not_found").resizable().aspectRatio(contentMode: .fill).frame(width: 250, height: 250)
                    Spacer()
                    BottomBar(selectedIndex: $selectedIndex)

                }
            }
            

        }
       .onAppear {
            home_presenter.fetchZones()
            print("onAppear")
        }
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}




