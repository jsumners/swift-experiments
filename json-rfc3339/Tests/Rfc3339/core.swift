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
            "created_at": "2025-01-20T08:30:00.123-05:00",
            "post_date": "2025-02-01"
        }
        """.data(using: .utf8)!
    let article = try! Article.decoder.decode(Article.self, from: input)
    #expect(article.author == "John Doe")
    #expect(article.title == "A Test")
    #expect(article.body == "This is a test.")

    let createdAt = Calendar.current.dateComponents(
        in: TimeZone(secondsFromGMT: -1 * 5 * 3600)!,
        from: article.createdAt
    )
    #expect(createdAt.year == 2025)
    #expect(createdAt.month == 1)
    #expect(createdAt.day == 20)
    #expect(createdAt.hour == 8)
    #expect(createdAt.minute == 30)
    #expect(createdAt.second == 0)
    #expect(createdAt.nanosecond! >= 123)

    let postDate = Calendar.current.dateComponents(
        in: TimeZone(secondsFromGMT: 0)!,
        from: article.postDate
    )
    #expect(postDate.year == 2025)
    #expect(postDate.month == 2)
    #expect(postDate.day == 1)
}
