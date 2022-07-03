//
//  Comment.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 1.07.2022.
//

import SwiftUI

struct Comment : View{
    
    @State var text : String
    @State var name : String
    @State var carName : String
    @State var photoUrl : String
    
    
    var body: some View {
        VStack{
            //comment
            Rectangle().fill(Color(hex: "#E4E4E4")).frame(width: 315, height: 90, alignment: .center).cornerRadius(10).padding(.top).overlay{
                HStack{
                 
                    //photo
                    AsyncImage(url: URL(string: photoUrl)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 32, height: 32).cornerRadius(100).padding(.leading)
                    //name&car
                    VStack{
                        Text(name).font(.custom("footnote", size: 10))
                        Text(carName).foregroundColor(.gray).font(.custom("body", size: 10)).padding(.top,2)
                     }
                    //Divider
                    Rectangle().fill(.gray).frame(width: 1, height: 56).padding(.top,12)
                    //comment content
                    VStack{
                         Text(text).font(.custom("body", size: 9))
                     }
                   
                    Spacer()
                }
             }
        }
    }
}


struct Comment_Previews: PreviewProvider {
    static var previews: some View {
        Comment(text: "asfasffdsfg", name: "", carName: "",photoUrl: "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-card-40-iphone13pro-202203_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1644989935246")
    }
}
