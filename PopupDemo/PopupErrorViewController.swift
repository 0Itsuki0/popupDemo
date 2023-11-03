//
//  MaintenanceAlertViewController.swift
//  collaboflow-ios
//
//  Created by Itsuki on 2023/10/05.
//

import UIKit

class PopupErrorViewController: UIViewController {
    static let controllerIdentifier = String(describing: PopupErrorViewController.self)
    
    var errorTitle: String = "Error"
    var errorMessage: String = "Error Message"
    

    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var errorTitleLabel: UILabel!
    @IBOutlet weak var alertContainerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertContainerView.layer.borderWidth = 1.0
        alertContainerView.layer.borderColor = UIColor.clear.cgColor
        alertContainerView.layer.cornerRadius = 4.0
        alertContainerView.clipsToBounds = true
        

        self.errorTitleLabel.text = "\(errorTitle)"
        self.errorMessageLabel.text = errorMessage
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    init() {
        super.init(nibName: PopupErrorViewController.controllerIdentifier, bundle: Bundle(for: PopupErrorViewController.self))
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func onCloseButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

