import UIKit

class DetailColorViewController: UIViewController {
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var colorName: UILabel!
    
    let viewModel = detailColorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
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
