//
//  CharacterCollectionViewCell.swift
//  (M5)Lesson-1(HomeWork)
//
//  Created by Ahmed Muvaza on 13/7/23.


import UIKit
import SnapKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = String(describing: CharacterCollectionViewCell.self)
    
    private lazy var nameLabel = UILabel()
    private lazy var genderLabel = UILabel()
    private lazy var characterImageView: UIImageView = {
        let view = UIImageView()
        view.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        view.image = UIImage(systemName: "person.fill")
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var hStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(characterImageView)
        view.addArrangedSubview(vStackView)
        view.distribution = .fillProportionally
        view.axis = .horizontal
        return view
    }()
    
    private lazy var vStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(nameLabel)
        view.addArrangedSubview(genderLabel)
        view.distribution = .fillEqually
        view.axis = .vertical
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(hStackView)
        hStackView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(item: Character) {
        nameLabel.text = item.name
        genderLabel.text = item.gender
        
        let url = URL(string: item.image)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.characterImageView.image = UIImage(data: data!)
            }
        }
    }
        
        func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) { URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
}
