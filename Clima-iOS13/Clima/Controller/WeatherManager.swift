
import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=bcc2e52faef1005683be007c393be5f6&units=metric"// 해당 매개변수의 순서를 달리해도 문제없이 데이터를 받을 수 있게 된다.
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
