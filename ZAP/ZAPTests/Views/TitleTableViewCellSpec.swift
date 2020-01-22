//
//  TitleTableViewCellSpec.swift
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

final class TitleTableViewCellSpec: QuickSpec {
    override func spec() {
        describe("TitleTableViewCell") {
            var sut: TitleTableViewCell!

            context("when initialize") {
                beforeEach {
                    sut = TitleTableViewCell(frame: .init(x: 0, y: 0, width: 320, height: 60))
                    sut.backgroundColor = .white
                }
                context("and setup with leftText and rightText") {
                    beforeEach {
                        sut.setup(leftText: "Left Text", rightText: "Right Text")
                    }
                    it("must have the layout") {
                        expect(sut) == snapshot()
                    }
                }
                context("and setup with long leftText and long rightText") {
                    beforeEach {
                        sut.setup(leftText: "Left Text ABCDEFGHIJKLMNOPQRST", rightText: "R$ 123.456.789.012, 12")
                    }
                    it("must have the layout") {
                        expect(sut) == snapshot()
                    }
                }
            }
        }
    }
}

