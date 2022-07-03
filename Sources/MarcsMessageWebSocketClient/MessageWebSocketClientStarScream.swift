//
//  MessageWebSocketClient.swift
//  MessagingAppChallenge
//
//  Created by Marc Stroebel on 3/7/2022.
//

import Foundation
import Starscream

public class MessageWebSocketClientStarScream: NSObject {
    static let shared = MessageWebSocketClientStarScream()
    
    private var webSocket: WebSocket?
    private var urlString: String = "ws://localhost:8080"
    
    private override init() {}
    
    public init(socketUrl: String = "ws://localhost:8080") {
        super.init()
        urlString = socketUrl
        createSocketConnection()
    }
    
    private func createSocketConnection() {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            let webSocket = WebSocket(request: request)
            webSocket.delegate = self
            self.webSocket = webSocket
            self.webSocket?.connect()
        } else {
            webSocket = nil
        }
    }
}

extension MessageWebSocketClientStarScream: WebSocketDelegate {
    public func didReceive(event: WebSocketEvent, client: WebSocket) {
        
    }
}

extension MessageWebSocketClientStarScream: MessageWebSocketClientProtocol {
    public func subscribeToMessages(with completion: @escaping (String) -> Void) {
        webSocket?.onEvent = { event in
            switch event {
            case .text(let message):
                completion(message)
                break
            case .connected(_):
                // ignore for now
                break
            case .disconnected(_, _):
                // ignore for now
                break
            case .binary(_):
                // ignore for now
                break
            case .pong(_):
                // ignore for now
                break
            case .ping(_):
                // ignore for now
                break
            case .error(_):
                // ignore for now
                break
            case .viabilityChanged(_):
                // ignore for now
                break
            case .reconnectSuggested(_):
                // ignore for now
                break
            case .cancelled:
                // ignore for now
                break
            }
        }
    }
}
