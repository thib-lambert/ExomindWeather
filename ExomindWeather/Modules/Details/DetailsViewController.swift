//
//  DetailsViewController.swift
//  TTWeather
//
//  Created by Thibaud Lambert on 03/06/2021.
//

import UtilsKit

private let kFinishTime = 30
private let kUpdateMessageTime = 6
private let kFetchDataTime = 10

class DetailsViewController: UIViewController, NavigationProtocol {
    
	// MARK: - Outlets
	@IBOutlet private weak var refreshButton: UIButton!
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.separatorStyle = .none
            self.tableView.register(WeatherDetailsCell.self)
            self.tableView.tableFooterView = UIView()
            self.tableView.backgroundView = self.loadingLabel
        }
    }
    @IBOutlet private var progressBar: UIProgressView! {
		didSet {
			self.progressBar.setProgress(0, animated: false)
            self.progressBar.transform = self.progressBar.transform.scaledBy(x: 1, y: 3)
		}
	}
    
    // MARK: - NavigationProtocol variables
    var navigationSegue: Segue = .modal
    var instanceIdentifier: String?
    var previousViewController: UIViewController?
	
	// MARK: - Variables
    private var models: [WeatherViewModel] = []
    private var availablesCities: [String] = []
    private var timer: Timer?
    private var runLoop = 0
    private var cityIndex = 0
    
    private var messageIndex = 0 {
        didSet {
            self.messageIndex = self.messageIndex >= self.availablesMessages.count ? 0 : self.messageIndex
        }
    }
    
    private let availablesMessages = [
        "Nous téléchargeons les données...",
        "C’est presque fini...",
        "Plus que quelques secondes avant d’avoir le résultat..."
    ]
    
	private lazy var interactor: DetailsInteractor = {
		DetailsInteractor(with: self)
	}()
    
    private lazy var loadingLabel: WeatherLabel = {
        let label = WeatherLabel()
        label.text = self.availablesMessages.first
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
	
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
        self.interactor.getCities()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.refreshButton.layer.cornerRadius = self.refreshButton.bounds.height / 4
        
        let maskLayerPath = UIBezierPath(roundedRect: self.progressBar.bounds,
                                         cornerRadius: self.progressBar.bounds.height / 2)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.progressBar.bounds
        maskLayer.path = maskLayerPath.cgPath
        self.progressBar.layer.mask = maskLayer
    }
    
    // MARK: - Timers
    private func setupTimers() {
        self.timer?.invalidate()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1,
                                                 repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            let progress = Double(self.runLoop) / Double(kFinishTime)
            self.progressBar.setProgress(Float(progress), animated: true)
            
            if self.runLoop.isMultiple(of: kUpdateMessageTime) && self.runLoop > 0 {
                log(.custom("✍️"), "Loading message updated!")
                self.messageIndex += 1
                self.loadingLabel.text = self.availablesMessages[self.messageIndex]
            }
            
            if let city = self.availablesCities[safe: self.cityIndex],
               self.runLoop.isMultiple(of: kFetchDataTime) {
                log(.custom("⏰"), "Fetch data for \(city)")
                self.cityIndex += 1
                self.interactor.resfresh(forCity: city)
            }
            
            if self.runLoop >= kFinishTime {
                log(.custom("💀"), "60 seconds have passed!")
                
                // Stop timers
                self.timer?.invalidate()
                self.timer = nil
                
                // Refresh UI
                self.refreshButton.isHidden = false
                self.progressBar.isHidden = true
                self.tableView.backgroundView = nil
                self.tableView.reloadData()
            }
            
            self.runLoop += 1
        }
    }
	
	// MARK: - Refresh
	func didRefresh(forCity city: String, data: WeatherViewModel) {
        self.models.append(data)
	}
	
	func didFetchCities(cities: [String]) {
		self.availablesCities = cities
        
        log(.custom("🏁"), "Start fetch data")
        self.setupTimers()
	}
    
    // MARK: - Actions
    @IBAction private func reset() {
        self.refreshButton.isHidden = true
        self.progressBar.setProgress(0, animated: false)
        self.progressBar.isHidden = false
        self.loadingLabel.text = self.availablesMessages.first
        self.tableView.backgroundView = self.loadingLabel
        self.models = []
        self.availablesCities = []
        self.timer = nil
        self.runLoop = 0
        self.cityIndex = 0
        self.messageIndex = 0
        self.tableView.reloadData()
        
        // Restart
        self.interactor.getCities()
    }
}

// MARK: - UITableViewDataSource
extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WeatherDetailsCell = tableView.dequeueCell(forIndexPath: indexPath)
        cell.data = self.models[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - UITableViewDelegate
extension DetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}

// MARK: - HomeViewController
extension DetailsViewController: StoryboardProtocol {
    
    static let identifier: String? = "DetailsViewController"
    static let storyboardName: String = "Details"
}
