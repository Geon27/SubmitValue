//
//  ViewController.swift
//  SubmitValue
//
//  Created by 육건 on 2022/11/15.
//
import UIKit
class ViewController: UIViewController {
    
    // 이메일 주소를 입력받는 Textfield
    @IBOutlet var email: UITextField!
    
    // 자동 갱신 여부를 설정하는 Switch
    @IBOutlet var isUpdate: UISwitch!
    
    // 갱신 주기를 설정하는 stepper
    @IBOutlet var interval: UIStepper!
    
    // 자동 갱신 여부를 표시하는 Lable
    @IBOutlet var isUpdateText: UILabel!
    
    // 갱신 주기를 분단위 + 텍스트로 표시하는 Lable
    @IBOutlet var intervalText: UILabel!
    
    // 자동 갱신 여부가 바뀔 때마다 호출되는 메소드
    @IBAction func onSwitch(_ sender: UISwitch) {
        if(sender.isOn == true) {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }

    // 갱신 주기가 바뀔때 마다 호출되는 메소드
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value) 분마다"
    }
    
    @IBAction func onSubmit(_sender: Any) {
        // VC2의 인스턴스 생성
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
            return
        }
        
        // 값 전달
        rvc.paramEmail = self.email.text! //이메일
        rvc.paramUpdate = self.isUpdate.isOn // 자동갱신 여부
        rvc.paramInterval = self.interval.value //갱신주기
        
        // 화면 이동
        self.present(rvc, animated: true)
    }
}
