//
//  HTTPRequestable.swift
//  StravaAPI
//
//  Created by Ben Shutt on 27/09/2020.
//

import Foundation
import Alamofire

/// An entity which defines a `HTTPRequest`
public protocol HTTPRequestable: URLRequestConvertible {
    
    /// Construct a `HTTPRequest`
    func httpRequest() throws -> HTTPRequest
}

// MARK: - URLRequestConvertible

extension HTTPRequestable {
    
    public func asURLRequest() throws -> URLRequest {
        return try httpRequest().asURLRequest()
    }
}
