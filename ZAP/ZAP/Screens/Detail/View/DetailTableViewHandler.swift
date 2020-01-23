//
//  DetailTableViewHandler.swift
//  ZAP
//
//  Created by kaique.magno.santos on 22/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit

final class DetailTableViewHandler: NSObject {
    var factory: DetailFactoryCell = .init([])

    func setup(factory: DetailFactoryCell) {
        self.factory = factory
    }
}

extension DetailTableViewHandler: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        factory.numberOfCells
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = factory.cell(for: indexPath) as UITableViewCell
        cell.selectionStyle = .none
        return cell
    }
}

extension DetailTableViewHandler: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        factory.cell(for: indexPath).defaultHeight
    }
}
