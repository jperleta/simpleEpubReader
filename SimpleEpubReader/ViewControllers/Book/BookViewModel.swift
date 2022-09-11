import R2Navigator
import R2Shared
import R2Streamer
import UIKit
import Combine

class BookViewModel: NSObject {
    
    private enum Constants: Int {
        case appereanceDay = 0
        case appereanceNight = 2
    }
    
    private(set) var publication: Publication
    private(set) var server: PublicationServer
    
    private var userSettings: UserSettings?
    
    private(set) var updateUserSettings = PassthroughSubject<Void, Never>()
    private(set) var updateUIStyle = PassthroughSubject<UserProperty, Never>()
    
    init(publication: Publication, server: PublicationServer) {
        self.publication = publication
        self.server = server
    }
    
    func set(userSettings: UserSettings) {
        self.userSettings = userSettings
        
        // Set initial UI appearance.
        if let appearance = getUserProperty(for: ReadiumCSSReference.appearance.rawValue) {
            updateUIStyle.send(appearance)
        }
    }
    
    func save(userSettings: UserSettings) {
        userSettings.save()
    }
    
    func getUserProperty(for reference: String) -> UserProperty? {
        return userSettings?.userProperties.getProperty(reference: reference)
    }
}

extension BookViewModel: BookSettingsDelegate {
    
    func fontSizeDidChange(increase: Bool) {
        guard let fontSize = getUserProperty(for: ReadiumCSSReference.fontSize.rawValue) as? Incrementable else { return }
        
        if increase {
            fontSize.increment()
        } else {
            fontSize.decrement()
        }
        
        updateUserSettings.send()
    }
    
    func appearance(day: Bool) {
        guard let appearance = getUserProperty(for: ReadiumCSSReference.appearance.rawValue) as? Enumerable else { return }
        
        appearance.index = day ? Constants.appereanceDay.rawValue : Constants.appereanceNight.rawValue
        
        updateUserSettings.send()
        updateUIStyle.send(appearance)
    }
    
    func scrollMode(vertical: Bool)  {
        guard let scroll = getUserProperty(for: ReadiumCSSReference.scroll.rawValue) as? Switchable else { return }
        
        if (scroll.on && !vertical) || (!scroll.on && vertical) {
            scroll.switchValue()
            updateUserSettings.send()
        }
    }
}

extension BookViewModel: UIPopoverPresentationControllerDelegate {
    // Prevent the popover to be presented fullscreen on iPhones.
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

