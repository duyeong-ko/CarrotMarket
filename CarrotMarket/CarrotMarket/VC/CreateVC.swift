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
    
    let footerView = UIView().then {
        $0.backgroundColor = .clear
    }

    let writeImgView = UIImageView()
    let settingImgView = UIImageView()
    
    let writeLabel = UILabel().then {
        $0.text = "자주 쓰는 문구"
        $0.textColor = .black
        $0.font = UIFont(name: "Poppins-Regular", size: 13)
    }
    
    let settingLabel = UILabel().then {
        $0.text = "보여줄 동네 설정"
        $0.textColor = .black
        $0.font = UIFont(name: "Poppins-Regular", size: 13)
    }
    
    let lineView2 = UIView().then {
        $0.backgroundColor = .linegray2
    }
    
    private lazy var containerView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
        configImageView()
    }
    
}

extension CreateVC {
    private func setLayout() {
        [headerView, footerView, containerView].forEach {
            view.addSubview($0)
        }
        
        [closeButtton, titleLabel, doneButton, lineView1].forEach {
            headerView.addSubview($0)
        }
        
        [writeLabel, writeImgView, settingImgView, settingLabel, lineView2].forEach {
            footerView.addSubview($0)
        }
        
        [].forEach {
            containerView.addSubview($0)
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
        
        footerView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(47)
        }
        
        lineView2.snp.makeConstraints {
            $0.top.equalTo(self.footerView.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        writeImgView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalToSuperview().offset(13)
        }
        
        writeLabel.snp.makeConstraints {
            $0.top.centerY.equalTo(self.writeImgView)
            $0.leading.equalTo(self.writeImgView.snp.trailing).offset(5)
        }
        
        settingImgView.snp.makeConstraints {
            $0.top.centerY.equalTo(self.writeImgView)
            $0.leading.equalTo(self.writeLabel.snp.trailing).offset(16)
        }
        
        settingLabel.snp.makeConstraints {
            $0.top.centerY.equalTo(self.writeImgView)
            $0.leading.equalTo(self.settingImgView.snp.trailing).offset(5)
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(self.headerView.snp.bottom)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalTo(self.footerView.snp.top)
        }
    }
    
    private func configImageView(){
        writeImgView.image = UIImage(named: "ios_icon_often")
        settingImgView.image = UIImage(named: "ios_icon_filter")
    }
    
    @objc private func touchupCloseButton() {
        
    }
    
    @objc private func touchupDoneButton() {
        
    }
}
