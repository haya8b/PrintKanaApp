//
//  CustomMoyaProvider.swift
//  PrintKanaApp
//
//  Created by 片岡勇人 on 2019/06/06.
//  Copyright © 2019 HayatoKataoka. All rights reserved.
//

import Foundation
import Moya
import Alamofire

final class CustomMoyaProvider<T: TargetType>: MoyaProvider<T> {
    
    public init(endpointClosure: @escaping EndpointClosure = CustomMoyaProvider.defaultEndpointMapping,
                requestClosure: @escaping RequestClosure = CustomMoyaProvider.defaultRequestMapping,
                stubBehavior: Moya.StubBehavior = .never,
                callbackQueue: DispatchQueue? = nil,
                plugins: [PluginType] = [],
                trackInflights: Bool = false) {
        
        // タイムアウトを設定するためSessionManagerを生成
        let sharedManager: SessionManager = {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 30
            return SessionManager(configuration: configuration)
        }()
        
        super.init(endpointClosure: endpointClosure,
                   requestClosure: requestClosure,
                   stubClosure: { (_: T) -> Moya.StubBehavior in return stubBehavior },
                   callbackQueue: callbackQueue,
                   manager: sharedManager,
                   plugins: plugins,
                   trackInflights: trackInflights)
    }

}
