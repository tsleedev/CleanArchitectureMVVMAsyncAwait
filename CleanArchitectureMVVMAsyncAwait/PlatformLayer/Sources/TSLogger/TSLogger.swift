//
//  TSLogger.swift
//
//
//  Created by TAE SU LEE on 2022/11/15.
//

import Foundation
import os

private enum LogFilter: String {
    case debug = "💚 DEBUG"
    case error = "❤️ ERROR"
    case flow = "💙 FLOW"
    case api = "💜 API"
    case warning = "🧡 WARNING"
}

public struct TSLogger {
    public static func debug(_ items: Any...,
                             separator: String = " ",
                             terminator: String = "\n",
                             _ file: String = #fileID,
                             _ function: String = #function,
                             _ line: UInt = #line) {
        log(filter: .debug, items: items, separator: separator, terminator: terminator, file, function, line)
    }
    
    public static func error(_ items: Any...,
                             separator: String = " ",
                             terminator: String = "\n",
                             _ file: String = #fileID,
                             _ function: String = #function,
                             _ line: UInt = #line) {
        log(filter: .error, items: items, separator: separator, terminator: terminator, file, function, line)
    }
    
    public static func flow(_ items: Any...,
                            separator: String = " ",
                            terminator: String = "\n",
                            _ file: String = #fileID,
                            _ function: String = #function,
                            _ line: UInt = #line) {
        log(filter: .flow, items: items, separator: separator, terminator: terminator, file, function, line)
    }
    
    public static func api(_ items: Any...,
                           separator: String = " ",
                           terminator: String = "\n",
                           _ file: String = #fileID,
                           _ function: String = #function,
                           _ line: UInt = #line) {
        log(filter: .api, items: items, separator: separator, terminator: terminator, file, function, line)
    }
    
    public static func warning(_ items: Any...,
                               separator: String = " ",
                               terminator: String = "\n",
                               _ file: String = #fileID,
                               _ function: String = #function,
                               _ line: UInt = #line) {
        log(filter: .warning, items: items, separator: separator, terminator: terminator, file, function, line)
    }
    
    private static func log(filter: LogFilter,
                            items: Any...,
                            separator: String = " ",
                            terminator: String = "\n",
                            _ file: String = #fileID,
                            _ function: String = #function,
                            _ line: UInt = #line) {
#if DEBUG
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss:SSS"
        let fileName = file.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? ""
        let prefix = "\(filter.rawValue)(\(dateFormatter.string(from: Date())) \(fileName) \(function) \(line)) :"
        let output = items.map { "\($0)" }.joined(separator: separator)
        
//        if #available(iOS 14.0, *) {
//            let logger = Logger(subsystem: "com.tsleedev.CleanArchitectureMVVMAsyncAwait", category: "category")
//            logger.debug("This is a debug message: \(output)")
//        } else {
            print(prefix, output, separator: separator, terminator: terminator)
//        }
        
//        os_log(<#T##message: OSLogMessage##OSLogMessage#>)
//        os_log(prefix)
#endif
    }
}
