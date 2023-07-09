import Foundation

struct Endpoints {
    let allBookCategories: String
    let bookInCategory: String
    let apiKey = "?api-key=4kGB10saAEPzqZY9CRbK9ADE786x8NRQ"
}

extension Endpoints {
    static let current = Endpoints (
        allBookCategories: "https://api.nytimes.com/svc/books/v3/lists/names.json",
        bookInCategory: "https://api.nytimes.com/svc/books/v3/lists/current/"
    )
}
