import Foundation

protocol ServiceAPI {
    func getBook(bookName: String, completion: @escaping (Result<URL, Error>) -> Void)
}

enum RepositoryErrors: Error {
    case noLocalBook
}
