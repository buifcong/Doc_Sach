//
//  DetailBookResponse.swift
//  Reavol_copy
//
//  Created by bùi thành công on 08/10/2022.
//

import Foundation
import ObjectMapper

class DetailBookResponse : Mappable {
    var createdAt : String?
    var updatedAt : String?
    var deleted : Bool?
    var id : Int?
    var name : String?
    var mediaId : Int?
    var price : String?
    var packageId : String?
    var status : String?
    var type : Int?
    var limitApply : Int?
    var description : String?
    var media : Media?
    var content : String?
    var numberDays : Int?
    var pushedNotification : Bool?
    var startDate : String?
    var endDate : String?
    var bookIds : String?
    var applied : Bool?
    var books : String?
    var articles : [Articles]?

    required init?(map: Map) {
    }
    
    init(){}

    func mapping(map: Map) {

        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        deleted <- map["deleted"]
        id <- map["id"]
        name <- map["name"]
        mediaId <- map["mediaId"]
        price <- map["price"]
        packageId <- map["packageId"]
        status <- map["status"]
        type <- map["type"]
        limitApply <- map["limitApply"]
        description <- map["description"]
        media <- map["media"]
        content <- map["content"]
        numberDays <- map["numberDays"]
        pushedNotification <- map["pushedNotification"]
        startDate <- map["startDate"]
        endDate <- map["endDate"]
        bookIds <- map["bookIds"]
        applied <- map["applied"]
        books <- map["books"]
        articles <- map["articles"]
    }
}

class Articles : Mappable {
    var deleted : Bool?
    var id : Int?
    var title : String?
    var subTitle : String?
    var author : String?
    var slug : String?
    var type : Int?
    var price : Int?
    var hot : Bool?
    var totalWords : Int?
    var media : Media?
    var viewCount : Int?
    var bought : Bool?
    var rating : Double?
    var totalChapter : Int?
    var favorite : Bool?
    var ppublic : Bool?

    required init?(map: Map) {
    }
    
    init(){}
    
    func mapping(map: Map) {

        deleted <- map["deleted"]
        id <- map["id"]
        title <- map["title"]
        subTitle <- map["subTitle"]
        author <- map["author"]
        slug <- map["slug"]
        type <- map["type"]
        price <- map["price"]
        hot <- map["hot"]
        totalWords <- map["totalWords"]
        media <- map["media"]
        viewCount <- map["viewCount"]
        bought <- map["bought"]
        rating <- map["rating"]
        totalChapter <- map["totalChapter"]
        favorite <- map["favorite"]
        ppublic <- map["public"]
    }

}


