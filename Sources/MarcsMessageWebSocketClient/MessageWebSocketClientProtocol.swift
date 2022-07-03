//
//  MessageWebSocketClientProtocol.swift
//  
//
//  Created by Marc Stroebel on 3/7/2022.
//

import Foundation

protocol MessageWebSocketClientProtocol {
    func subscribeToMessages(with completion: @escaping (String) -> Void)
}
