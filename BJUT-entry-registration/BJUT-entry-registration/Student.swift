//
//  Student.swift
//  BJUT-entry-registration
//
//  Created by Magic Keegan on 4/9/22.
//

class Student:Codable{
    let name: String
    let id: String
    
    init(name:String,id:String){
        self.name = name
        self.id = id
    }
    
    static var shared: [Student] = [Student(name: "刘泽明", id: "19025212"),Student(name: "王泽明", id: "19025222"),Student(name: "周泽明", id: "19025242")]
    
    static let mySelf = Student(name: "李泽宁", id: "19022112")
    
}
