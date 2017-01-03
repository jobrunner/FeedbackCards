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

class MainViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {

        super.viewDidLoad()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(reloadData),
            name: UserDefaults.didChangeNotification,
            object: nil
        )
    
        registerNibs()
        reloadData()
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    override func viewWillLayoutSubviews() {
        
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "InfoSegue" {
            
            let destinationViewController = segue.destination as UIViewController
            
            destinationViewController.modalTransitionStyle = .crossDissolve
            destinationViewController.modalPresentationStyle = .overCurrentContext
//            self.present(destinationViewController,
//                         animated: true,
//                         completion: nil)
            return
         }
    }

    @IBAction func settingsButtonTouchUpInside(_ sender: UIButton) {

        UIApplication.shared.openURL(URL(string:UIApplicationOpenSettingsURLString)!)
    }
}

extension MainViewController {
    
    func registerNibs() {
        
        let nib = UINib.init(nibName: "MenuCardCollectionViewCell", bundle: Bundle.main)
        collectionView!.register(nib, forCellWithReuseIdentifier: "MenuCardCollectionViewCell")
    }
    
    func reloadData() {
        
        CardDeck.reset()
        collectionView.reloadData()
    }
}
