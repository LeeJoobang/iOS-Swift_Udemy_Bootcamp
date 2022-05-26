import UIKit

class ViewController: UIViewController {
    
    let timeDictionary = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    var countTime = ["Soft" : 5, "Medium" : 6, "Hard" : 7]
    var timer = Timer()
    
    var progressBar: UIProgressView!
    
    @IBOutlet weak var myLabel: UILabel!
    
    func doneLabel(){
        self.myLabel.text = "Done"
    }
    
    func firstLabel(){
        self.myLabel.text = "How do you like your eggs?"
    }
    
    @IBAction func HardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        self.firstLabel()
        
        if let hardness = sender.currentTitle {
            if let value = timeDictionary[hardness]{
                print("time: \(value) min")
            }
            if var valueTime = countTime[hardness] {
                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ (Timer) in
                    if valueTime > 0 {
                        print("\(valueTime) secound")
                        valueTime -= 1
                    } else {
                        self.timer.invalidate()
                        self.doneLabel()
                        print("Finish")
                    }
                }
            }
        }
    }
    
    
}
