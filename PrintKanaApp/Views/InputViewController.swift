//
//  InputViewController.swift
//  PrintKanaApp
//
//  Created by 片岡勇人 on 2019/06/05.
//  Copyright © 2019 HayatoKataoka. All rights reserved.
//

import UIKit

final class InputViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var convertKanaButton: UIButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func tappedConvertKanaButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: R.segue.inputViewController.toOutput, sender: nil)
    }
}
