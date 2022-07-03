//
//  SearchView.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 23.06.2022.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    @StateObject var searchViewModel : SearchViewModel = SearchViewModel(FirebaseService())
    

     var body: some View {
         //back icon
         VStack(alignment: .leading){
             Image(systemName: "chevron.backward")
                 .frame(width: 35, height: 35).onTapGesture {
                     self.presentationMode.wrappedValue.dismiss()
                 }
           //search bar
           FilterBarSearch(searchViewModel: searchViewModel)
             
             //searc result
             ForEach(searchViewModel.places){ item in
                Divider()
                 ListItem(name: item.name, adress: item.adress,open: item.open,socketName: [item.socketOneName,item.socketTwoName])
             }
             
             
             Spacer()
         }.navigationBarBackButtonHidden(true).navigationBarHidden(true)

     }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}



