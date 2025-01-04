import Testing
import Foundation
// The "@testable" attribute (https://docs.swift.org/swift-book/documentation/the-swift-programming-language/attributes/#testable)
// mutates the target module making "private" exports (the default) available
// as "public" exports. Without this attribute, this experiment would not
// compile.
@testable import Foo

@Test
func decodeCompany() {
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
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  """.data(using: .utf8)!

  let decoder = JSONDecoder()
  let decoded: Company = try! decoder.decode(Company.self, from: input)
  #expect(decoded.name == "Romaguera-Crona")
  #expect(decoded.catchPhrase == "Multi-layered client-server neural-net")
  #expect(decoded.moto == "harness real-time e-markets")
}