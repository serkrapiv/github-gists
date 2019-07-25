//
//  SerializatorProtocol.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

protocol SerializatorProtocol: class {
    func pull(data: Data, _ serializationHandler: (Any) throws -> ())
}
