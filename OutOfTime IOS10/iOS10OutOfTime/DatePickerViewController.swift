//
//  DatePickerViewController.swift
//  iOS10OutOfTime
//
//  Created by Lambda_School_Loaner_167 on 9/18/19.
//  Copyright © 2019 Dani. All rights reserved.
//

import UIKit

protocol DatePickerDelegate: AnyObject {
    func destinationDateWasChosen(Date: Date)
}

class DatePickerViewController: UIViewController {
    @IBAction func datePicker(_ sender: UIDatePicker) {
        
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("cancel")
    }
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.destinationDateWasChosen(Date: Date())
        self.dismiss(animated: true, completion: nil)
        print("done")
    }
    weak var delegate: DatePickerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

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
