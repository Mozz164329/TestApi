import Foundation

// MARK: - Welcome
struct BookCategoriesModel: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [Results]

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct Results: Codable {
    let listName, displayName, listNameEncoded, oldestPublishedDate: String
    let newestPublishedDate: String
    let updated: Updated

    enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case displayName = "display_name"
        case listNameEncoded = "list_name_encoded"
        case oldestPublishedDate = "oldest_published_date"
        case newestPublishedDate = "newest_published_date"
        case updated
    }
}

enum Updated: String, Codable {
    case monthly = "MONTHLY"
    case weekly = "WEEKLY"
}
