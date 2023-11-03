//
//  DetailPopupViewController.swift
//  PopupDemo
//
//  Created by Itsuki on 2023/11/03.
//

import UIKit

class DetailPopupViewController: UIViewController {
    static let controllerIdentifier = String(describing: DetailPopupViewController.self)
    var delegate: PopupDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    @IBAction func onBackToMainPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)

    }
    
    @IBAction func onCloseButtonPressed(_ sender: UIButton) {
        delegate?.closePopup()
    }
    

}
