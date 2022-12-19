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
    
    let cameraImgView = UIImageView()
    
    let lineView2 = UIView().then {
        $0.backgroundColor = .linegray2
    }
    
    let textField1 = UITextField().then {
        $0.backgroundColor = .white
        $0.font = UIFont(name: "Poppins-Regular", size: 16)
        $0.attributedPlaceholder = NSAttributedString(
            string: "글 제목",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.square_gray]
        )
        $0.textColor = .black
    }
    
    let lineView3 = UIView().then {
        $0.backgroundColor = .linegray2
    }
    
    let textField2 = UITextField().then {
        $0.backgroundColor = .white
        $0.font = UIFont(name: "Poppins-Regular", size: 16)
        $0.attributedPlaceholder = NSAttributedString(
            string: "카테고리",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.square_gray]
        )
        $0.textColor = .black
    }
    
    let lineView4 = UIView().then {
        $0.backgroundColor = .linegray2
    }
    
    let textField3 = UITextField().then {
        $0.backgroundColor = .white
        $0.font = UIFont(name: "Poppins-Regular", size: 16)
        $0.attributedPlaceholder = NSAttributedString(
            string: "₩ 가격",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.square_gray]
        )
        $0.textColor = .black
    }
    
    let lineView5 = UIView().then {
        $0.backgroundColor = .linegray2
    }
    
    let priceButton = UIButton().then {
        $0.addTarget(self, action: #selector(checkButton), for: .touchUpInside)
    }
    
    let priceLabel = UILabel().then {
        $0.text = "가격제안 받기"
        $0.textColor = .square_gray
        $0.font = UIFont(name: "Poppins-Regular", size: 13)
    }
    
    let textViewPlaceHolder = "내용을 작성해주세요."
    lazy var textView = UITextView().then {
        $0.backgroundColor = .clear
        $0.font = UIFont(name: "Poppins-Regular", size: 16)
        $0.textColor = .square_gray
        $0.text = textViewPlaceHolder
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
    
    let lastLineView = UIView().then {
        $0.backgroundColor = .linegray2
    }
    
    private lazy var containerView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
        configImageView()
        configButton()
        self.textField3.delegate = self
        self.textView.delegate = self
        self.completionButton(isOn: false)
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
        
        [writeLabel, writeImgView, settingImgView, settingLabel, lastLineView].forEach {
            footerView.addSubview($0)
        }
        
        [cameraImgView, lineView2, textField1, lineView3, textField2, lineView4, textField3, lineView5, priceButton, priceLabel, textView].forEach {
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
        
        cameraImgView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(16)
        }
        
        lineView2.snp.makeConstraints {
            $0.top.equalTo(self.cameraImgView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().offset(15)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        textField1.snp.makeConstraints {
            $0.top.equalTo(self.lineView2.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().offset(15)
        }
        
        lineView3.snp.makeConstraints {
            $0.top.equalTo(self.textField1.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview().offset(15)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        textField2.snp.makeConstraints {
            $0.top.equalTo(self.lineView3.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().offset(15)
        }
        
        lineView4.snp.makeConstraints {
            $0.top.equalTo(self.textField2.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview().offset(15)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        textField3.snp.makeConstraints {
            $0.top.equalTo(self.lineView4.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().offset(15)
        }
        
        lineView5.snp.makeConstraints {
            $0.top.equalTo(self.textField3.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview().offset(15)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        priceLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.textField3)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-15)
        }
        
        priceButton.snp.makeConstraints {
            $0.centerY.equalTo(self.textField3)
            $0.trailing.equalTo(self.priceLabel.snp.leading).offset(-5)
        }
        
        textView.snp.makeConstraints {
            $0.top.equalTo(self.lineView5.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().offset(15)
            $0.height.equalTo(305)
            $0.bottom.equalToSuperview().offset(15)
        }
        
        footerView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(47)
        }
        
        lastLineView.snp.makeConstraints {
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
        cameraImgView.image = UIImage(named: "camera")
    }
    
    private func configButton(){
        let backgroundButtonImage = UIImage(named: "ios_check_off") as UIImage?
        priceButton.setImage(backgroundButtonImage, for: .normal)
    }
    
    @objc private func touchupCloseButton() {
        self.dismiss(animated: true)
    }
    
    @objc private func touchupDoneButton() {
        
    }
    
    func completionButton(isOn: Bool){
        switch isOn{
        case true:
            priceButton.setImage(UIImage(named: "ios_check_on"), for: .normal)
        case false:
            priceButton.setImage(UIImage(named: "ios_check_off"), for: .normal)
        }
    }
    
    @objc private func checkButton() {
        completionButton(isOn: true)
    }
}

extension CreateVC: UITextFieldDelegate, UITextViewDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location == 0 && range.length != 0 {
            priceLabel.textColor = .square_gray
        } else {
            priceLabel.textColor = .black
        }
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .lightGray
        }
    }
}
