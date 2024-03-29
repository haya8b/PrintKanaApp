//
//  InputViewController.swift
//  PrintKanaApp
//
//  Created by 片岡勇人 on 2019/06/05.
//  Copyright © 2019 HayatoKataoka. All rights reserved.
//

import UIKit
import Moya
import Toast_Swift

protocol InputViewProtcol: class {
    func showSpinnerToast()
    func successHiraganaAPI()
    func errorHiraganaAPI()
}

final class InputViewController: UIViewController {
    
    private lazy var inputPresenter = InputPresenter(viewProtcol: self)

    // MARK: - IBOutlet
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var convertKanaButton: UIButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Keyboad監視用のNotificationを設定
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleKeyboardWillShowNotification(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleKeyboardWillHideNotification(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    // MARK: - IBAction
    
    @IBAction func tappedConvertKanaButton(_ sender: UIButton) {
        guard let inputText = inputTextField.text, !inputText.isEmpty else {
            self.view.makeToast("文字が入力されていません")
            return
        }
        
        inputPresenter.requestHiraganaAPI(sentence: inputText)
    }
    
    @IBAction func tappedView(_ sender: UITapGestureRecognizer) {
        // キーボード外タップ時にキーボードを閉じる
        self.view.endEditing(true)
    }
    
    // MARK: - PrepareForSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.inputViewController.toOutput.identifier,
            let outputViewController = segue.destination as? OutputViewController {
            outputViewController.convertHiragana = inputPresenter.getConvertHiraganaData()
        }
    }
    
    // MARK: - PrivateMethods

    ///  キーボード表示時
    ///
    /// - Parameter notification: Notification
    @objc private func handleKeyboardWillShowNotification(_ notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }

        let convertTextField = inputTextField.convert(inputTextField.frame, to: self.view)
        let keyboadSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardY = self.view.frame.size.height - keyboadSize.height
        let editingTextFieldY: CGFloat = convertTextField.origin.y - inputTextField.frame.origin.y
        // TextFieldがキーボードで隠れる場合はスクロールを行う
        if editingTextFieldY >= keyboardY {
            scrollView.contentOffset.y = editingTextFieldY - keyboardY
        }
    }
    
    /// キーボード非表示時
    ///
    /// - Parameter notification: Notification
    @objc private func handleKeyboardWillHideNotification(_ notification: Notification) {
        // スクロール位置を初期化
        scrollView.contentOffset.y = 0
    }
}


// MARK: - InputViewProtcol

extension InputViewController: InputViewProtcol {
    
    func successHiraganaAPI() {
        self.view.hideToastActivity()
        self.performSegue(withIdentifier: R.segue.inputViewController.toOutput, sender: nil)
    }
    
    func errorHiraganaAPI() {
        self.view.makeToast("API エラー")
        self.view.hideToastActivity()
    }
    
    func showSpinnerToast() {
        self.view.makeToastActivity(.center)
    }
}

// MARK: - UITextFieldDelegate

extension InputViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
}
