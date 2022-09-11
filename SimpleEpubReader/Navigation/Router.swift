import UIKit
import R2Navigator
import R2Shared
import R2Streamer

class Router {
    
    enum Destination {
        case list
        case book(publication: Publication, server: PublicationServer)
        case booksSettings(delegate: BookSettingsDelegate)
    }
    
    enum NavigationStyle {
        case pushOn(_ navController: UINavigationController?)
        case presentOn(_ viewController: UIViewController?)
    }
    
    func navigate(to destination: Destination, style: NavigationStyle) {
        guard let viewController = makeViewController(for: destination) else { return }
        
        switch style {
        case .presentOn(let baseViewController):
            baseViewController?.present(viewController, animated: true)
        case .pushOn(let baseNavigationController):
            baseNavigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func makeViewController(for destination: Destination) -> UIViewController? {
        switch destination {
        case .list:
            let listVM = ListViewModel()
            return ListViewController(viewModel: listVM)
        case .book(let publication, let server):
            let bookVM = BookViewModel(publication: publication, server: server)
            return BookViewController(viewModel: bookVM)
        case .booksSettings(let delegate):
            let bookSettingsVM = BookSettingsPopViewModel()
            bookSettingsVM.delegate = delegate
            
            let bookSettingsVC = BookSettingsPopViewController(viewModel: bookSettingsVM)
            bookSettingsVC.modalPresentationStyle = .popover
            
            return bookSettingsVC
        }
    }
}

