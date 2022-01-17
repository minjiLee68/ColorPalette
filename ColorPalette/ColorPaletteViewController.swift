import UIKit

class ColorPaletteViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let viewModel = ColorViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailColorViewController
            
            if let index = sender as? Int {
                let colorInfor = viewModel.colorInfo(at: index)
                vc?.viewModel.update(model: colorInfor)
            }
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfListCount
      }
      
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else { return UICollectionViewCell() }
        let colorInfo = viewModel.colorInfo(at: indexPath.item)
        cell.update(info: colorInfo)
        return cell
      }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 20
        let textAreaHeight: CGFloat = 50
        
        let width: CGFloat = (collectionView.bounds.width - itemSpacing) / 2
        let height: CGFloat = width * 10/9 + textAreaHeight
        collectionView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
}

class GridCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func update(info: Color) {
        imgView.image = info.image
        nameLabel.text = info.colorName
    }
}

class ColorViewModel {
    let colorList: [Color] = [
        Color(colorName: "가을하늘"),
        Color(colorName: "공주핑크"),
        Color(colorName: "노랑"),
        Color(colorName: "녹색"),
        Color(colorName: "베이비핑크"),
        Color(colorName: "소라"),
        Color(colorName: "회색")
    ]
    
    var numOfListCount: Int {
        return colorList.count
    }
    
    func colorInfo(at index: Int) -> Color {
        return colorList[index]
    }
}
