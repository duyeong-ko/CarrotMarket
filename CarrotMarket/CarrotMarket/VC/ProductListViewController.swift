//
//  ProductListViewController.swift
//  CarrotMarket
//
//  Created by 고두영 on 2022/12/16.
//

import UIKit
import SnapKit
import Then

class ProductListViewController: UIViewController {
    
    let headerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let locationLabel = UILabel().then {
        $0.text = "상봉제1동"
        $0.textColor = .black
        $0.font = UIFont(name: "NotoSansSC-Bold", size: 16)
    }
    
    let searchImgView = UIImageView()
    let menuImgView = UIImageView()
    let alarmImgView = UIImageView()

    let lineView1 = UIView().then {
        $0.backgroundColor = .square_gray
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        configImageView()
        view.backgroundColor = .white
    }
}

extension ProductListViewController {
    private func setLayout() {
        
        view.addSubview(headerView)
        headerView.backgroundColor = .white
        [locationLabel, searchImgView, menuImgView, alarmImgView, lineView1].forEach {
            headerView.addSubview($0)
        }
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(9)
            $0.leading.equalToSuperview().offset(15)
        }
        
        alarmImgView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        menuImgView.snp.makeConstraints {
            $0.top.equalTo(self.alarmImgView.snp.top)
            $0.trailing.equalTo(self.alarmImgView.snp.leading).offset(-16)
        }

        searchImgView.snp.makeConstraints {
            $0.top.equalTo(self.alarmImgView.snp.top)
            $0.trailing.equalTo(self.menuImgView.snp.leading).offset(-16)
        }
        
        lineView1.snp.makeConstraints {
            $0.top.equalTo(self.headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    private func configImageView(){
        searchImgView.image = UIImage(named: "ios_icon_search")
        menuImgView.image = UIImage(named: "ios_icon_cate")
        alarmImgView.image = UIImage(named: "ios_icon_bell")
    }
}
