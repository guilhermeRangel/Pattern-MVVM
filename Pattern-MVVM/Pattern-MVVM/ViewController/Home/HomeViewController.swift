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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    weak var coordinator: MainCoordinator?
    var viewModel = HomeViewModel()
    var alert = Alerts()
    //flag to when be not connected
    var repeats = true
    let heightScreen = UIScreen.main.bounds.height
    let widthScreen = UIScreen.main.bounds.width
   
    override func viewDidLoad() {
        super.viewDidLoad()
        enableDelegates()
        self.statusAcitivityIndicator(status: true)
        let nib = UINib(nibName: CommomTableViewCell.name, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CommomTableViewCell.name)
    }
    
    func enableDelegates(){
        viewModel.homeService.homeServiceDelegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Eventos"
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = ColorSystem.defaultElementeCell
        
        if CheckConnectivity.isConnectedToInternet{
            viewModel.fetch()
            self.repeats = false
            
        }else{
            let result = alert.alertOffline()
            present(result, animated: true, completion: {
                
                Timer.scheduledTimer(withTimeInterval: 10, repeats: self.repeats) { (_) in
                    self.viewModel.fetch()
                    self.tableView.reloadData()
                    self.repeats = true
                }
            })
        }
    }
}




extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        heightScreen / 3
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
            if let dateEvent = result[indexPath.row]?.date{
                cell.setDate(dateEvent)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.goToDetails(viewModel: viewModel, id: indexPath.row)

    }
}



extension HomeViewController: HomeServiceDelegate{
    func onHomeFetched(_ result: [Events]) {
        viewModel.modelHomeEvents.result = result
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        self.statusAcitivityIndicator(status: false)
        
    }
}


extension HomeViewController{
    func statusAcitivityIndicator(status: Bool){
        if status{
            self.activityIndicator.startAnimating()
        }else{
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
}
