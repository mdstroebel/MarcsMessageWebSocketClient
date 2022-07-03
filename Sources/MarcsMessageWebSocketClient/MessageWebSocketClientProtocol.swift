//
//  MessageWebSocketClientProtocol.swift
//  
//
//  Created by Marc Stroebel on 3/7/2022.
//

import Foundation

public protocol MessageWebSocketClientProtocol {
    func subscribeToMessages(with completion: @escaping (String) -> Void)
}
