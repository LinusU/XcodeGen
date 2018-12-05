import AuthenticationServices
import MobileCoreServices
import UIKit

@objc(CredentialProviderViewController)

class CredentialProviderViewController: ASCredentialProviderViewController {
    var mainNavigator: UINavigationController?

    override func prepareCredentialList(for serviceIdentifiers: [ASCredentialServiceIdentifier]) {
        self.mainNavigator = UINavigationController()

        self.addChild(self.mainNavigator!)
        self.view.addSubview(self.mainNavigator!.view)
        self.mainNavigator!.didMove(toParent: self)

        let _ = foobar()
    }

    func cancel() {
        self.extensionContext.cancelRequest(withError: NSError(domain: ASExtensionErrorDomain, code: ASExtensionError.userCanceled.rawValue))
    }

    func error() {
        self.extensionContext.cancelRequest(withError: NSError(domain: ASExtensionErrorDomain, code: ASExtensionError.failed.rawValue))
    }
}
