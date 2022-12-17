//
//  CreateVC.swift
//  CarrotMarket
//
//  Created by 고두영 on 2022/12/17.
//

import UIKit
import SnapKit
import Then

class CreateVC: UIViewController {
    
    let headerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    lazy var closeButtton = UIButton().then {
        $0.setTitle("닫기", for: .normal)
        $0.titleLabel!.font = UIFont(name: "NotoSansSC-Regular", size: 17)
        $0.setTitleColor(.deepgray, for: .normal)
        $0.addTarget(self, action: #selector(touchupCloseButton), for: .touchUpInside)
        $0.backgroundColor = .clear
    }
    
    let titleLabel = UILabel().then {
        $0.text = "중고거래 글쓰기"
        $0.textColor = .black
        $0.font = UIFont(name: "NotoSansSC-Bold", size: 16)
    }
    
    lazy var doneButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.titleLabel!.font = UIFont(name: "NotoSansSC-Regular", size: 17)
        $0.setTitleColor(.orange, for: .normal)
        $0.addTarget(self, action: #selector(touchupDoneButton), for: .touchUpInside)
        $0.backgroundColor = .clear
    }

    let lineView1 = UIView().then {
        $0.backgroundColor = .square_gray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    
}

extension CreateVC {
    private func setLayout() {
        [headerView].forEach {
            view.addSubview($0)
        }
        
        [closeButtton, titleLabel, doneButton, lineView1].forEach {
            headerView.addSubview($0)
        }
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        
        closeButtton.snp.makeConstraints {
            $0.bottom.equalTo(self.lineView1.snp.top).offset(-11)
            $0.leading.equalToSuperview().offset(15)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.centerY.equalTo(self.closeButtton)
        }
        
        doneButton.snp.makeConstraints {
            $0.bottom.equalTo(self.closeButtton)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        lineView1.snp.makeConstraints {
            $0.top.equalTo(self.headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    @objc private func touchupCloseButton() {
        
    }
    
    @objc private func touchupDoneButton() {
        
    }
}
