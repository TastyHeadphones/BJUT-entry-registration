//
//  GeneralUserViewController.swift
//  BJUT-entry-registration
//
//  Created by Magic Keegan on 4/8/22.
//

import UIKit

class GeneralUserViewController: UIViewController,UICollectionViewDataSource {
    @IBOutlet var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Building.allBuildings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuildingCell", for: indexPath)
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 30))
        title.text = Building.allBuildings[indexPath.row].name
        
        title.textAlignment = .center
        
        //增加圆角矩形
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.blue.cgColor
        cell.contentView.layer.masksToBounds = true
        
        cell.contentView.addSubview(title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "showBuildingWeb", sender: indexPath)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "showBuildingWeb":
            if let cell = sender as? UICollectionViewCell,let indexPath = self.collectionView.indexPath(for: cell){
                let row = indexPath.row
                let building = Building.allBuildings[row]
                //print(building.name)
                let webVC
                = segue.destination as! BuildingWebViewController
                webVC.building = building
                webVC.request = building.generateBuildingRequest()
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    @IBAction func generateQRcode(_ sender: UIButton){
        
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(Student.mySelf)
        let image = generateQRCode(from: jsonData)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        
        
    }
    
    private func generateQRCode(from data: Data) -> UIImage? {

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 6, y: 6)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }

    
}
