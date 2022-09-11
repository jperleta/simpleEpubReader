import Foundation

protocol BookSettingsDelegate: AnyObject {
    func fontSizeDidChange(increase: Bool)
    func appearance(day: Bool)
    func scrollMode(vertical: Bool)
}

class BookSettingsPopViewModel {
    
    weak var delegate: BookSettingsDelegate?
    
    init() {
    }
    
    func getSettingsFontConfig() -> [SettingsButtonConfig] {
        let configFontSmall = SettingsButtonConfig(iconRes: "ic_font", text: "decrease", target: self, action: #selector(decreaseFontSize))
        let configFontBig = SettingsButtonConfig(iconRes: "ic_font", text: "increase", target: self, action: #selector(increaseFontSize))
        
        return [configFontSmall, configFontBig]
    }
    
    func getSettingsScrollConfig() -> [SettingsButtonConfig] {
        let configScrollVertical = SettingsButtonConfig(iconRes: "ic_menu_vertical", text: "vertical", target: self, action: #selector(scrollModeVertical))
        let configScrollHorizontal = SettingsButtonConfig(iconRes: "ic_menu_horizontal", text: "horizontal", target: self, action: #selector(scrollModeHorizontal))
        
        return [configScrollVertical, configScrollHorizontal]
    }
    
    func getSettingsAppearanceConfig() -> [SettingsButtonConfig] {
        let configAppearanceDay = SettingsButtonConfig(iconRes: "ic_sun", text: "day", target: self, action: #selector(appearanceDay))
        let configAppearanceNight = SettingsButtonConfig(iconRes: "ic_moon", text: "night", target: self, action: #selector(appearanceNight))
        
        return [configAppearanceDay, configAppearanceNight]
    }
    
    @objc func decreaseFontSize() {
        delegate?.fontSizeDidChange(increase: false)
    }

    @objc func increaseFontSize() {
        delegate?.fontSizeDidChange(increase: true)
    }

    @objc func scrollModeVertical() {
        delegate?.scrollMode(vertical: true)
    }
    
    @objc func scrollModeHorizontal() {
        delegate?.scrollMode(vertical: false)
    }

    @objc func appearanceDay() {
        delegate?.appearance(day: true)
    }
                   
    @objc func appearanceNight() {
        delegate?.appearance(day: false)
    }
}

