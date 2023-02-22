//
//  NetworkService.swift
//  RainAlarm
//
//  Created by artem on 17.02.2023.
//

import Foundation


class NetworkService {
    
    static let shared = NetworkService()
    private let url_api_key = "dd3993cc50098ccefe7471cef0d6edbb"
    var url_latitude: String?
    var url_longitude: String?
    private var url_units = "metric"
    private var url_exclude = "current,minutely,daily,alerts"
    private var url_get_one_call = ""
    private let url_base = "https://api.openweathermap.org/data/3.0/onecall?"
    private let sesion = URLSession(configuration: .default)
    
    private func bildUrl() -> String? {
        guard let url_latitude = url_latitude else {return nil}
        guard let url_longitude = url_longitude else {return nil}
        url_get_one_call = url_base + "lat=" + url_latitude + "&lon=" + url_longitude + "&exclude=" + url_exclude + "&appid=" + url_api_key + "&units=" + url_units
        return url_get_one_call
    }
    
    func getWeather(onSuccess: @escaping (ModelForJson?)-> Void, onError: @escaping (String) -> Void) {
        // Здійснюється виклик API
        guard let urlString = bildUrl() else {return}
        guard let url = URL(string: urlString) else {
            onError("Error bilding URL")
            return
        }
        
        // Передаємо URL для виклику
        let task = sesion.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    onError("Invalid data or response")
                    return
                }
                
                do {
                    print(response.statusCode)
                    if response.statusCode == 200 {
                        // Пертворюємо результати JSON на екземпляр struct який ми створили в нашій моделі дані перетворюються на структуру ModelForJsone
                        let items = try JSONDecoder().decode(ModelForJson.self, from: data)
                        print(items)
                        onSuccess(items)
                    } else {
                        onError("Response wasn't 200. It was: " + "\n\(response.statusCode)")
                    }
                } catch {
                    onError(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
}

