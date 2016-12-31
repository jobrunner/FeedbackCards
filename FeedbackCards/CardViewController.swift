import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortCutView: UIView!
    @IBOutlet weak var shortCutLabel: UILabel!
    @IBOutlet weak var figureView: UIView!
    @IBOutlet weak var figureCardView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    var primaryColor: UIColor!
    var cornerRadius: CGFloat!

    var card: Card! {
        didSet {
            let _ = CardDeck.index(fromCard: card)
        }
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
        cornerRadius = 6.5
        
        view.backgroundColor = primaryColor
        
        // figureImageView.image = UIImage(named: card.image)
        
        // backgroundOverlay.backgroundColor = primaryColor
        // backgroundOverlay.alpha = 0.5
        
        shortCutView.layer.cornerRadius = cornerRadius
        shortCutView.layer.borderColor = UIColor.white.cgColor
        shortCutView.layer.borderWidth = 1.5
        shortCutView.backgroundColor = primaryColor
        shortCutView.alpha = 1.0
        
        shortCutLabel.text = card.shortCut
        
        
        nameLabel.text = card.name
        nameView.layer.cornerRadius = cornerRadius
        
        
        figureView.layer.cornerRadius = cornerRadius
        
        
        descriptionView.layer.cornerRadius = cornerRadius
        
        
        //        descriptionBorderView.layer.borderWidth = 1.0
        //        descriptionBorderView.layer.borderColor = UIColor.white.cgColor
        //        descriptionBorderView.layer.cornerRadius = cornerRadius
        
        descriptionLabel.text = card.description
        
        //        helpButton.layer.borderWidth = 1.0
        //        helpButton.layer.cornerRadius = 10.0
        
        
        // Do any additional setup after loading the view.
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                         action: #selector(actionClose(_:))))
    }

    // extension!
    func actionClose(_ tap: UITapGestureRecognizer) {
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
