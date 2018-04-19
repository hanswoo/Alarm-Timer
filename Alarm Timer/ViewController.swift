//
//  ViewController.swift
//  Alarm Timer
//
//  Created by D7702_10 on 2018. 4. 18..
//  Copyright © 2018년 ksh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    var myTimer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        timeLabel.text = formatter.string(from: myDatePicker.date)
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in
            self.updateTime()
        })
    }
    func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        currentTimeLabel.text = formatter.string(from: date)
        
        if currentTimeLabel.text == timeLabel.text {
            view.backgroundColor = UIColor.red
            let myAlertController = UIAlertController(title: "알림", message: "설정된 시간이 되었습니다.", preferredStyle: .actionSheet)
            
            //AlertAction 만들기
            let okAction = UIAlertAction(title: "확인", style: .default){(myAction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.red}
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: { (myAction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.white})
            let testAction = UIAlertAction(title: "삭제", style: .destructive, handler:{ (myAction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.white})
            self.timeLabel.text = "00:00:00"
            
            //AlertAction을 AlertController에 넣기
            myAlertController.addAction(okAction)
            myAlertController.addAction(cancelAction)
            myAlertController.addAction(testAction)
            
            //화면에 출력
            present(myAlertController, animated: true, completion: nil)
        }
    }

    
    @IBAction func changeDatePicker(_ sender: Any) {
        print("change Date Picker")
        print(myDatePicker.date)
        
        // dateFormat
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        timeLabel.text = formatter.string(from: myDatePicker.date)
    }
    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

