import Foundation

struct Article: Decodable {
    enum CodingKeys: String, CodingKey {
        case author, title, body
        case createdAt = "created_at"
        case postDate = "post_date"
    }

    let author: String
    let title: String
    let body: String
    let createdAt: Date
    let postDate: Date

    static let decoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .rfc3339
        return decoder
    }()
}

extension ParseStrategy where Self == Date.ISO8601FormatStyle {
    static var dateTime: Self { .init(includingFractionalSeconds: true) }
    static var fullDate: Self { iso8601.year().month().day() }
}

extension JSONDecoder.DateDecodingStrategy {
    static let rfc3339 = custom {
        let string = try $0.singleValueContainer().decode(String.self)
        do {
            return try .init(string, strategy: .dateTime)
        } catch {
            return try .init(string, strategy: .fullDate)
        }
    }
}
