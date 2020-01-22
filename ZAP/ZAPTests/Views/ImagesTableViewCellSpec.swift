//
//  ImagesTableViewCellSpec.swift
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

final class ImagesTableViewCellSpec: QuickSpec {
    override func spec() {
        describe("ImagesTableViewCell") {
            var sut: ImagesTableViewCell!

            context("when initialize") {
                beforeEach {
                    sut = ImagesTableViewCell(frame: .init(x: 0, y: 0, width: 320, height: 160))
                    sut.backgroundColor = .white
                }
                context("when setup with a unvalid url") {
                    beforeEach {
                        sut.setup(imagePath: "no url")
                    }
                    it("must have the layout") {
                        expect(sut) == snapshot()
                    }
                }
                context("when setup with a valid url") {
                    beforeEach {
                        sut.setup(imagePath: "https://google.com")
                    }
                    it("must have the layout") {
                        expect(sut) == snapshot()
                    }
                }
            }
        }
    }
}
