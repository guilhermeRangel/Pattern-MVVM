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
    @IBOutlet weak var btnCheckIn: UIButton!
    @IBOutlet weak var mapKit: MKMapView!
    
    @IBOutlet weak var viewParticipants: UIView!
    
    @IBOutlet weak var check1: UIImageView!
    @IBOutlet weak var check2: UIImageView!
    @IBOutlet weak var check3: UIImageView!
    @IBOutlet weak var check4: UIImageView!
    
    @IBOutlet weak var peoplesCount: UILabel!
    weak var coordinator: MainCoordinator?
    var viewModel:HomeViewModel?
    var checkInViewModel = DetailsViewModel()
    var currentLocation = CoreLocationManager()
    var alerts = Alerts()
    
    var idEventy:Int?
    var latitudeDestiny: Double!
    var longitudeDestiny: Double!
    var flagCheckIn:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkInViewModel.checkInService.detailsServiceDelegate = self
        guard let index = idEventy else {return}
        setupView(index: index)
  
    }
    func showPeoplesChecked(){
        check1.isHidden = true
        check2.isHidden = true
        check3.isHidden = true
        check4.isHidden = true
        peoplesCount.isHidden = true
        viewParticipants.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Detalhes do Eventos".localized
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
            price.text = "Preço\n\(event.price?.description ?? "0")".localized
            
            if let latitude = event.latitude, let longitude = event.longitude {
                latitudeDestiny = latitude
                longitudeDestiny = longitude
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                
                let region = centerMapOnLocation(CLLocation(latitude: latitude, longitude: longitude))
                if event.people!.count > 0{
                    if let p0 = event.people?[0].picture {
                        check1.kf.setImage(with: URL(string: p0))
                    }
                    if let p1 = event.people?[1].picture{
                        check2.kf.setImage(with: URL(string: p1))
                    }
                    if let p2 = event.people?[2].picture{
                        check3.kf.setImage(with: URL(string: p2))
                    }
                    if let p3 = event.people?[3].picture{
                        check4.kf.setImage(with: URL(string: p3))
                    }

                    if let count = event.people?.count.description{
                        peoplesCount.text = "+\(count)"
                    }
                }else{
                    showPeoplesChecked()
                }
               
                mapKit.addAnnotation(annotation)
                mapKit.setRegion(region, animated: true)
            }
            
        }
        let rightBarButton = UIBarButtonItem(title: "Compartir".localized, style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.shareItemTapped(_:)))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @IBAction func btnCheckIn(_ sender: UIButton) {
        if let id = idEventy {
            let result = alerts.alertJoinEvent(eventId: id.description)
            present(result, animated: true) {
                self.checkInViewModel.checkInEvent(eventId: id.description, name: UIDevice.current.name, email: "guilherme.rangel@icoud.com")
            }
        }
    }
    
    @IBAction func btnNavigationNow(_ sender: UIButton) {
        if let coordinate = currentLocation.locationManager?.location?.coordinate{
            let result = alerts.alertExternalMaps(latOrigin: coordinate.latitude, lngOrigin: coordinate.longitude, latDest: latitudeDestiny, lngDest: longitudeDestiny)
            present(result, animated: true, completion: nil)
        }
    }
}

extension DetailsViewController: DetailsServiceDelegate{
    func checkIn(_ result: Bool) {
        if let count = Int(peoplesCount.text!) {
            if !flagCheckIn{
                peoplesCount.text = "+\(1+count)"
                flagCheckIn = true
            }
        }
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
    
    
    @objc func shareItemTapped(_ sender:UIBarButtonItem!){
        let vc = UIActivityViewController(activityItems: ["\(self.idEventy ?? 0)-\(self.titleDetails.text ?? "evento sicredi")"], applicationActivities: [])
        self.present(vc, animated: true)
       
    }
}
