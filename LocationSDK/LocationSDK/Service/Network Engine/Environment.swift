import Foundation

struct Environment {
    var baseUrl: URL
}

extension Environment {
    static let development = Environment(baseUrl: URL(string: "http://www.mocky.io/v2/")!)
}
