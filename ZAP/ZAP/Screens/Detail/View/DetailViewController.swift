//
//  DetailView.swift
//  ZAP
//
//  Created by kaique.magno.santos on 22/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit
import SnapKit

protocol DetailViewInterface {
    func setViewTitle(_ title:String)
    func setup(_ types: [DetailCellType])
}

protocol DetailViewDelegate {
    func handleData()
}

class DetailViewController: UIViewController {

    private let tableView: UITableView = .init()
    private let tableViewHandler: DetailTableViewHandler = .init()

    var delegate: DetailViewDelegate?

    init() {
        super.init(nibName: nil, bundle: nil)
        tableView.dataSource = tableViewHandler
        tableView.delegate = tableViewHandler
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        delegate?.handleData()
    }
}

extension DetailViewController: DetailViewInterface {
    func setViewTitle(_ title: String) {
        self.title = title
    }

    func setup(_ types: [DetailCellType]) {
        let factory = DetailFactoryCell(types)
        tableViewHandler.setup(factory: factory)
        tableView.reloadData()
    }
}

extension DetailViewController: CodeView {
    func setupViewHierarchy() {
        view.addSubview(tableView)
    }

    func setupConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
        tableView.tableFooterView = .init()
    }
}
