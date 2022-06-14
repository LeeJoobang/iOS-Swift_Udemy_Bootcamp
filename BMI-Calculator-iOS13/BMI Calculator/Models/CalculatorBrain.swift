import UIKit

struct CalculateBrain {
   
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? "0.0")
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        let bmiAdvice = bmi?.advice ?? ""
        return bmiAdvice
    }
    
    func getColor() -> UIColor {
        let bmiColor = bmi?.color ?? .white
        return bmiColor
    }
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / pow(height, 2)
        var tmpAdvice = ""
        if bmiValue < 18.5 {
            tmpAdvice = "Underweight"
            bmi = BMI(value: bmiValue, advice: tmpAdvice, color: .blue)
        } else if bmiValue < 24.9 {
            tmpAdvice = "Normal"
            bmi = BMI(value: bmiValue, advice: tmpAdvice, color: .orange)
        } else {
            tmpAdvice = "Overweight"
            bmi = BMI(value: bmiValue, advice: tmpAdvice, color: .red)
        }
    }
    
    
}
