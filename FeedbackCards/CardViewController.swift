// Copyright (c) 2016, 2017 Jo Brunner
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

class CardViewController: UIViewController {

    let cornerRadius: CGFloat = 6.5
    let alpha: CGFloat = 0.8

    var primaryColor: UIColor!

    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortCutView: UIView!
    @IBOutlet weak var shortCutLabel: UILabel!
    @IBOutlet weak var figureView: UIView!
    @IBOutlet weak var figureCardView: CardFigureView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!

    var card: Card! {
        didSet {
            let _ = CardDeck.index(fromCard: card)
        }
    }

    override func awakeFromNib() {

        view.backgroundColor = primaryColor
        
        shortCutView.layer.cornerRadius = cornerRadius
        shortCutView.layer.borderColor = UIColor.white.cgColor
        shortCutView.layer.borderWidth = 1.5

        nameView.layer.cornerRadius = cornerRadius
        nameView.alpha = alpha
        
        figureView.layer.cornerRadius = cornerRadius
        figureView.alpha = alpha

        descriptionView.layer.cornerRadius = cornerRadius
        descriptionView.alpha = alpha
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        
        let size = view.bounds.size
        let useWideDesign = size.width >= size.height
        
        // Alle Sonderfälle, die direkt mit einer Änderunge
        // der SizeClass zu tun haben, konnten direkt über
        // Verying des AutoLayouts im IB eingestellt werden
        if self.traitCollection.verticalSizeClass == .regular {
        }
        
        if self.traitCollection.verticalSizeClass == .regular {
        }
        
        if useWideDesign {
            stackView.axis = .horizontal
        }
        else {
            stackView.axis = .vertical
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        primaryColor = card.colorCode

        view.backgroundColor = primaryColor
        
        shortCutView.backgroundColor = primaryColor
        shortCutLabel.text = card.shortCut
        
        nameLabel.text = card.name
        figureCardView.cardType = card.cardType
        descriptionLabel.text = card.description
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                         action: #selector(actionClose(_:))))
    }
}

extension CardViewController {
    
    func actionClose(_ tap: UITapGestureRecognizer) {
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
