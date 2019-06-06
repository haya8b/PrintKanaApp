//
//  HiraganaAPI.swift
//  PrintKanaApp
//
//  Created by 片岡勇人 on 2019/06/06.
//  Copyright © 2019 HayatoKataoka. All rights reserved.
//

import Foundation
import Moya

enum HiraganaAPI {
    case request(hiraganaAPIRequest: HiraganaAPIRequest)
}

extension HiraganaAPI: TargetType {
    // URL
    var baseURL: URL {
        if let baseURL = Bundle.main.object(forInfoDictionaryKey: "APIBaseURL") as? String {
            return URL(string: baseURL)!
        }
        //URL未設定
        fatalError("fatalError", file: "API BASE URL Not Found")
    }
    
    // パス
    var path: String {
        switch self {
        case .request:
            return "hiragana"
        }
    }
    
    // メソッド
    var method: Moya.Method {
        switch self {
        case .request:
            return .post
        }
    }
    
    // スタブデータ
    var sampleData: Data {
        switch self {
        case .request:
            let path = Bundle.main.path(forResource: "HiraganaAPIStub", ofType: "json")!
            return FileHandle(forReadingAtPath: path)!.readDataToEndOfFile()
        }
    }
    
    // パラメータ
    var task: Task {
        switch self {
        case .request(let hiraganaAPIRequest):
            return .requestJSONEncodable(hiraganaAPIRequest)
        }
    }
    
    // ヘッダー
    var headers: [String: String]? {
        return nil
    }
}

// MARK: RequestParameter

// HiraganaAPI リクエストパラメーター
struct HiraganaAPIRequest: Encodable {
    var appID: String       // アプリケーションID
    var requestID: String   // リクエストID
    var sentence: String    // 解析対象テキスト
    var outputType: String  // 出力種別
    
    private enum CodingKeys: String, CodingKey {
        case appID = "app_id"
        case requestID = "request_id"
        case sentence
        case outputType = "output_type"
    }
}

// MARK: - Response

// HiraganaAPI レスポンスパラメータ
struct HiraganaAPIResponse: Decodable {
    var requestID: String?  // リクエストID
    var outputType: String? // 出力種別
    var converted: String?  // 変換後文字列
    
    private enum CodingKeys: String, CodingKey {
        case requestID = "request_id"
        case outputType = "output_type"
        case converted
    }
}
