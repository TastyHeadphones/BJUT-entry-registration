//
//  Buildings.swift
//  BJUT-entry-registration
//
//  Created by Magic Keegan on 4/8/22.
//

import Foundation

struct Building{
    static var allBuildings: [Building] = [Building(id: 2, name: "第一教学楼"),Building(id: 3, name: "第二教学楼"),Building(id: 4, name: "第三教学楼"),Building(id: 5, name: "第四教学楼")]
    
    static let buildingWeb = "https://itsapp.bjut.edu.cn/site/epidehealth/masterqrcode"
    //?door_id=
    let id:Int
    let name:String
    
    static func generateBuildingRequest(id:Int){
        
        
        
    }
    
}
