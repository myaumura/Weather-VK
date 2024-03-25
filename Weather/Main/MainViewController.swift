//
//  ViewController.swift
//  Weather
//
//  Created by Kirill Gusev on 19.03.2024.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = MainCollectionViewLayout(viewModel: viewModel)
        layout.excludedSections.insert(0)
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        return collectionView
    }()

    private let locationManager = CLLocationManager()
    
    private var location: Location?
    private let viewModel: MainViewModel
    
    required init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var currentWeatherView = CurrentWeatherView()
    private let hourlyWeatherView = HourlyWeatherView()
    private let dailyWeatherView = DailyWeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        setupLocationManager()
        
        collectionView.register(CurrentWeatherView.self)
        collectionView.register(HourlyWeatherView.self)
        collectionView.register(DailyWeatherView.self)
        collectionView.register(UICollectionViewCell.self)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        
        viewModel.reload = {
            self.collectionView.performBatchUpdates {}
        }
        viewModel.build(width: view.bounds.width - 24)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    private func setupLocationManager() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        location = Location(location: locationValue)
    }
}


extension MainViewController: UICollectionViewDelegate {}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout MainCollectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let secvm = viewModel.sections[safe: indexPath.section]
        let vm = secvm?.items[indexPath.item]
        return vm?.size ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout MainCollectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout MainCollectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout MainCollectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 16, bottom: 0, right: 16)
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.sections[safe: section]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let secVM = viewModel.sections[indexPath.section]
        let vm = secVM.items[indexPath.item]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: vm.cellId,
                                                            for: indexPath) as? BindableCell else {
            fatalError()
        }
        
        cell.bind(viewModel: vm)
        return cell
   }
}

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_ cellType: T.Type) {
        register(cellType, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError()
        }
        return cell
    }
}

extension Collection where Index == Int {
    subscript(safe index: Index)-> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
