import UIKit

class BookSettingsPopViewController: UIViewController {
    
    private var viewModel: BookSettingsPopViewModel!
    
    convenience init(viewModel: BookSettingsPopViewModel)  {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let ppc = popoverPresentationController  {
            let preferredSize = self.preferredContentSize
            self.navigationController?.preferredContentSize = CGSize.zero
            self.navigationController?.preferredContentSize = preferredSize
            ppc.preferredContentSizeDidChange(forChildContentContainer: self)
        }
    }
    
    private func setupView() {
        self.preferredContentSize = CGSize(width: 300, height: 180)
        
        view.style(backgroundColor: .white)
        
        let mainStack = UIStackView()
            .style(axis: .vertical)
            .style(distribution: .fillEqually)
            .style(parent: view)
            .styleMakeConstraints { make in
                make.edges.equalTo(view)
            }
        
        SettingsButtonsRowView(buttonsConfig: viewModel.getSettingsFontConfig())
            .style(parent: mainStack)
        
        SettingsButtonsRowView(buttonsConfig: viewModel.getSettingsScrollConfig())
            .style(parent: mainStack)
        
        SettingsButtonsRowView(buttonsConfig: viewModel.getSettingsAppearanceConfig())
            .style(parent: mainStack)
    }
}

