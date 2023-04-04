//
//  MoreAPI.swift
//  
//
//  Created by TAE SU LEE on 2023/02/06.
//

import Foundation
import Moya

public typealias MoreNetworking = Networking<MoreAPI>

public enum MoreAPI {
    case readItems
}

extension MoreAPI: StatusCodeSampleDataTargetType {
    public var baseURL: URL {
        return URL(string: "about:blank")! // Not used: baseURL is set directly in Networking's initializer
    }

    public var path: String {
        switch self {
        case .readItems:
            return "/more/list"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .readItems:
            return .get
        }
    }

    public var sampleData: Data {
        return Data() // Replaced: Use sampleData(statusCode:) instead
    }

    public var task: Moya.Task {
        switch self {
        case .readItems:
            return .requestPlain
        }
    }

    public var headers: [String: String]? {
        switch self {
        case .readItems:
            return nil
        }
    }
    
    public func sampleData(statusCode: Int, mockFile: JSONFile?) -> Data {
        if let mockFile = mockFile {
            return JSONLoader.loadJSONFile(mockFile) ?? Data()
        }
        
        switch self {
        case .readItems:
            return JSONLoader.loadJSONFile(JSONFile.more(statusCode)) ?? Data()
        }
    }
}
