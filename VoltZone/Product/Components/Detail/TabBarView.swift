//
//  TabBarView.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 1.07.2022.
//

import SwiftUI

struct TabBarViewHeader : View{
    @Binding var index : Int
    
    var body: some View{
        VStack{
            HStack(spacing: 30){
                Text("Yorumlar").foregroundColor(index == 0 ? .blue : .gray).onTapGesture {
                    index=0
                }
                Text("Prizler").foregroundColor(index == 1 ? .blue : .gray).onTapGesture {
                    index=1
                }
                Text("Fotoğraflar").foregroundColor(index == 2 ? .blue : .gray).onTapGesture {
                    index=2
                }
                Text("Detaylar").foregroundColor(index == 3 ? .blue : .gray).onTapGesture {
                    index=3
                }
            }
            
        }
    }
}


struct TabBarViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        TabBarViewHeader(index: .constant(2))
    }
}
