import Foundation

struct Article: Decodable {
    enum CodingKeys: String, CodingKey {
        case author, title, body
        case createdAt = "created_at"
    }

    let author: String
    let title: String
    let body: String
    let createdAt: Date

    static let decoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .rfc3339
        return decoder
    }()
}

extension Formatter {
    static func rfc3339Formatter() -> ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }
}

extension JSONDecoder.DateDecodingStrategy {
    static let rfc3339 = custom { decoder in
        let dateStr = try decoder.singleValueContainer().decode(String.self)
        let formatter = Formatter.rfc3339Formatter()
        if let date = formatter.date(from: dateStr) {
            return date
        }
        throw DecodingError.dataCorrupted(
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Invalid date"
            )
        )
    }
}
