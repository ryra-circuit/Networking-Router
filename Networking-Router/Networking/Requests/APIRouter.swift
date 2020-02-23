import Foundation
import Alamofire

enum APIRouter: URLRequestBuilder {
    
    // MARK: - Request
    case register(structure: RegisterUserForm)
    case login(structure: LoginUserForm)
    case forgotPassword(email: String)
    case changePassword(structure: ChangePasswordForm)
    case viewMyProfile
    case updateMyProfile(structure: UpdateProfileForm)
    case logout
    case allCountries
    
    // MARK: - Method
    internal var method: HTTPMethod {
        
        switch self {
        case .register, .login, .forgotPassword:
            return .post
            
        case .updateMyProfile, .changePassword:
            return .put
            
        case .viewMyProfile, .allCountries:
            return .get
            
        case .logout:
            return .delete
        }
    }
    
    
    // MARK: - Path
    internal var path: String {
        
        switch self {
        case .register, .login, .logout:
            return "/users"
            
        case .forgotPassword:
            return "/forgotpassword"
            
        case .updateMyProfile:
            return "/updateprofile"
            
        case .viewMyProfile:
            return "/viewprofile"
            
        case .changePassword:
            return "/changepassword"
            
        case .allCountries:
            return "countries"
        }
    }
    
    
    // MARK: - Headers
    internal var headers: HTTPHeaders? {
        
        switch self {
        case .register, .login, .forgotPassword, .allCountries:
            return ["Accept": "application/json", "x-api-key": ""]
            
        case .viewMyProfile, .updateMyProfile, .changePassword, .logout:
            return ["Accept": "application/json", "x-api-key": "", "x-access-token": ""]
        }
    }
    

    // MARK: - Parameters
    internal var parameters: Parameters? {
        
        switch self {
        case .login(let structure):
            return [:]
            
        case .login(let structure):
            return [:]
            
        case .forgotPassword(let email):
            return ["email": email]
            
        case .updateMyProfile(let structure):
            return [:]
            
        case .changePassword(let structure):
            return [:]
            
        default:
            return [:]
        }
    }
}
