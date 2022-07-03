//
//  HeaderDetail.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 1.07.2022.
//

import SwiftUI

struct HeaderDetail: View {
    @State var zoneDetail : ZoneModel
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack(alignment:.leading){
            Image(systemName: "chevron.backward")
                .frame(width: 35, height: 35).onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
            Rectangle().frame(width: 320, height:184 ).cornerRadius(10)
            Text(zoneDetail.name).bold().font(.custom("", size: 22)).padding(.top,38)
            
            Text(zoneDetail.adress).padding(.top,8)
            HStack{
                Text("4.0").font(.custom("", size: 32)).foregroundColor(.gray)
                StarsView(rating: 3)
                
            }.padding(.top,10)
            
            
  
        }
    }
}

struct HeaderDetail_Previews: PreviewProvider {
    static var previews: some View {
        HeaderDetail(zoneDetail: ZoneModel(latitude: 2.0, longitude: 2.0, name: "", adress: "", open: "", socketOneName: "", socketOneState: "", socketTwoName: "", socketTwoState: "", id: ""))
    }
}
