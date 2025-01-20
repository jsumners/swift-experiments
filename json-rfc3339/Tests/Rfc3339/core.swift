import Foundation
import Testing

@testable import JsonRfc3339

@Test
func test_decode_article() {
    let input = """
        {
            "author": "John Doe",
            "title": "A Test",
            "body": "This is a test.",
            "created_at": "2025-01-20T08:30:00.123-05:00"
        }
        """.data(using: .utf8)!
    let article = try! Article.decoder.decode(Article.self, from: input)
    #expect(article.author == "John Doe")
    #expect(article.title == "A Test")
    #expect(article.body == "This is a test.")

    let components = Calendar.current.dateComponents(
        in: TimeZone(secondsFromGMT: -1 * 5 * 3600)!,
        from: article.createdAt
    )
    #expect(components.year == 2025)
    #expect(components.month == 1)
    #expect(components.day == 20)
    #expect(components.hour == 8)
    #expect(components.minute == 30)
    #expect(components.second == 0)
    #expect(components.nanosecond! >= 123)
}
