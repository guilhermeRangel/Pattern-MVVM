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
    var id:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let index = id else {return}
        setupView(index: index)
        //mapKit.delegate = self
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
            
            if let latitude = event.latitude, let longitude = event.longitude {
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                
                let region = centerMapOnLocation(CLLocation(latitude: latitude, longitude: longitude))
                
                mapKit.addAnnotation(annotation)
                mapKit.setRegion(region, animated: true)
            }
          
        }
    }
    
    @IBAction func btnCheckIn(_ sender: UIButton) {
        
    }
    
    @IBAction func btnNavigationNow(_ sender: UIButton) {
        
    }
    
    
   
}

extension DetailsViewController{


    
    func centerMapOnLocation(_ location: CLLocation) -> MKCoordinateRegion {
        let region = setCoordinateRegion(with: location.coordinate.latitude,
                                         longitude: location.coordinate.longitude)
        return region
    }

    private func setCoordinateRegion(with latitude: Double, longitude: Double) -> MKCoordinateRegion {
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.00, longitudeDelta: 0.01)
        let center = CLLocationCoordinate2D(latitude: latitude - span.latitudeDelta / 3, longitude: longitude)
        let region = MKCoordinateRegion(center: center, span: span)
        return region
    }
}
