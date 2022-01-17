import UIKit

class DetailColorViewController: UIViewController {
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var imgViewCenterX: NSLayoutConstraint!
    @IBOutlet weak var nameCenterX: NSLayoutConstraint!
    
    let viewModel = detailColorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    private func prepareAnimation() {
//        imgViewCenterX.constant = view.bounds.width
//        nameCenterX.constant = view.bounds.width
        colorName.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
        colorName.alpha = 0
    }
    
    private func showAnimation() {
//        imgViewCenterX.constant = 0
//        nameCenterX.constant = 0
//
//        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
//            self.view.layoutIfNeeded()
//        }, completion: nil)
//
//        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.colorName.transform = CGAffineTransform.identity
            self.colorName.alpha = 1
        }, completion: nil)
       
        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    func updateUI() {
        if let colorInfo = viewModel.color {
            imgView.image = colorInfo.image
            colorName.text = colorInfo.colorName
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class detailColorViewModel {
    var color: Color?
    
    func update(model: Color?) {
        color = model
    }
}
