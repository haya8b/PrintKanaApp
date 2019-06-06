//
//  InputPresenter.swift
//  PrintKanaApp
//
//  Created by 片岡勇人 on 2019/06/06.
//  Copyright © 2019 HayatoKataoka. All rights reserved.
//

import Foundation
import Moya

class InputPresenter: NSObject {
    
    private let appID = "c08d737e52ee1dfc00937fcd316591f63ad9c883748df0dfce1cda5523026f01"
    private let requestID = "requestID"
    private let outputType = "hiragana"
    
    private weak var viewProtcol: InputViewProtcol?
    private var convertHiraganaData: ConvertHiragana
    
    // ContentsAPI
    var contentsProvider: CustomMoyaProvider<HiraganaAPI>
    
    // MARK: - initialize

    init(viewProtcol: InputViewProtcol, stubBehavior: Moya.StubBehavior = .never) {
        self.viewProtcol = viewProtcol
        self.contentsProvider = CustomMoyaProvider<HiraganaAPI>(stubBehavior: stubBehavior)
        self.convertHiraganaData = ConvertHiragana()
    }
    
    // MARK: - PresenterMethods
    
    /// HiraganaAPIリクエスト
    ///
    /// - Parameter sentence: 解析対象テキスト
    func requestHiraganaAPI(sentence: String) {
        // ローディング表示
        viewProtcol?.showSpinnerToast()
        
        contentsProvider = CustomMoyaProvider<HiraganaAPI>(stubBehavior: .never)
        let hiraganaAPIRequest = HiraganaAPIRequest(appID: appID,
                                                    requestID: requestID,
                                                    sentence: sentence,
                                                    outputType: outputType)
        self.contentsProvider.request(.request(hiraganaAPIRequest: hiraganaAPIRequest)) { [weak self] (result) in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let response):
                print("Hiragana API success")

                if let decodedResponse = try? JSONDecoder().decode(HiraganaAPIResponse.self, from: response.data) {
                    strongSelf.convertHiraganaData = ConvertHiragana.init(requestID: decodedResponse.requestID ?? "",
                                                                          outputType: decodedResponse.outputType ?? "",
                                                                          converted: decodedResponse.converted ?? "")
                }
                
                self?.viewProtcol?.successHiraganaAPI()
                
            case .failure(let error):
                print("Hiragana API error : \(error)")
                self?.viewProtcol?.errorHiraganaAPI()
            }
        }
    }
    
    /// HiraganaAPIのレスポンスデータを取得
    ///
    /// - Returns: HiraganaAPI
    func getConvertHiraganaData() -> ConvertHiragana {
        return convertHiraganaData
    }
}
