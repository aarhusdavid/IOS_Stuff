//
//  ViewController.swift
//  dAarhus_Project03
//
//  Created by David Aarhus on 10/20/20.
//  Copyright © 2020 David Aarhus. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var redInput: UITextField!
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var blueInput: UITextField!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var greenInput: UITextField!
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet var bgView: UIView!
    
    
    @IBAction func adjustSlider(_ sender: Any)
    {
        let redVal = CGFloat(redSlider.value / 255)
        let blueVal = CGFloat(blueSlider.value / 255)
        let greenVal = CGFloat(greenSlider.value / 255)
        
        let color = UIColor(red: redVal, green: greenVal, blue: blueVal, alpha: 1)
        
        redInput.text = String(Int(redSlider.value))
        greenInput.text = String(Int(greenSlider.value))
        blueInput.text = String(Int(blueSlider.value))
        
        bgView.backgroundColor = color;
        
    }
    
    @IBAction func changedText(_ sender: Any) {
        let redVal = Float(redInput.hasText ? redInput.text! : "255") ?? 255
        let greenVal = Float(greenInput.hasText ? greenInput.text! : "255") ?? 255
        let blueVal = Float(blueInput.hasText ? blueInput.text! : "255") ?? 255

        redSlider.value = redVal
        greenSlider.value = greenVal
        blueSlider.value = blueVal
        
        adjustSlider(self)
    }
    
    
    @IBAction func clickSave( sender: Any)
    {
        
        let inputRed = Int(redSlider.value)
        let inputBlue = Int(blueSlider.value)
        let inputGreen = Int(greenSlider.value)

        StorageHandler.set(value: [inputRed, inputGreen, inputBlue])

    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(ViewController.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
        
        
        redSlider.value = 255
        greenSlider.value = 255
        blueSlider.value = 255
        
    }

    
    @objc func keyboardWillShow(notification: NSNotification)
    {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else
        {
            return
        }
        
        self.view.frame.origin.y = 0 - keyboardSize.height
    }
    
    @objc func keyboardWillHide(notifictiation: NSNotification)
    {
        self.view.frame.origin.y = 0
    }

    @objc func didTapView()
    {
        self.view.endEditing(true)
    }

}
