//
//  StructWeather.swift
//  API
//
//  Created by Alex on 1/15/21.
//  Copyright © 2021 Alex. All rights reserved.
//

import Foundation

// MARK: - StructWeather

struct StructWeather: Codable {
    
    var list: [List]
    var city: City
    
    enum CodingKeys: String, CodingKey {
        case list = "list"
        case city = "city"
        
    }
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        list = try values.decode([List].self, forKey: .list)
        city = try values.decode(City.self, forKey: .city)
    }
}

// MARK: - List
struct List: Codable {
    var main: Main
    var weather: [Weather]
    var wind: Wind
    var dttxt: String?
    
    enum CodingKeys: String, CodingKey {
        case main = "main"
        case weather = "weather"
        case wind = "wind"
        case dttxt = "dt_txt"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        main = try values.decode(Main.self, forKey: .main)
        weather = try values.decode([Weather].self, forKey: .weather)
        wind = try values.decode(Wind.self.self, forKey: .wind)
        dttxt = try values.decode(String.self, forKey: .dttxt)
    }
}

// MARK: - Main
struct Main: Codable {
    var temp: Double?
    var tempString: String {
        return String(format: "%.1f", temp!)
    }
    var feelslike: Double?
    var feelslikeString: String {
        return String(format: "%.1f", feelslike!)
    }
    
    var pressure: Int?
    var humidity: Int?
    var humidityString: String {
        return String(format: "%02d", humidity!)
    }
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelslike = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
    }
    
    init(from decoder: Decoder) throws {
        do{
            let values = try decoder.container(keyedBy: CodingKeys.self)
            temp = try values.decode(Double.self, forKey: .temp)
            feelslike = try values.decode(Double.self, forKey: .feelslike)
            pressure = try values.decode(Int.self, forKey: .pressure)
            humidity = try values.decode(Int.self, forKey: .humidity)
        }catch{
            print(error)
        }
    }
}

// MARK: - Weather
struct Weather: Codable {
    var main: String?
    var description: String?
    var icon: String?

    enum CodingKeys: String, CodingKey {
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        main = try values.decode(String.self, forKey: .main)
        description = try values.decode(String.self, forKey: .description)
        icon = try values.decode(String.self, forKey: .icon)
    }
}

// MARK: - Wind
struct Wind: Codable {
    var speed: Double?

    enum CodingKeys: String, CodingKey{
        case speed = "speed"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        speed = try values.decode(Double.self, forKey: .speed)
    }
}

// MARK: - City
struct City: Codable {
    
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
    }
}
