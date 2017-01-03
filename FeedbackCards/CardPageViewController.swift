// Copyright (c) 2017 Jo Brunner
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

class CardPageViewController: UIPageViewController {

    override func awakeFromNib() {

        super.awakeFromNib()
        
        view.backgroundColor = Card.colorFrom(hexCode: "#393939")
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        setViewControllers(
            [viewControllerAt(index: CardDeck.current.index)!],
            direction: .forward,
            animated: false,
            completion: nil
        )
    }

    override var prefersStatusBarHidden: Bool {
    
        return true
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CardPageViewController {
    
    func viewControllerAt(index: Int) -> UIViewController? {
        
        if let controller = StoryboardHelper.controller("CardViewController") as? CardViewController {
            
            controller.card = CardDeck.index(index).card
            
            return controller
        }
        
        return nil
    }
}
