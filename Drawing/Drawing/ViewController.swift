import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    
    var isDrawing = true
    var red:CGFloat = 255.0
    var green:CGFloat = 255.0
    var blue:CGFloat = 255.0

    override func viewDidLoad(){
        super.viewDidLoad()
    }
    @IBAction func clearButton(_ sender: Any){
        drawView.clearCanvas()
        red = 0.0
        green = 0.0
        blue = 0.0
    }
    @IBAction func greenButton(sender: Any){
        drawView.lineColor = UIColor.green.cgColor
    }
    @IBAction func redButton(sender: Any){
        drawView.lineColor = UIColor.red.cgColor
    }
    @IBAction func blueButton(sender: Any){
        drawView.lineColor = UIColor.blue.cgColor
    }
    @IBAction func orangeButton(sender: Any){
        drawView.lineColor = UIColor.orange.cgColor
    }
    @IBAction func purpleButton(sender: Any){
        drawView.lineColor = UIColor.purple.cgColor
    }
    @IBAction func yellowButton(sender: Any){
        drawView.lineColor = UIColor.yellow.cgColor
    }
    @IBAction func grayButton(sender: Any){
        drawView.lineColor = UIColor.gray.cgColor
    }
    @IBAction func eraseButton(sender: Any){
        if(isDrawing){
            drawView.lineColor = UIColor.black.cgColor
        }
    }
    @IBAction func settingsButton(_ sender: Any){
        let color = UIColor.init(red: red, green: green, blue: blue, alpha: 5.0).cgColor
        drawView.lineColor = color
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        let settingsVC = segue.destination as! SettingsViewController
        settingsVC.delegate = self
        settingsVC.red = red
        settingsVC.green = green
        settingsVC.blue = blue
    }
}
extension ViewController : SettingsVCDelegate{
    func settingsViewControllerDidFinish(_ settingsVC : SettingsViewController) {
        self.red = settingsVC.red
        self.green = settingsVC.green
        self.blue = settingsVC.blue
    }
}
