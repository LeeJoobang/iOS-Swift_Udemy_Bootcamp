import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        let leftDiceNumber = Int.random(in: 0...5)
        let rightDiceNumber = Int.random(in: 0...5)
        let diceImages = [UIImage(named: "DiceOne"),
                         UIImage(named: "DiceTwo"),
                         UIImage(named: "DiceThree"),
                         UIImage(named: "DiceFour"),
                         UIImage(named: "DiceFive"),
                         UIImage(named: "DiceSix")]
        
        diceImageView1.image = diceImages[leftDiceNumber]
        diceImageView2.image = diceImages[rightDiceNumber]
    }
}

