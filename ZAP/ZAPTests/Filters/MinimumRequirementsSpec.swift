//
//  DefaultFilterSpec.swift
//  ZAPTests
//
//  Created by kaique.magno.santos on 21/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable
import ZAP

final class MinimumRequirementsFilterSpec: QuickSpec {
    override func spec() {
        let sut: MinimumRequirementsFilter = MinimumRequirementsFilter()

        describe("MinimumRequirementsFilter") {
            var properties: Properties!
            beforeEach {
                properties = PropertiesTestSupport.properties()

            }
            context("when filtering") {
                var filtered: Properties = []
                var spected: Properties = []
                beforeEach {
                    filtered = sut.filteredProperties(properties)
                    spected = PropertiesTestSupport.properties(by: Self.identifier)
                }
                it("filtered properties must match spected") {
                    expect(filtered).to(equal(spected))
                }
            }
        }
    }
}

