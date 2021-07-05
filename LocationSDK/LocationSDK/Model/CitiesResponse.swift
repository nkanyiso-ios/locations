import Foundation

// MARK: - CitiesReponse
public struct CitiesReponse: Codable {
    let cities: [City]
}

// MARK: - City
public struct City: Codable {
    public let id: Int
    public let name: String
    let malls: [Mall]
}

// MARK: - Mall
public struct Mall: Codable {
    public let id: Int
    public let name: String
    let shops: [Shop]
}

// MARK: - Shop
public struct Shop: Codable {
    public let id: Int
    public let name: String
}
