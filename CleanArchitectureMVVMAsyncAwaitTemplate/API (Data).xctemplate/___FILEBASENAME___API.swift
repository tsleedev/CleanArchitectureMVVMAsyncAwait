//  ___FILEHEADER___

import TSCore
import Foundation
import Moya

public typealias ___VARIABLE_productName:identifier___Networking = Networking<___VARIABLE_productName:identifier___API>

public enum ___VARIABLE_productName:identifier___API {
//    case readItems
//    case readItem
}

extension ___VARIABLE_productName:identifier___API: StatusCodeSampleDataTargetType {
    public var baseURL: URL {
        return URL(string: "about:blank")! // Not used: baseURL is set directly in Networking's initializer
    }
    
    public var path: String {
//        switch self {
//        case .readItems:
//            return "/items"
//        case .readItem:
//            return "/item"
//        }
        return ""
    }
    
    public var method: Moya.Method {
//        switch self {
//        case .readItems, .readItem:
//            return .get
//        }
        return .get
    }
    
    public var sampleData: Data {
        return Data() // Replaced: Use sampleData(statusCode:) instead
    }
    
    public var task: Moya.Task {
//        switch self {
//        case .readItems, .readItem:
//            return .requestPlain
//        }
        return .requestPlain
    }
    
    public var headers: [String: String]? {
//        switch self {
//        case .readItems, .readItem:
//            return nil
//        }
        return nil
    }
    
    public func sampleData(statusCode: Int, mockFile: JSONFile?) -> Data {
        if let mockFile = mockFile {
            return JSONLoader.loadJSONFile(mockFile) ?? Data()
        }
        
        return JSONLoader.loadJSONFile(JSONFile./* Input JSONFile Enum */(statusCode)) ?? Data()
    }
}
