//
//  ProductListVC.swift
//  CarrotMarket
//
//  Created by 고두영 on 2022/12/13.
//

import UIKit
import SnapKit
import Then

class ProductListVC: UIViewController {
    
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
    
    lazy var createButton = UIButton().then {
        $0.addTarget(self, action: #selector(presentToCreate), for: .touchUpInside)
    }
    
    private lazy var productTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .square_gray
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
        }()
    
    var productList: [ProductModel] = [
        ProductModel(img: "photo1", title: "기본 셔링 반팔티", location: "동대문구 제기동", time: "1분 전", price: "6,000원", heart: "ios_icon_heart_off", heartNumber: "5"),
        ProductModel(img: "photo2", title: "아이보리 가방", location: "동대문구 제기동", time: "1분 전", price: "25,000원", heart: "", heartNumber: ""),
        ProductModel(img: "photo1", title: "기본 셔링 반팔티", location: "동대문구 제기동", time: "1분 전", price: "6,000원", heart: "ios_icon_heart_off", heartNumber: "10"),
        ProductModel(img: "photo2", title: "아이보리 가방", location: "동대문구 제기동", time: "1분 전", price: "25,000원", heart: "", heartNumber: ""),
        ProductModel(img: "photo1", title: "기본 셔링 반팔티", location: "동대문구 제기동", time: "1분 전", price: "6,000원", heart: "", heartNumber: "")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setLayout()
        configImageView()
        configButton()
        view.backgroundColor = .white
    }
}

extension ProductListVC {
    private func setLayout() {
        
        [headerView, productTableView, createButton].forEach {
            view.addSubview($0)
        }
        
//        self.view.bringSubviewToFront(self.createButton)
        
        [locationLabel, searchImgView, menuImgView, alarmImgView, lineView1].forEach {
            headerView.addSubview($0)
        }
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
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
        
        productTableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(141 * productList.count)
        }
        
        createButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view).offset(-91)
            $0.trailing.equalToSuperview().offset(-15)
        }
    }
    
    private func configImageView(){
        searchImgView.image = UIImage(named: "ios_icon_search")
        menuImgView.image = UIImage(named: "ios_icon_cate")
        alarmImgView.image = UIImage(named: "ios_icon_bell")
    }
    
    private func configButton(){
        let backgroundButtonImage = UIImage(named: "ios_floating_button") as UIImage?
        createButton.setImage(backgroundButtonImage, for: .normal)
    }
    
    private func register() {
        productTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
    }
    
    @objc private func presentToCreate() {
        let nextVC = CreateVC()
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
        
    }
}

extension ProductListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 141
    }
}

extension ProductListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let productCell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else { return UITableViewCell() }
        productCell.dataBind(model: productList[indexPath.row])
        return productCell
    }
    
    
}
