//
//  PlaceAnnotationView.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 3.07.2022.
//

import SwiftUI

struct PlaceAnnotationView: View {
  @State private var showTitle = true
    var onTap :()->Void
  let title: String
  
  var body: some View {
    VStack(spacing: 0) {
      Text(title)
        .font(.callout)
        .padding(5)
        .background(Color(.white))
        .cornerRadius(10)
        .opacity(showTitle ? 0 : 1)
    
         Image("sharznetacicon").onTapGesture {
            onTap()
        }
        .font(.caption)
        .foregroundColor(.blue)
        .offset(x: 0, y: -5)
    }
    .onTapGesture {
      withAnimation(.easeInOut) {
        showTitle.toggle()
      }
    }
  }
}


struct PlaceAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceAnnotationView(onTap: {}, title: "")
    }
}
