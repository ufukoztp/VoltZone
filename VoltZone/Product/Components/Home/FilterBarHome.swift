//
//  FilterBar.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 3.07.2022.
//

import SwiftUI

struct FilterBarHome: View {
     var body: some View {
        
        HStack(spacing: 0){
     
       
            
            Rectangle().fill(.white).frame(width: 32, height: 32).overlay {
                Image(systemName: "slider.horizontal.3")
            }.cornerRadius(8).padding(.top,54).padding(.leading,8)
        }
    }
}


struct FilterBar_Previews: PreviewProvider {
    static var previews: some View {
        FilterBarHome()
    }
}
