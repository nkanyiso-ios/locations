import Combine

internal class LocationViewModel: ObservableObject{
    private var cities : [City]?
    private let client = Client()
    private var subscriptions: Set<AnyCancellable> = []

    @Published var state = State.idle
    
    func fetchAllCities() {
        let fetchAllCitiesRequest = FetchAllCitiesRequest()
        state =  .fetching
        client.publisherForRequest(fetchAllCitiesRequest)
            .sink(receiveCompletion: {  [weak self]  result in
                switch result {case .finished: self?.state = .fetched

                case .failure(let error): self?.state = .error(error)
                
                }
            }, receiveValue: ({ [weak self] citiesReponse in
                self?.cities = citiesReponse.cities
            })
            ).store(in: &subscriptions)
    }
    func getAllCities() -> [City]{
        return cities ?? []
    }
    func getCity(position: Int) -> City?{
        let city = cities?[position]
        return city
    }
    func getCity(cityName: String) -> City?{
        let city = cities?.filter({$0.name.contains(cityName)}).first
        return city
    }
    func getAllMallsInCity(cityId: Int) -> [Mall]? {
        let city = cities?.filter({$0.id == cityId}).first
        return city?.malls
    }
    
    func getMallInCity(cityId: Int, mallName: String) -> Mall? {
        let city = cities?.filter({$0.id == cityId}).first
        let mall = city?.malls.filter({$0.name.contains(mallName)}).first
        return mall
    }
    func getAllShopsInMall(cityId: Int,mallId: Int) -> [Shop]?{
        let mallList = getAllMallsInCity(cityId: cityId)
        let mall = mallList?.filter({$0.id == mallId}).first
        return mall?.shops
    }
    func getShopInMall(cityId: Int,mallId: Int,shopName: String) -> Shop?{
        let shopList =  getAllShopsInMall(cityId: cityId, mallId: mallId)
        return shopList?.filter({$0.name.contains(shopName)}).first
    }
    
    
    
}
