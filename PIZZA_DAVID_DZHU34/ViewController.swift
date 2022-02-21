//
//  ViewController.swift
//  PIZZA_DAVID_DZHU34
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    
    
    let pizzaNames: [String] = ["The Original", "Spicy Pulled Pork Pizza", "Vegetarian Fiesta Pizza"]
    let descriptions: [String] = ["Pepperoni, cheese, green onions. Served with extra tomato sauce and three types of cheese.", "Slow-roasted pulled pork with a special spicy and smoky BBQ pizza sauce.", "Roasted red peppers, caramelized onions, sundried organic tomatoes, feta, and spinach, on a thin crust with pesto sauce."]
    var quantity:Int = 1
    var price:Double = 17.5
    
    @IBOutlet weak var sizeSegmentControl: UISegmentedControl!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet weak var quantityControl: UIStepper!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = pizzaNames[0]
        descriptionLabel.text = descriptions[0]
        quantityLabel.text = "\(quantity)"
        priceLabel.text = "\(price * Double(quantity))"
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzaNames.count
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pizzaNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nameLabel.text = pizzaNames[row]
        descriptionLabel.text = descriptions[row]
    }
    
    @IBAction func sizeChanged(_ sender: Any) {
  
        switch(sizeSegmentControl.selectedSegmentIndex){
        case 0:
            price = 15.5
            priceLabel.text = "\(price * Double(quantity))"
            break
        case 1:
            price = 17.5
            priceLabel.text = "\(price * Double(quantity))"
            break
        case 2:
            price = 21.5
            priceLabel.text = "\(price * Double(quantity))"
            break
        default:
            price = 17.5
            priceLabel.text = "\(price * Double(quantity))"
            break
        }
    }
  
    @IBAction func quantityChanged(_ sender: Any) {
        quantity = Int(quantityControl.value)
        quantityLabel.text = "\(quantity)"
        priceLabel.text = "\(price * Double(quantity))"
    }
    
    
    @IBAction func orderNow(_ sender: Any) {
       
        guard let screen2 = storyboard?.instantiateViewController(identifier: "screen2receipt") as? Screen2ViewController else{
            print("Cannot find a screen with an id of screen2recepit")
            return
        }
        
        func showSecondPage(){
            screen2.quantity = quantity
            screen2.name = nameLabel.text!
            if(sizeSegmentControl.selectedSegmentIndex == 0){
                screen2.size = "Small"
            } else if (sizeSegmentControl.selectedSegmentIndex == 1){
                screen2.size = "Medium"
            } else if (sizeSegmentControl.selectedSegmentIndex == 2){
                screen2.size = "Large"
            } else {
                screen2.size = "N/A"
            }
            
            screen2.subtotal = price * Double(quantity)
            show(screen2,sender: self)
        }
        
        let alert = UIAlertController(title: "PLACE ORDER", message: "Are you sure you are ready to place this order?", preferredStyle: UIAlertController.Style.alert)

                // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in  showSecondPage()}))
                alert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil))

                // show the alert
                self.present(alert, animated: true, completion: nil)
        
    }
    @IBAction func startOver(_ sender: Any) {
        price = 17.5
        quantity = 1
        sizeSegmentControl.selectedSegmentIndex = 1
        quantityControl.value = 1
        quantityLabel.text = "\(quantity)"
        priceLabel.text = "\(price * Double(quantity))"
        nameLabel.text = pizzaNames[0]
        descriptionLabel.text = descriptions[0]
        pickerView.selectRow(0, inComponent: 0, animated: true)
    }
}

