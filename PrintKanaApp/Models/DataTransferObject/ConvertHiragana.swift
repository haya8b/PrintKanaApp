//
//  ConvertHiragana.swift
//  PrintKanaApp
//
//  Created by 片岡勇人 on 2019/06/06.
//  Copyright © 2019 HayatoKataoka. All rights reserved.
//

import Foundation

class ConvertHiragana {
    // リクエストID
    var requestID: String
    // 出力種別
    var outputType: String
    // 変換後文字列
    var converted: String
    
    init() {
        requestID = ""
        outputType = ""
        converted = ""
    }
    
    init(requestID: String, outputType: String, converted: String) {
        self.requestID = requestID
        self.outputType = outputType
        self.converted = converted
    }
}
