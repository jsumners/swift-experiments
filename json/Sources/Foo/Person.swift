import Foundation
// import Address

struct Person: Decodable {
  let id: Int
  let name: String
  let username: String
  let address: Address
  let phone: String
  let website: String
  let company: Company
}