
import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid={token}&units=metric"// 해당 매개변수의 순서를 달리해도 문제없이 데이터를 받을 수 있게 된다.
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){ // 4단계를 수행하는 곳이다.
        if let url = URL(string: urlString){ // 1단계
            let session = URLSession(configuration: .default) // 2단계
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            } // 3단계
            task.resume() // 4단계
        }
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
            
        } catch {
            print(error)
        }
    }
    
}
