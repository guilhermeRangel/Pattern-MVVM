//
//  HomeViewController.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 24/10/20.
//

import Foundation
import UIKit
import Kingfisher
class HomeViewController: UIViewController, Storyboarded {
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    weak var coordinator: MainCoordinator?
    var viewModel = HomeViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.homeService.homeServiceDelegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: CommomTableViewCell.name, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CommomTableViewCell.name)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetch()
    }
    
}




extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        height / 3
    }
    
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        guard let result = viewModel.modelHomeEvents.result?.count else {return 1}
        return result
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = CommomTableViewCell.name
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CommomTableViewCell else {
            fatalError("There should be a cell with \(identifier) identifier.")
        }
        if let result = self.viewModel.modelHomeEvents.result {
            cell.title.text = result[indexPath.row]?.title
            
            if let url = URL(string: result[indexPath.row]?.image ?? ""){
                cell.imageCell.kf.setImage(with: url)
            }
        }
          
       
        
        return cell
    }
    
    func tableView(_: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
}



extension HomeViewController: HomeServiceDelegate{
    func onHomeFetched(_ result: [Events]) {
        viewModel.modelHomeEvents.result = result
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
