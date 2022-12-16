//
//  ProductTableViewCell.swift
//  CarrotMarket
//
//  Created by 고두영 on 2022/12/16.
//

import UIKit
import SnapKit
import Then

class ProductTableViewCell: UITableViewCell {
    
    static let identifier = "ProductTableViewCell"
    
    private let productImgView = UIImageView()
    private let titleLabel = UILabel().then {
        $0.textColor = .deepgray
        $0.font = UIFont(name: "NotoSansSC-Regular", size: 15)
    }
    private let locationLabel = UILabel().then {
        $0.textColor = .darklightgray
        $0.font = UIFont(name: "Poppins-Medium", size: 11)
    }
    private let timeLabel = UILabel().then {
        $0.textColor = .darklightgray
        $0.font = UIFont(name: "Poppins-Medium", size: 11)
    }
    private let priceLabel = UILabel().then {
        $0.textColor = .deepgray
        $0.font = UIFont(name: "Poppins-Bold", size: 15)
    }
    private let heartImgView = UIImageView()
    private let heartLabel = UILabel().then {
        $0.textColor = .deepgray
        $0.font = UIFont(name: "Poppins-Regular", size: 12)

    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension ProductTableViewCell {
    
    func setLayout() {
        backgroundColor = .clear
        
        [productImgView, titleLabel, locationLabel, timeLabel, priceLabel, heartImgView, heartLabel].forEach {
            contentView.addSubview($0)
        }
        
        productImgView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(23)
            $0.leading.equalToSuperview().offset(15)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(self.productImgView.snp.trailing).offset(17)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(self.titleLabel.snp.leading)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(self.locationLabel.snp.trailing).offset(10)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(self.timeLabel.snp.bottom).offset(3)
            $0.leading.equalTo(self.titleLabel.snp.leading)
        }
        
        heartLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(108)
            $0.trailing.equalToSuperview().offset(-21)
        }
        
        heartImgView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(104)
            $0.trailing.equalTo(self.heartLabel.snp.leading).offset(-3)
        }
    }
    
    func dataBind(model: ProductModel) {
        productImgView.image = UIImage(named: model.img)
        titleLabel.text = model.title
        locationLabel.text = model.location
        timeLabel.text = model.time
        priceLabel.text = model.price
        heartImgView.image = UIImage(named: model.heart)
        heartLabel.text = model.heartNumber
    }
}
