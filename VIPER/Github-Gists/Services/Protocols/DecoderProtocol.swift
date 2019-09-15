//
//  DecoderProtocol.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

protocol DecoderProtocol: class {
    func decode(_ decoderHandler: @escaping () throws -> ())
}
