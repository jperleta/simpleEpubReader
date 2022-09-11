import UIKit

class ListViewController: UIViewController {
    
    private var viewModel: ListViewModel!

    convenience init(viewModel: ListViewModel)  {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.style(backgroundColor: .white)
        
        let stack = UIStackView()
            .style(spacing: 32)
            .style(axis: .vertical)
            .style(gestureRecognizer: UITapGestureRecognizer(target: self, action: #selector(openEbook)))
            .style(parent: view)
            .styleMakeConstraints { make in
                make.center.equalTo(view.snp.center)
            }
        
        UIImageView()
            .style(contentMode: .scaleAspectFit)
            .style(imageRes: "moby_dick")
            .style(parent: stack)
            .styleMakeConstraints { make in
                make.size.equalTo(300)
            }
        
        let btnRead = UIButton()
            .style(title: Localized.string(key: "read"), fontSize: 20, fontStyle: .semibold, fontColor: .white)
            .style(backgroundColor: .blue)
            .style(target: self, action: #selector(openEbook))
            .style(parent: stack)
            .styleMakeConstraints { make in
                make.height.equalTo(48)
            }
        btnRead.layer.style(radius: 24)
    }
    
    @objc func openEbook() {
        viewModel.read(book: "MobyDick", in: navigationController)
    }
}
