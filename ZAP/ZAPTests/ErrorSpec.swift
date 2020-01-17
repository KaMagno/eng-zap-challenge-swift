//
//  ErrorSpec.swift
//  ZAPTests
//
//  Created by kaique.magno.santos on 16/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable
import ZAP

final class ErrorSpec: QuickSpec {
    override func spec() {
        context("When run"){
            it("must fail") {
                fail()
            }
        }
    }
}
