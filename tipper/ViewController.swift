
import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var totalbill: UITextField!
    @IBOutlet weak var tip: UITextField!
    @IBOutlet weak var total: UITextField!
    @IBOutlet weak var tippercentagelabel: UILabel!
    @IBOutlet weak var splitlabel: UILabel!
    @IBOutlet weak var tipsplit: UITextField!
    @IBOutlet weak var totalsplit: UITextField!
    
    var totalBill:Double?{
        return Double(totalbill.text!)
    }
    var tipPercentage:Double=0.15
    var numberOfPeople:Double=1.0
    private var formatter:NumberFormatter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalbill.delegate=self
        formatter=NumberFormatter()
        formatter.numberStyle=NumberFormatter.Style.decimal
        formatter.minimum=0
    }
    @IBAction func tipsliderpressed(_ sender: UISlider) {
        let sliderValue=Int(sender.value)
        tippercentagelabel.text="\(sliderValue)%"
        tipPercentage=Double(Int(sender.value))*0.01
        updateInterface()
    }
    
    @IBAction func splitbutton(_ sender: UIStepper) {
        let stepperValue=Int(sender.value)
        splitlabel.text="\(stepperValue)"
        numberOfPeople=Double(stepperValue)
        updateInterface()
    }
    
    @IBAction func totalbillchanged(_ sender: UITextField) {
        updateInterface()
    }
        func updateInterface(){
            if let totalBill=self.totalbill{
                tip.text = String(format:"$%.2f",(totalBill*tipPercentage))
                total.text = String(format:"$%.2f",(totalBill*tipPercentage+totalBill))
                tipsplit.text = String(format:"$%.2f",(totalbill*tipPercentage/numberOfPeople))
               totalsplit.text = String(format:"$%.2f",((totalbill*tipPercentage)+totalBill)/numberOfPeople)
            }
        }
        
    }

