//
//  ZoneDetail.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 29.06.2022.
//

import SwiftUI

struct ZoneDetail: View {
    @State var index : Int = 0
    @StateObject var detailViewModel : DetailViewModel = DetailViewModel(firebaseService: FirebaseService())
    var zoneId :String


    var body: some View {
        ScrollView{
            if detailViewModel.zoneDetail != nil {
                VStack{
                    HeaderDetail(zoneDetail: detailViewModel.zoneDetail!)
                    TabBarViewHeader(index: $index).padding(.top,20)
                    switch index {
                    case 0:
                        ForEach(detailViewModel.comment){ comment in
                            Comment(text: comment.text, name: comment.name, carName:comment.carName,photoUrl: comment.photoUrl)
                        }
                    
                     
                    case 1:
                        Image("page_not_found").resizable().aspectRatio(contentMode: .fill).frame(width: 250, height: 250)
                    case 2:
                        Image("page_not_found").resizable().aspectRatio(contentMode: .fill).frame(width: 250, height: 250)
                    case 3:
                        Image("page_not_found").resizable().aspectRatio(contentMode: .fill).frame(width: 250, height: 250)
                    default:
                        Image("page_not_found").resizable().aspectRatio(contentMode: .fill).frame(width: 250, height: 250)

                    }
                    Spacer()

                 }

            }else{
                ProgressView()
            }

        }.onAppear {
            detailViewModel.fetchComments()
            detailViewModel.fetchZoneDetail(zoneId: self.zoneId)
        }
       
    }
}

struct ZoneDetail_Previews: PreviewProvider {
    static var previews: some View {
        ZoneDetail(zoneId: "CIJ2pRioszdf8MRNU7j7")
    }
}



