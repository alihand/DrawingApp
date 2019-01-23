import UIKit

protocol SettingsVCDelegate:class {
    func settingsViewControllerDidFinish(_ settingsVC : SettingsViewController)
}
class SettingsViewController: UIViewController {
   
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var imageView: UIImageView!
    
    var red:CGFloat = 255.0
    var green:CGFloat = 255.0
    var blue:CGFloat = 255.0
    
    var delegate: SettingsVCDelegate?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        drawPreview(red: red, green: green, blue: blue)
        
        redSlider.value = Float(red)
        redLabel.text = String(Int(redSlider.value * 255))
        
        greenSlider.value = Float(green)
        greenLabel.text = String(Int(greenSlider.value * 255))
        
        blueSlider.value = Float(blue)
        blueLabel.text = String(Int(blueSlider.value * 255))
    }
    @IBAction func dismiss(_ sender: Any){
        if delegate != nil {
            delegate?.settingsViewControllerDidFinish(self)
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction func redSliderChanged(_ sender: Any){
        let slider = sender as! UISlider
        red = CGFloat(slider.value)
        drawPreview(red: red, green: green, blue: blue)
        redLabel.text = "\(Int(slider.value * 255))"
    }
    @IBAction func greenSliderChanged(_ sender: Any){
        let slider = sender as! UISlider
        green = CGFloat(slider.value)
        drawPreview(red: red, green: green, blue: blue)
        greenLabel.text = "\(Int(slider.value * 255))"
    }
    @IBAction func blueSliderChanged(_ sender: Any){
        let slider = sender as! UISlider
        blue = CGFloat(slider.value)
        drawPreview(red: red, green: green, blue: blue)
        blueLabel.text = "\(Int(slider.value * 255))"
    }
   func drawPreview(red : CGFloat,green : CGFloat,blue : CGFloat){
       imageView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 5.0)
    }    
}
