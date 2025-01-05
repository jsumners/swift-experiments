// See https://developer.apple.com/documentation/Testing

import Testing
import Foundation
// The "@testable" attribute (https://docs.swift.org/swift-book/documentation/the-swift-programming-language/attributes/#testable)
// mutates the target module making "private" exports (the default) available
// as "public" exports. Without this attribute, this experiment would not
// compile.
@testable import Foo

@Test
func decodePerson() {
  // The JSONDecoder.decode method expects the input to be a byte array.
  // Strings conform to the StringProtocol (https://developer.apple.com/documentation/swift/stringprotocol)
  // which requires a `.data() -> Data?` method be implemented. So here, we
  // are using that method and applying a "force unwrap"
  // (https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Force-Unwrapping)
  // to get the byte array.
  //
  // Additionally, since JSON is supposed to be UTF8 encoded, we utilize the
  // utf8 view of the string (https://developer.apple.com/documentation/swift/stringprotocol/utf8).
  let input = """
    {
      "id": 1,
      "name": "Leanne Graham",
      "username": "Bret",
      "email": "Sincere@april.biz",
      "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {
          "lat": "-37.3159",
          "lng": "81.1496"
        }
      },
      "phone": "1-770-736-8031 x56442",
      "website": "hildegard.org",
      "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
      }
    }
  """.data(using: .utf8)!

  let decoder = JSONDecoder()
  let decoded: Person = try! decoder.decode(Person.self, from: input)
  #expect(decoded.name == "Leanne Graham")
  #expect(decoded.company.catchPhrase == "Multi-layered client-server neural-net")
  #expect(decoded.company.moto == "harness real-time e-markets")
  #expect(decoded.address.geo.latitude == "-37.3159")
}