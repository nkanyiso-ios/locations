import Foundation

struct GetAllCitiesRequest: Request {
    
    typealias Response = CitiesReponse
    
    var method: HTTPMethod { return .GET }
    var path: String { return "" }
    var contentType: String { return "application/json" }
    var additionalHeaders: [String : String] { return [:] }
    var body: Data? { return nil }
    var parameters: [String:String]? {return nil}
    
    func handle(response: Data) throws -> CitiesReponse {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(CitiesReponse.self, from: response)
    }
}
