import UIKit
import MapboxMaps

class ViewController: UIViewController {

  internal var mapView: MapView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let myResourceOptions = ResourceOptions(accessToken: "Mapbox_Access_Token")
    let myCameraOptions = CameraOptions(center: CLLocationCoordinate2D(latitude: 38.89, longitude: -77.03), zoom: 16)

    let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, cameraOptions: myCameraOptions, styleURI: .light)
    mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)

    self.view.addSubview(mapView)

    var pointAnnotation = PointAnnotation(coordinate: CLLocationCoordinate2D(latitude: 38.89, longitude: -77.03))
    pointAnnotation.image = .init(image: UIImage(named: "red_marker")!, name: "red_marker")
    pointAnnotation.iconAnchor = .bottom
    pointAnnotation.textField = "Washington, D.C."

    var pointAnnotation2 = PointAnnotation(coordinate: CLLocationCoordinate2D(latitude: 40.71, longitude: -74.01))
    pointAnnotation2.image = .init(image: UIImage(named: "blue_marker")!, name: "blue_marker")
    pointAnnotation2.iconAnchor = .bottom
    pointAnnotation2.textField = "New York City"

    let pointAnnotationManager = mapView.annotations.makePointAnnotationManager()
    pointAnnotationManager.annotations = [pointAnnotation, pointAnnotation2]

    try! mapView.mapboxMap.style.setProjection(StyleProjection.init(name: .globe))
  }


}
