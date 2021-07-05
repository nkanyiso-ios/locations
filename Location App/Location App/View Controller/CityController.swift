
import UIKit
import Combine

class CityController: BaseViewController {
    
    @IBOutlet weak var city_tableview: UITableView! {
        didSet {
            city_tableview.dataSource = self
            city_tableview.delegate = self
        }
    }
    
    
    private lazy var viewModel = CityViewModel()
    private var cancellable: AnyCancellable?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("City", comment: "")
        // Do any additional setup after loading the view.
        observeViewModelState()
    }
    
    private func observeViewModelState(){
        cancellable = viewModel.$fetchState.sink(receiveValue: {[weak self] state in
            switch state {
            
            case .idle:break
            case .fetching:
                self?.showIndicator()
            case .fetched:
                self?.hideIndicator()
                self?.city_tableview.reloadData()
            case .error(let error):
                self?.showAlert(alertText: "Error", alertMessage: error.localizedDescription)
                self?.hideIndicator()
            }
        })
    }
    
}


extension CityController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCityCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = city_tableview.dequeueReusableCell(withIdentifier: "cityCell")  as? UITableViewCell, let city = viewModel.getCityFor(indexPath.row) else  { return UITableViewCell() }
    
        cell.textLabel?.text = city.name
        return cell
    }
}

// MARK: - Strings
extension CityController {
    var screenTitle: String { NSLocalizedString("City", comment: "") }
}

