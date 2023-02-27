import UIKit

class ContributorCell: UICollectionViewCell {
    static let kind = String(describing: ContributorCell.self)
    static let reuseIdentifier = String(describing: ContributorCell.self)
    static let nib = UINib(nibName: String(describing: ContributorCell.self), bundle: nil)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
}
