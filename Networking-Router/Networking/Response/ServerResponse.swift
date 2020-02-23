import Foundation

/// Response enum, to make the results completion handler better, instead of:
/// (Any?) -> Void
/// (Any?, Error?) -> Void
/// to: (response) -> Void
///
/// - success: Request has been gracefully handled with (Codable object).
/// - failure: Current request failed, with the localized error.
enum ServerResponse<T> {
    case success(T), failure(LocalizedError?)
}
