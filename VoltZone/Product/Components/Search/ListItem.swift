//
//  ListItem.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 1.07.2022.
//

import SwiftUI

struct ListItem:View{
    
    @State var name : String
    @State var adress : String
    @State var open : String
    @State var socketName : [String]

    
    var body: some View{
        HStack{
            Image("sharznetacicon").padding()
            HStack{
                VStack(alignment: .leading){
                    Text(name).font(.headline)
                    Text(adress).font(.custom("footnote", size: 13)).foregroundColor(.gray).padding(1)
                    Text("Kullanım saatleri : \(open)").font(.custom("caption", size: 10)).foregroundColor(.gray).padding(1)
                }
                VStack(alignment: .trailing){
                    Text("Soket Durumu").font(.subheadline).bold()
                    
                    ForEach(socketName, id: \.self){item in
                        HStack{
                            Circle().fill(.green).frame(width: 8, height: 8)
                            Text(item).font(.footnote)

                        }
                    }
                    
                  
                

                  }.padding(.trailing,1)

            }
        }
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(name: "", adress: "", open: "", socketName: [])
    }
}
