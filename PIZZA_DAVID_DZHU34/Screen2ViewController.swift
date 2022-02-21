//
//  Screen2ViewController.swift
//  PIZZA_DAVID_DZHU34
//

import UIKit

class Screen2ViewController: UIViewController {

   
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var subtotalLabel: UILabel!
    @IBOutlet var taxLabel: UILabel!
    @IBOutlet var finalTotalLabel: UILabel!
    
    var name:String = ""
    var size:String = ""
    var quantity:Int = 0
    var subtotal:Double = 0.0
    var tax:Double = 0.0
    var finalTotal:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        sizeLabel.text = size
        quantityLabel.text = "\(quantity)"
        subtotal = round(subtotal * 100) / 100.0
        subtotalLabel.text = "\(subtotal)"
        tax = round((subtotal * 0.13) * 100 ) / 100.0
        taxLabel.text = "\(tax)"
        finalTotal = round((subtotal * 1.13) * 100) / 100.0
        finalTotalLabel.text = "\(finalTotal)"
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
