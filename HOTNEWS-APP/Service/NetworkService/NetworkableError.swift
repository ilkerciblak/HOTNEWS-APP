import Foundation


enum NetworkError: Error{
    case unknown
    case invalidUrl
    case noInternet
    case badResponseCode
    case decodeError
}
