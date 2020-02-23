import Foundation
import SwiftyJSON

protocol CodableInit {
    init(data: Data) throws
}

extension CodableInit where Self: Codable {
    init(data: Data) throws {
        //let json = JSON(data)
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: data)
    }
}

