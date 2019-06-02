//
//  ViewController.swift
//  MVVM_Swinject
//
//  Created by Joe on 19/05/19.
//  Copyright © 2019 Joe. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel : ViewModel?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel?.fetchData()
        setupRx()
    }
    
    func setupUI() {
        let nib = UINib.init(nibName: "CustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomCell")
    }

    func setupRx() {
        
        viewModel?.items?
            .bind(to: tableView.rx.items(cellIdentifier: "CustomCell", cellType: CustomCell.self)){ (row, person, cell) in
                cell.nameLabel.text = person.name
            }
        .disposed(by: disposeBag)
    }
}

