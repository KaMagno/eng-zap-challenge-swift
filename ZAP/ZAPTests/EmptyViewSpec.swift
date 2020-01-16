//
//  EmptyView.swift
//  ZAPTests
//
//  Created by kaique.magno.santos on 15/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable
import ZAP

final class EmptyViewSpec: QuickSpec {
    override func spec() {
        var sut: EmptyView!

        describe("EmptyView"){
            beforeEach {
                sut = EmptyView(frame: self.defaultFrame)
            }
            context("When initialize") {
                beforeEach {
                    sut.setup(text: "Nenhum imóvel disponivel \n no momento")
                }
                it("Must have the layout") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
