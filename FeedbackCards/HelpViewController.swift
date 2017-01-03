import UIKit

class HelpViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                         action: #selector(actionClose(_:))))
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    @IBAction func closeButtonTouchUpInside(_ sender: UIButton) {
    
        dismissViewController()
    }
}

extension HelpViewController {
    
    func actionClose(_ tap: UITapGestureRecognizer) {
        
        dismissViewController()
    }

    func dismissViewController() {
        
        presentingViewController?.dismiss(animated: true,
                                          completion: nil)
    }
}

