
import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid={token}&units=metric"// 해당 매개변수의 순서를 달리해도 문제없이 데이터를 받을 수 있게 된다.
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
        print(urlString)
    }
    
    func performRequest(urlString: String){ // 4단계를 수행하는 곳이다.
        if let url = URL(string: urlString){ // 1단계
            let session = URLSession(configuration: .default) // 2단계
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:)) // 3단계
            task.resume() // 4단계
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?){ // void는 생략 가능하다.
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
