import UIKit
import R2Navigator
import R2Shared
import R2Streamer
import Combine

class BookViewController: EPUBNavigatorViewController {
    
    private enum Constants: String {
        case day = "readium-default-on"
        case night = "readium-night-on"
    }
    
    private var viewModel: BookViewModel!
    
    private var popoverUserconfigurationAnchor: UIBarButtonItem?
    
    private var cancelBag: [AnyCancellable] = [AnyCancellable]()
    
    convenience init(viewModel: BookViewModel)  {
        self.init(publication: viewModel.publication, resourcesServer: viewModel.server)
        
        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.save(userSettings: userSettings)
    }
    
    private func bind() {
        viewModel?.updateUserSettings
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.updateUserSettingsStyle()
            })
            .store(in: &cancelBag)
        
        viewModel?.updateUIStyle
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] userProperty in
                guard let self = self else { return }
                self.updateUIStyle(for: userProperty)
            })
            .store(in: &cancelBag)
    }
    
    private func setupView() {
        view.style(backgroundColor: .white)
        
        viewModel.set(userSettings: userSettings)
        
        navigationItem.rightBarButtonItems = makeNavigationBarButtons()
    }
    
    private func makeNavigationBarButtons() -> [UIBarButtonItem] {
        let btnSettings = UIBarButtonItem(image: UIImage(named: "icon_settings"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(presentUserSettings))
        
        popoverUserconfigurationAnchor = btnSettings

        return [btnSettings]
    }
    
    @objc func presentUserSettings() {
        guard let bookSettingsPopVC = App.router.makeViewController(for: .booksSettings(delegate: viewModel)) else { return }
        
        let popoverPresentationController = bookSettingsPopVC.popoverPresentationController
        popoverPresentationController?.barButtonItem = popoverUserconfigurationAnchor
        popoverPresentationController?.delegate = viewModel
        
        present(bookSettingsPopVC, animated: true)
    }
    
    private func updateUserSettingsStyle() {
        DispatchQueue.main.async { [weak self] in
            self?.updateUserSettingStyle()
        }
    }
    
    private func updateUIStyle(for appearance: UserProperty) {
        let appeareance = appearance.toString()
        view.backgroundColor = Constants.day.rawValue == appeareance ? .white : .black
    }
}
