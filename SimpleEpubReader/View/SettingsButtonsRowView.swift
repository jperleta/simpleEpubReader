import UIKit

struct SettingsButtonConfig {
    let iconRes: String
    let text: String
    let target: Any
    let action: Selector
}

class SettingsButtonsRowView: UIStackView {
    private var buttonsConfig: [SettingsButtonConfig]!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    init(buttonsConfig: [SettingsButtonConfig]) {
        super.init(frame: .zero)
        
        self.buttonsConfig = buttonsConfig
        
        setupView()
    }
    
    private func setupView() {
        self.style(distribution: .fillEqually)
        
        for config in buttonsConfig {
            SettingsButtonView(buttonConfig: config)
                .style(parent: self)
        }
    }
}

private class SettingsButtonView: UIStackView {
    private var buttonConfig: SettingsButtonConfig!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    init(buttonConfig: SettingsButtonConfig) {
        super.init(frame: .zero)
        
        self.buttonConfig = buttonConfig
        
        setupView()
    }
    
    private func setupView() {
        self.style(layoutMargins: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0))
            .style(layoutMarginsRelativeArrangement: true)
            .style(gestureRecognizer: UITapGestureRecognizer(target: buttonConfig.target, action: buttonConfig.action))
            .style(spacing: 16)
            .style(alignment: .center)
        
        UIImageView()
            .style(image: UIImage(named: buttonConfig.iconRes))
            .style(contentMode: .scaleAspectFit)
            .style(parent: self)
            .styleMakeConstraints { make in
                make.width.equalTo(20)
            }
        
        UILabel()
            .style(text: Localized.string(key: buttonConfig.text), fontSize: 16, fontStyle: .regular, fontColor: .darkText)
            .style(parent: self)
    }
}
