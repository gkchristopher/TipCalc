//
//  CalcViewController.swift
//  Tip Calculator
//
//  Created by Christopher J Moore on 10/4/15.
//  Copyright © 2015 Green Dragon Apps. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    
    enum CalcComponents: Int {
        case Dollars
        case Cents
        case Percent
        case Split
    }
    
    struct NumberOfRows {
        static let Dollars = 501
        static let Cents = 100
        static let Percent = 5
    }
    
    let brain = CalculatorBrain()
    let availablePercentages = [0.25, 0.20, 0.18, 0.15, 0.10]
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView! {
        didSet {
            pickerView.selectRow(NumberOfRows.Dollars - 25 - 1, inComponent: CalcComponents.Dollars.rawValue, animated: false)
            pickerView.selectRow(NumberOfRows.Cents / 2 - 1, inComponent: CalcComponents.Cents.rawValue, animated: false)
            pickerView.selectRow(NumberOfRows.Percent / 2, inComponent: CalcComponents.Percent.rawValue, animated: false)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CalcViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    

    
    // DataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let result: Int
        guard let compIndex = CalcComponents(rawValue: component) else {
            return 0
        }
        switch compIndex {
        case .Dollars:
            result = 501
        case .Cents:
            result = 100
        case .Percent:
            result = availablePercentages.count
        case .Split:
            result = 20
        }
        return result
    }
    
    // Delegate
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result: String
        guard let compIndex = CalcComponents(rawValue: component) else {
            return "---"
        }
        switch compIndex {
        case .Dollars:
            result = String(501 - row - 1)
        case .Cents:
            result = String(format: "%02d", arguments: [100 - row - 1])
        case .Percent:
            result = "\(Int(availablePercentages[row] * 100)) %"
        case .Split:
            result = String(20 - row)
        }
        return result
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
}
