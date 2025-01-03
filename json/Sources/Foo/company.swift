import Foundation

struct Company: Decodable {
  // This special enum maps our struct field names to the field names
  // in the JSON that we want when decoding.
  // See https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types#2904057
  enum CodingKeys: String, CodingKey {
    case name, catchPhrase
    case moto = "bs"
  }

  let name: String
  let catchPhrase: String
  let moto: String
}