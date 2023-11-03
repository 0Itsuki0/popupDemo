//
//  ViewController.swift
//  PopupDemo
//
//  Created by Itsuki on 2023/11/03.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // popup
    @IBOutlet weak var popupContainerView: UIView!
    private var popupNavigationController: UINavigationController!
    private var popupShadowView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // styling for popup container
        popupContainerView.layer.borderColor = UIColor.clear.cgColor
        popupContainerView.layer.borderWidth = 1.0
        popupContainerView.layer.cornerRadius = 8.0
        popupContainerView.layer.masksToBounds = true
        
        
        // configure popup shadow view
        self.popupShadowView = UIView(frame: self.view.bounds)
        self.popupShadowView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.popupShadowView.backgroundColor = .black
        self.popupShadowView.alpha = 0.6
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TapGestureRecognizer))
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.delegate = self
        self.popupShadowView.addGestureRecognizer(tapGestureRecognizer)
        // one below pop up container
        view.insertSubview(self.popupShadowView, at: self.view.subviews.count - 1)
        
        
        // add popup navigation controller as child
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let navigationController = storyboard.instantiateViewController(withIdentifier: "PopupNavigationController") as? UINavigationController
        else {return}
        popupContainerView.insertSubview(navigationController.view, at: 0)
        addChild(navigationController)
        navigationController.didMove(toParent: self)
        

        // set navigation controller view constraints to be within the container view
        navigationController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationController.view.bottomAnchor.constraint(equalTo: self.popupContainerView.bottomAnchor),
            navigationController.view.topAnchor.constraint(equalTo: self.popupContainerView.topAnchor),
            navigationController.view.leftAnchor.constraint(equalTo: self.popupContainerView.leftAnchor),
            navigationController.view.rightAnchor.constraint(equalTo: self.popupContainerView.rightAnchor),

        ])

        // save navigationcontroller for future reference
        self.popupNavigationController = navigationController
        
        // hide popup initially
        self.popupShadowView.isHidden = true
        self.popupContainerView.isHidden = true
        
        
        
    }
    

    @IBAction func onShowPopupAlertButtonPressed(_ sender: UIButton) {
        
        let alert = PopupErrorViewController()
        self.present(alert, animated: true)
        
    }
    
    
    @IBAction func onShowPopupWithNavigationPressed(_ sender: UIButton) {
        
        guard let mainPopupViewController = self.popupNavigationController.viewControllers[0] as? MainPopupViewController
        else {return}
        mainPopupViewController.delegate = self
        mainPopupViewController.titleLabel.text = "hey pop up!"
        
        self.popupContainerView.isHidden = false
        self.popupShadowView.isHidden = false
    }
    
    
    @objc func TapGestureRecognizer(sender: UITapGestureRecognizer) {
        closePopup()
    }

}


extension ViewController: PopupDelegate {
    func closePopup() {
        self.popupNavigationController.popToRootViewController(animated: false)
        self.popupContainerView.isHidden = true
        self.popupShadowView.isHidden = true
    }
    
}

