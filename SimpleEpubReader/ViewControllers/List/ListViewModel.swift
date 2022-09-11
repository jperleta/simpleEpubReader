import UIKit
import R2Shared
import R2Streamer
import R2Navigator

class ListViewModel {
    
    private let dataRepository: ServiceAPI?
    
    init(dataRepository: ServiceAPI? = DataRepository()) {
        self.dataRepository = dataRepository
    }
    
    func read(book: String, in navigationController: UINavigationController?) {
        dataRepository?.getBook(bookName: book, completion: { [weak self] (result: Result<URL, Error>) in
            switch result {
            case .success(let url):
                self?.getEpublication(on: url, in: navigationController)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    private func getEpublication(on url: URL, in navigationController: UINavigationController?) {
        guard let publicationServer = PublicationServer() else { return }
        
        let streamer: Streamer = Streamer()
        streamer.open(asset: FileAsset(url: url), allowUserInteraction: false, sender: self) { [weak self] result in
            switch result {
            case .success(let publication):
                
                do {
                    try publicationServer.add(publication)
                    
                    self?.presentPublication(publication: publication,
                                             in: navigationController,
                                             resourcesServer: publicationServer)
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            case .cancelled:
                print("Opening of publication cancelled")
            }
        }
    }
    
    private func presentPublication(publication: Publication,
                                    in navigationController: UINavigationController?,
                                    resourcesServer: PublicationServer) {
        App.router.navigate(to: .book(publication: publication, server: resourcesServer), style: .pushOn(navigationController))
    }
}
