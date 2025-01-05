import Foundation

struct Coordinates: Decodable {
  enum CodingKeys: String, CodingKey {
    case latitude = "lat"
    case longitude = "lng"
  }

  let latitude: String
  let longitude: String
}

struct Address: Decodable {
  let street: String
  let suite: String
  let city: String
  let zipcode: String
  let geo: Coordinates
}