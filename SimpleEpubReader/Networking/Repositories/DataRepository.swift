import Foundation

class DataRepository: ServiceAPI {
    private var remoteDataSource: ServiceAPI
    private var localDataSource: ServiceAPI
    
    init() {
        self.remoteDataSource = RemoteRepository()
        self.localDataSource = LocalRepository()
    }
    
    func getBook(bookName: String, completion: @escaping (Result<URL, Error>) -> Void) {
        localDataSource.getBook(bookName: bookName) { [weak self] (result: Result<URL, Error>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let url):
                completion(.success(url))
            case .failure(_):
                self.remoteDataSource.getBook(bookName: bookName, completion: completion)
            }
        }
    }
}

