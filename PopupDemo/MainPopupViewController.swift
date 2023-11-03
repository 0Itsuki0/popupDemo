//
//  MainPopupViewController.swift
//  PopupDemo
//
//  Created by Itsuki on 2023/11/03.
//

import UIKit

protocol PopupDelegate {
    func closePopup()
}


class MainPopupViewController: UIViewController {
    static let controllerIdentifier = String(describing: MainPopupViewController.self)
    var delegate: PopupDelegate?


    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    @IBAction func onCloseButtonPressed(_ sender: UIButton) {
        delegate?.closePopup()
    }
    

    @IBAction func onToDetailPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailPopupViewController = storyboard.instantiateViewController(withIdentifier: DetailPopupViewController.controllerIdentifier) as? DetailPopupViewController
        else {return}
        detailPopupViewController.delegate = self.delegate
        
        navigationController?.pushViewController(detailPopupViewController, animated: true)
        
        
    }
    

}
