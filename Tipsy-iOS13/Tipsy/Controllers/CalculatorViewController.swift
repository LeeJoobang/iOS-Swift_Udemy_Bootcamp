import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        print("tip")
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        print("stepper")
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        print("calculated")
    }
}

