//
//  ViewController.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit

protocol HomeViewInterface: LoadingPresentable {
    var delegate: HomeViewDelegate? {get set}

    func set(_ data: Properties)
    func show(_ status: ViewControllerStatus)
    func resetView()
}

protocol HomeViewDelegate: AnyObject {
    func handlePropertyTypeValueChanged(_ viewController: HomeViewController, propertyType: PropertyType)
    func handleEmpty(_ viewController: HomeViewController)
    func handleFetchData(_ viewController: HomeViewController)
    func handleFetchMoreData(_ viewController: HomeViewController)
}

final class HomeViewController: UIViewController, StoryboardInitiable {

    // MARK: - IBOutlet
    @IBOutlet weak var outletCategorySegmented: UISegmentedControl!
    @IBOutlet weak var outletCollection: UICollectionView! {
        didSet {
            setupDataSource(to: outletCollection)
        }
    }

    // MARK: - Variable
    // MARK: Private
    private let emptyView = EmptyView()
    private lazy var errorView: ErrorView = {
        return ErrorView(delegate: self)
    }()
    private var defaultView: UIView?
    private var collectionHandler: HomeCollectionHandler?

    // MARK: Public
    var delegate: HomeViewDelegate?

    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        delegate!.handleFetchData(self)
    }

    // MARK: - Functions
    private func setup() {
        defaultView = view

        outletCollection.backgroundView = emptyView
    }

    private func setupDataSource(to collectionView: UICollectionView) {
        collectionHandler = HomeCollectionHandler()
        collectionHandler?.delegate = self
        collectionView.dataSource = collectionHandler
        collectionView.delegate = collectionHandler
    }

    // MARK: - IBActions
    @IBAction func changeValue(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            delegate?.handlePropertyTypeValueChanged(self, propertyType: .ZAP)
        default:
            delegate?.handlePropertyTypeValueChanged(self, propertyType: .VivaReal)
        }
    }
}

// MARK: - HomeViewInterface
extension HomeViewController: HomeViewInterface {
    func resetView() {
        DispatchQueue.main.async {
            self.outletCollection.scrollToItem(at: IndexPath(item: 0, section: 0 ), at: .top, animated: true)
        }
    }

    func show(_ status: ViewControllerStatus) {
        switch status {
        case .default:
            self.show(self.defaultView ?? self.view)
        case .empty:
            self.show(self.emptyView)
        case .error:
            self.show(self.errorView)
        case .loading:
            self.showLoading()
        }
    }

    func set(_ data: Properties) {
        self.collectionHandler?.properties = data
        DispatchQueue.main.async {
            self.outletCollection.reloadData()
        }
    }
}

// MARK: - ErrorViewDelegate
extension HomeViewController: ErrorViewDelegate {
    func didTap(_ view: ErrorView) {
        delegate?.handleFetchData(self)
    }
}

extension HomeViewController: HomeCollectionHandlerDelegate {
    func didEndPage() {
        delegate?.handleFetchMoreData(self)
    }
}
