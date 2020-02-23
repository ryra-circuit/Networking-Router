import Foundation

struct Constant {
    
    // Manage app environment with release type
    static let appEnvironment: DeploymentEnvironment = .development
    
    enum DeploymentEnvironment: String {
        case development = "https://api.printful.com/"
        case staging = ""
        case production = "https://"
    }
    
    static func getCustomHeaders() -> [String: String] {
        return ["x-api-key": Constant.APIKeys.RESTful, "Accept" : "application/json"]
    }
    
    enum APIKeys {
        static let RESTful = Constant.getAPIKey()
        static let googleMap = ""
    }
    
    static func getAPIKey() -> String {
        switch Constant.appEnvironment {
        case .development:
            return ""
        case .staging:
            return ""
        case .production:
            return ""
        }
    }
}
