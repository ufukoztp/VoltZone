//
//  ZoneMode.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 22.06.2022.
//

import Foundation

struct ZoneModel:Codable{
    public var latitude: Double
    public var longitude: Double
    var name: String
    var adress : String
    var open :String
    var socketOneName : String
    var socketOneState : String
    var socketTwoName : String
    var socketTwoState :String
    var id :String


}
