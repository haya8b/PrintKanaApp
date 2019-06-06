//
//  OutputViewController.swift
//  PrintKanaApp
//
//  Created by 片岡勇人 on 2019/06/05.
//  Copyright © 2019 HayatoKataoka. All rights reserved.
//

import UIKit

final class OutputViewController: UIViewController {
    
    // Input画面から値を受け取る
    var convertHiragana: ConvertHiragana!
    
    // MARK: - IBOutlet

    @IBOutlet private weak var outputLabel: UILabel!
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = convertHiragana.converted
    }

}
