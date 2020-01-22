//
//  PropetiesTestSupport.swift
//  ZAPTests
//
//  Created by kaique.magno.santos on 21/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation
@testable
import ZAP

final class PropertiesTestSupport {
    static func properties() -> Properties {
        let bundle = Bundle(identifier: "kaique.magno.ZAPTests")!
        let path = bundle.path(forResource: "DefaultProperties", ofType: "json")!
        let data = FileManager.default.contents(atPath: path)!
        let properties = try! JSONDecoder().decode(Properties.self, from: data)
        return properties
    }

    static func properties(by fileNamed: String) -> Properties {
        let bundle = Bundle(identifier: "kaique.magno.ZAPTests")!
        let path = bundle.path(forResource: fileNamed, ofType: "json")!
        let data = FileManager.default.contents(atPath: path)!
        let properties = try! JSONDecoder().decode(Properties.self, from: data)
        return properties
    }
}
