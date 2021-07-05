import Combine
public protocol LocationProcessorDelegate: AnyObject {
    func fetchUpdate(_ state: State )
}

public class LocationProcessor {
    public weak var delegate: LocationProcessorDelegate?
    
    private lazy var viewModel = LocationViewModel()
    private var cancellable: AnyCancellable?
    private static var sharedLocationProcessor: LocationProcessor = {
        let locationProcessor = LocationProcessor()
        
        return locationProcessor
    } ()
    private init() {
        observeViewModelState()
    }
    // MARK: Accessors
    public class func shared() -> LocationProcessor {
        return sharedLocationProcessor
    }
    
    public func fetchAllCities(){
        
        viewModel.fetchAllCities()
    }
    private func observeViewModelState(){
        cancellable = viewModel.$state.sink(receiveValue: {[weak self] state in
            switch state {
            
            case .idle:break
            case .fetching: self?.delegate?.fetchUpdate(.fetching)
            case .fetched:
                self?.delegate?.fetchUpdate(.fetched)
            case .error(let error):
                self?.delegate?.fetchUpdate(.error(error))
            }
        })
    }
    
    public func getAllCities() -> [City]{
        return viewModel.getAllCities()
    }
    public func getCity(position: Int) -> City?{
        return viewModel.getCity(position: position)
    }
    public func getCity(cityName: String) -> City?{
        
        return viewModel.getCity(cityName: cityName)
    }
    public func getAllMallsInCity(cityId: Int) -> [Mall]? {
          return viewModel.getAllMallsInCity(cityId: cityId)
    }
    
    public func getMallInCity(cityId: Int, mallName: String) -> Mall? {
        return viewModel.getMallInCity(cityId: cityId, mallName: mallName)
    }
    public func getAllShopsInMall(cityId: Int,mallId: Int) -> [Shop]?{
        return viewModel.getAllShopsInMall(cityId: cityId, mallId: mallId)
    }
    public func getShopInMall(cityId: Int,mallId: Int,shopName: String) -> Shop?{
        return viewModel.getShopInMall(cityId: cityId, mallId: mallId, shopName: shopName)
    }}
