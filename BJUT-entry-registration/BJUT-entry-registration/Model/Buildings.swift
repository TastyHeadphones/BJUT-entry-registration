//
//  Buildings.swift
//  BJUT-entry-registration
//
//  Created by Magic Keegan on 4/8/22.
//
import Foundation

class Building{
    static var allBuildings: [Building] = [Building(id: 2, name: "第一教学楼"),Building(id: 3, name: "第二教学楼"),Building(id: 4, name: "第三教学楼"),Building(id: 5, name: "第四教学楼"),Building(id: 6, name: "学生公寓1号楼"),Building(id: 7, name: "学生公寓2号楼"),Building(id: 8, name: "学生公寓3号楼")]
    
    //?door_id=
    let id:Int
    let name:String
    
    init(id:Int,name:String){
        self.id = id
        self.name = name
    }
    
    func generateBuildingRequest() -> URLRequest{
        let buildingWeb = "https://itsapp.bjut.edu.cn/site/epidehealth/masterqrcode"
        let url = URL(string: "\(buildingWeb)?door_id=\(id)")!
        let request = URLRequest(url: url)
        return request
    }
    
}
