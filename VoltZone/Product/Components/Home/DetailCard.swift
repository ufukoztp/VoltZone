//
//  DetailCard.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 3.07.2022.
//

import SwiftUI

struct DetailCard: View {
    var data : Place?
    var onTapClear : ()->Void
    
    var body: some View {
        Rectangle().fill(.white).shadow(color: .black, radius: 10, x: 0, y: -2).frame(
            width: 336, height: 184).cornerRadius(24).padding(.bottom,35).overlay {
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "xmark").foregroundColor(.black).onTapGesture {
                            onTapClear()
                        }.padding(.top).padding(.leading)
                        Spacer()
                    }
                    HStack{
                        Text(data!.name).foregroundColor(.black).bold().padding(.leading)
                        Spacer()
                        Image("esarj")
                        Text("2.2km").bold().padding(.trailing)
                    }
                    
                    Text(data!.adress).font(.footnote).padding(.leading).foregroundColor(.gray)
                    HStack{
                        Image("soket1")
                        VStack{
                            Text(data!.socketOneName).font(.footnote).foregroundColor(.gray).padding(.bottom,5)
                            
                            HStack{
                                Text(data!.socketOneState).font(.footnote).foregroundColor(.gray)
                                Circle().fill(.green).frame(width: 8, height: 8)
                            }
                            
                        }
                        Image("soket2")
                        
                        VStack{
                            Text(data!.socketTwoName).font(.footnote).foregroundColor(.gray).padding(.bottom,5)
                            
                            HStack{
                                Text(data!.socketTwoState).font(.footnote).foregroundColor(.gray)
                                Circle().fill(.green).frame(width: 8, height: 8)
                            }
                            
                        }
                    }
                    
                    Spacer()
                }
            }
    }
}

struct DetailCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailCard(onTapClear: {})
    }
}
