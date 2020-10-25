//
//  DetailsViewController.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 24/10/20.
//

import Foundation
import UIKit
import MapKit
class DetailsViewController: UIViewController, Storyboarded {
    @IBOutlet weak var titleDetails: UILabel!
    @IBOutlet weak var bodyDetails: UILabel!
    @IBOutlet weak var imgDetails: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var btnNavigationNow: UIButton!
    @IBOutlet weak var btnCheckit: UIButton!
    @IBOutlet weak var mapKit: MKMapView!
   
    weak var coordinator: MainCoordinator?
    var viewModel:HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(index: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Detalhes do Eventos"
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = ColorSystem.defaultElementeCell
        self.navigationController?.navigationBar.tintColor = ColorSystem.defaultElementsColor
    }
    func setupView(index: Int){
        if let event = viewModel?.modelHomeEvents.result?[index]{
            titleDetails.text = event.title
            bodyDetails.text = event.description
            imgDetails.kf.setImage(with: URL(string: event.image ?? ""))
            price.text = "Preço\n\(event.price?.description ?? "0")"
        }
    }
    
    @IBAction func btnCheckIn(_ sender: UIButton) {
    }
}
