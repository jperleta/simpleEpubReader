import Foundation

class LocalRepository: ServiceAPI {

    func getBook(bookName: String, completion: @escaping (Result<URL, Error>) -> Void) {
        let bookURL = Bundle.main.url(forResource: bookName,
                                      withExtension: "epub",
                                      subdirectory: nil,
                                      localization: "en")
        
        if let bookURL = bookURL {
            completion(.success(bookURL))
        } else {
            completion(.failure(RepositoryErrors.noLocalBook))
        }
    }
}
