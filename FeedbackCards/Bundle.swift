import Foundation

extension Bundle {
    
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    var versionNumber: String {

        guard   let release = infoDictionary?["CFBundleShortVersionString"] as? String,
                let build = infoDictionary?["CFBundleVersion"] as? String
        else {
            
            return NSLocalizedString("Unbekannt", comment: "App-Version")
        }
        
        return "\(release) (\(build))"
    }
}
