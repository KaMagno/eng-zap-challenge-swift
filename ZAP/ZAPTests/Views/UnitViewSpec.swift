//
//  UnitViewSpec.swift
//  ZAPTests
//
//  Created by kaique.magno.santos on 22/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable
import ZAP

final class UnitViewSpec: QuickSpec {
    override func spec() {
        describe("UnitView") {
            var sut: UnitView!

            context("when initialize and setup with title and subtitle") {
                beforeEach {
                    sut = UnitView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
                    sut.setup(title: "Title", subtitle: "Subtitle")
                    sut.backgroundColor = .white
                }
                it("has to match the layout") {
                    expect(sut) == recordSnapshot()
                }
            }
        }
    }
}

