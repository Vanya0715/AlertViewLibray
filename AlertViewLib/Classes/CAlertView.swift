//
//  CAlertView.swift
//  AlertViewLib
//
//  Created by Vanya Sharma on 22/07/21.
//

import Foundation
import Foundation
import UIKit

public class CAlertView: UIView{
  
    static public let instance=CAlertView()
    
    @IBOutlet var ParentView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var Alert: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CAlertView", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func commonInit(){
        ParentView.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        ParentView.autoresizingMask=[.flexibleHeight, .flexibleWidth]
        Alert.layer.cornerRadius = 150
        img.layer.cornerRadius = 10.0
        img.clipsToBounds = true
        button.layer.cornerRadius=8.0
        button.clipsToBounds=true
    }
    

  public  enum AlertType{
    case success
    case exit
}
  public func showAlert(message:String, type:AlertType){
    self.message.text=message
    switch type {
    case .exit:
        img.image=UIImage(named: "Exit")
        button.backgroundColor=#colorLiteral(red: 1, green: 0.3348291516, blue: 0.3220227957, alpha: 1)
        button.setTitle("EXIT", for: .normal)
    case .success:
        img.image=UIImage(named: "Success")
        button.backgroundColor=#colorLiteral(red: 0.01176470588, green: 0.5960784314, blue: 0.6196078431, alpha: 1)
        button.setTitle("DONE", for: .normal)
   
    }
    UIApplication.shared.keyWindow?.addSubview(ParentView)
  }
    @IBAction func onClickDone(_ sender: Any) {
         ParentView.removeFromSuperview()
    }
    
}

