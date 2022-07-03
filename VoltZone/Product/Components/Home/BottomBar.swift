//
//  BottomBar.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 3.07.2022.
//

import SwiftUI

struct BottomBar: View {
    @Binding var selectedIndex:Int

    var body: some View {
        VStack{
            Rectangle().fill(.white).shadow(color: .black, radius: 10, x: 0, y: -2).frame(
                width: 336, height: 72).cornerRadius(24).padding(.bottom,36).overlay {
                    HStack(spacing: 40){
                        Image(systemName:"map.fill").renderingMode(.template).resizable().aspectRatio(contentMode: .fill).foregroundColor(selectedIndex == 0 ? Color.init(hex: "#21A3BF") :  Color.gray).onTapGesture {
                            selectedIndex=0
                         }.frame(
                            width: 31, height: 22)
                            
                        Image(systemName:"bolt.fill").renderingMode(.template).resizable().aspectRatio(contentMode: .fill).foregroundColor(selectedIndex == 1 ? Color.init(hex: "#21A3BF") :  Color.gray).onTapGesture {
                             selectedIndex=1
                         }.frame(
                            width: 25, height: 20)

                        Image(systemName:"qrcode").renderingMode(.template).resizable().aspectRatio(contentMode: .fill).foregroundColor(selectedIndex == 2 ? Color.init(hex: "#21A3BF") :  Color.gray).onTapGesture {
                             selectedIndex=2
                         }.frame(
                        width: 31, height: 22)

                         Image(systemName:"person.crop.circle").renderingMode(.template).resizable().aspectRatio(contentMode: .fill).foregroundColor(selectedIndex == 3 ? Color.init(hex: "#21A3BF") :  Color.gray).onTapGesture {
                            selectedIndex=3
                         }.frame(
                            width: 31, height: 22)

                    }.padding(.bottom,26)
                }
        }
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar(selectedIndex: .constant(2))
    }
}
