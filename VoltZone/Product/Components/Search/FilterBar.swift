//
//  FilterBar.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 1.07.2022.
//

import SwiftUI

struct FilterBarSearch: View {
   @State var textfield : String = ""
   @StateObject var searchViewModel : SearchViewModel
    
    
    var body: some View {
        HStack(spacing: 0){
            Rectangle().fill(.white).frame(width: 240, height: 32).overlay {
                HStack{
                    Image(systemName:textfield=="" ?"magnifyingglass":"xmark").renderingMode(.template).foregroundColor(Color.gray).padding().onTapGesture {
                        textfield = ""
                        searchViewModel.fetchZones()

                    }
                    Spacer()
                    TextField("Şarj istasyonu ara", text: $textfield) { response in
                        if textfield != ""{
                            searchViewModel.fetchZonesFilter(filter: textfield)
                        }else{
                            searchViewModel.fetchZones()

                        }
                     }
                    Spacer()
                   
                }
            }.cornerRadius(8).padding(.top,34).padding(.leading,48).padding(.bottom,24) .shadow(color: .gray, radius: 1,x: 0,y: 1)
            Spacer()

    
        }.onAppear {
            searchViewModel.fetchZones()
        }
    }
}


struct FilterBarSearch_Previews: PreviewProvider {
    static var previews: some View {
        FilterBarSearch(searchViewModel: SearchViewModel(FirebaseService()))
    }
}
