import UIKit

struct CalculateBrain {
   
    var bmi: Float = 0.0
    
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi)
        return bmiTo1DecimalPlace
    }
    
    mutating func calculateBMI(height: Float, weight: Float){
        bmi = weight / pow(height, 2)
    }
    
    
}
