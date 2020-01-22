//
//  UnitsTableViewCellSpec.swift
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

final class UnitsTableViewCellSpec: QuickSpec {
    override func spec() {
        describe("UnitsTableViewCell") {
            var sut: UnitsTableViewCell!

            beforeEach {
                sut = UnitsTableViewCell(frame: CGRect(x: 0, y: 0, width: 320, height: 60))
                sut.backgroundColor = .white
            }
            context("When initialize with 4 units") {
                beforeEach {
                    sut.setup(units: [
                        (title: "70", subtitle: "m²"),
                        (title: "2", subtitle: "Bathrooms"),
                        (title: "4", subtitle: "Bedrooms"),
                        (title: "2", subtitle: "Parking Spaces"),
                    ])
                }
                it("Must have the layout") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
