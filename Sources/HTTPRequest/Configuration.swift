//
//  HTTPRequestConfiguration.swift
//  HTTPRequest
//
//  Created by Ben Shutt on 24/09/2020.
//

import Foundation

public extension HTTPRequest {

    /// Configuration flags when making a `HTTPRequest`
    final class Configuration {

        /// Shared `HTTPRequestConfiguration` instance
        public static let shared = Configuration()

        /// `DispatchQueue` for thread safety
        private let dispatchQueue = DispatchQueue(label: UUID().uuidString)

        /// Log the `DataResponse` when the response has been received
        private var _responseLogging = false
        public var responseLogging: Bool {
            get {
                var value = false
                dispatchQueue.sync {
                    value = _responseLogging
                }
                return value
            }
            set {
                dispatchQueue.async {
                    self._responseLogging = newValue
                }
            }
        }
    }
}
