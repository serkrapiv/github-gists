//
//  Decoder.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 22/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class GGDecoder {
    
    static func decode(_ decoderHandler: @escaping () throws -> ()) {
        do {
            try decoderHandler()
        }
        catch DecodingError.dataCorrupted(let context) {
            print("\(DecodingError.dataCorrupted(context))")
            
        } catch DecodingError.keyNotFound(let key, let context) {
            print("\(DecodingError.keyNotFound(key,context))")
            
        } catch DecodingError.typeMismatch(let type, let context) {
            print("\(DecodingError.typeMismatch(type,context))")
            
        } catch DecodingError.valueNotFound(let value, let context) {
            print("\(DecodingError.valueNotFound(value,context))")
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
