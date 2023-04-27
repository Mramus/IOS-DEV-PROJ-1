

import UIKit

protocol PokedexCellDelegate {
    func presentInfoView(withPokemon pokemon: Pokemon)
}

class PokedexCell: UICollectionViewCell {

    var delegate: PokedexCellDelegate?
        
    public var pokemon: Pokemon? {
        didSet {
            nameLabel.text = pokemon?.name?.capitalized
            nameContainerView.backgroundColor = pokemon?.color
        }
    }

    
    
    lazy var nameContainerView: UIView = {
        let view = UIView()
        
        view.addSubview(nameLabel)
        nameLabel.center(inView: view)
        
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Bulbasaur"
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViewComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

    func configureViewComponents() {
        self.layer.cornerRadius = 0
        self.clipsToBounds = true
        
 
        
        addSubview(nameContainerView)
        nameContainerView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
    
    }
    
}
