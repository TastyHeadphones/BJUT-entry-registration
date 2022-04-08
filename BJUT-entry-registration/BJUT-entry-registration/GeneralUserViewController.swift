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
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 50))
        title.text = Building.allBuildings[indexPath.row].name
        title.font = UIFont(name: "AvenirNext-Bold", size: 10)
        title.textAlignment = .center
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
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
