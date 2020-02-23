import Foundation
import Alamofire

protocol URLRequestBuilder: URLRequestConvertible, APIRequestHandler {
    
    var mainURL: String { get }
    var requestURL: URL { get }
    
    // MARK: - Path
    var path: String { get }
    
    // MARK: - Parameters
    var parameters: Parameters? { get }
    
    // MARK: - Headers
    var headers: HTTPHeaders? { get }
    
    // MARK: - Methods
    var method: HTTPMethod { get }
    
    var encoding: ParameterEncoding { get }
    
    var urlRequest: URLRequest { get }
}

extension URLRequestBuilder {
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var mainURL: String {
        return Constant.appEnvironment.rawValue
    }
    
    var requestURL: URL {
        let urlString = (mainURL + path).addingPercentEncoding(withAllowedCharacters : CharacterSet.urlQueryAllowed) ?? path
        let url = try! urlString.asURL()
        return url
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        if headers != nil {
            request.allHTTPHeaderFields = headers
        }
        return request
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        print("URL: \(mainURL)\(path)")
        print("METHOD: \(method)")
        print("HEADERS: \(headers ?? [:])")
        print("PARAMS: \(parameters ?? [:])")
        
        let parametersWithoutNilValues = parameters?.removeNullKeysFromParameterDictionary()
        return try encoding.encode(urlRequest, with: parametersWithoutNilValues)
    }
}
