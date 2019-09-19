//
//  TimeCircuitViewController.swift
//  iOS10OutOfTime
//
//  Created by Lambda_School_Loaner_167 on 9/18/19.
//  Copyright © 2019 Dani. All rights reserved.
//

import UIKit

class TimeCircuitViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var setDestinationButtonTapped: UIButton!
    
//    MARK: - Methods
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        startTimer()
    }
    var currentSpeed: Int = 0
    var timer: Timer?
    
    var dateformatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MMMM.dd"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()

    
    weak var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ---"
    }
    

//         MARK: - Functions
    func startTimer() {
        resetTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
        
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
        
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed <= 88 {
            currentSpeed += 1
            speedLabel.text = String(currentSpeed)
        } else {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            
            let alert = UIAlertController(title: "Time Travel Successful!", message: "You've Arrived at \(String(describing: destinationTimeLabel.text))", preferredStyle: .alert)
            self.present(alert, animated: true)
            
        }
    }
  
    
    // MARK: - Navigation

//     Returns SELF because you set the view controller when you called the segue identifier
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ModalDestinationDatePickerSegue" {
            let datePickerVC = segue.destination as! DatePickerViewController
            datePickerVC.delegate = self
    }
              }

}
    extension TimeCircuitViewController: DatePickerDelegate {
    func destinationDateWasChosen(Date: Date) {
        let date = dateformatter.string(from: Date)
        destinationTimeLabel.text = date
    }
    
  
   
    
}

                

