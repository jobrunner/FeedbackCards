import UIKit

class CardPageViewDataSource: NSObject, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let controller = StoryboardHelper.controller("CardViewController") as? CardViewController {

            let card = (viewController as! CardViewController).card

            controller.card = CardDeck.index(fromCard: card!).prev.card
            
            return controller
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {

        if let controller = StoryboardHelper.controller("CardViewController") as? CardViewController {
            
            let card = (viewController as! CardViewController).card
            
            controller.card = CardDeck.index(fromCard: card!).next.card

            return controller
        }
        
        return nil
    }
}
