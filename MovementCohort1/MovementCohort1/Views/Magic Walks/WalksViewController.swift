import UIKit
import MapKit

class MagicWalksViewController: UIViewController {
    let birmingham = CLLocationCoordinate2D(latitude: 33.543682, longitude: -86.779633)
    let locations = [["title": "EdFarm", "latitude": 33.517070, "longitude": -86.808441],
        ["title":"Fred Shuttlesworth Statue", "latitude": 33.530050, "longitude": -86.826680],
        ["title":"St. Paul’s Cathedral", "latitude": 33.517860, "longitude": -86.804820]
    ]
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize() {
        setupMapView()
        addCustomPin()
    }
    
    private func setupMapView() {
        mapView.overrideUserInterfaceStyle =
            .dark
        mapView.setRegion(MKCoordinateRegion(center: birmingham, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: false)
//        mapView.delegate = self
    }
    
    private func addCustomPin() {
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            let pins = CLLocationCoordinate2D(latitude: location["latitude"] as! Double, longitude: location["longitude"] as! Double)
            
            annotations.coordinate = pins
            mapView.addAnnotation(annotations)
            
        }
       
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        guard !(annotation is MKUserLocation) else {
//            return nil
//        }
//
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
//
//        if annotationView == nil {
//            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
//            annotationView?.canShowCallout = true
//        } else {
//            annotationView?.annotation = annotation
//        }
//
////        annotationView?.image = UIImage(named: "edFarm2")
//
//        return annotationView
//    }



    

}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct WalksViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return UIStoryboard(name: "Walks", bundle: nil).instantiateInitialViewController()!
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

struct MagicWalksViewController_Preview: PreviewProvider {
    static var previews: some View {
        WalksViewControllerRepresentable()
    }
}
#endif
