//
//  WeatherRoot.swift
//  API
//
//  Created by Alex on 1/15/21.
//  Copyright © 2021 Alex. All rights reserved.
//

import Foundation

class WeatherRoot {
    static func loadWeatherData(_ completion: @escaping (_ weather: StructWeather?) -> Void){
        let apiKey = "358389cc2e7b7f987ac85f1075b911c6"
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=Moscow&lang=ru&units=metric&appid=\(apiKey)"
        guard let url = URL(string: urlString)  else{
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            guard error == nil else {return}
            do{
                let weatherAPI = try JSONDecoder().decode(StructWeather.self, from: data)
                completion(weatherAPI)
            }
            catch {
                print(error.localizedDescription)
                completion(nil)
            }
        }
        task.resume()
    }
}
