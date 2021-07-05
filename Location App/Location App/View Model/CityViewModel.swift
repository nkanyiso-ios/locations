
import Combine
import LocationSDK
class CityViewModel: ObservableObject {
    @Published var fetchState = State.idle
    
    init() { LocationProcessor.shared().delegate = self; fetchAllCities() }
    func fetchAllCities() { LocationProcessor.shared().fetchAllCities() }
    func getCityCount() -> Int { return LocationProcessor.shared().getAllCities().count }
    func getCityFor(_ row : Int) -> City? { return LocationProcessor.shared().getCity(position: row) }
}
extension CityViewModel: LocationProcessorDelegate {
    func fetchUpdate(_ state: State) { fetchState =  state }
}
