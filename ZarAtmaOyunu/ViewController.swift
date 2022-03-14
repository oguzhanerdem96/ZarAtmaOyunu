//
//  ViewController.swift
//  ZarAtmaOyunu
//
//  Created by Oğuzhan Erdem on 13.03.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblOyuncuSkor1: UILabel!
    @IBOutlet weak var lblOyuncuSkor2: UILabel!
    @IBOutlet weak var lblOyuncu1Puan: UILabel!
    @IBOutlet weak var lblOyuncu2Puan: UILabel!
    @IBOutlet weak var İmgOyuncu1Durum: UIImageView!
    @IBOutlet weak var İmgOyuncu2Durum: UIImageView!
    @IBOutlet weak var İmgZar1: UIImageView!
    @IBOutlet weak var İmgZar2: UIImageView!
    @IBOutlet weak var lblSetSonucu: UILabel!
    
    var oyuncuPuanları = (birinciOyuncuPuani : 0 , ikinciOyuncuPuani : 0)
    var oyuncuSkorları = (birinciOyuncuSkoru : 0 , ikinciOyuncuSkoru : 0)
    
    var oyuncuSıra : Int = 1
    
    var maxSetSayisi : Int = 5
    var suankiSet : Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let arkaPlan = UIImage(named: "arkaPlan" ){
            self.view.backgroundColor = UIColor(patternImage: arkaPlan)
        }
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        zarDegerleriniUret()
    }
        func zarDegerleriniUret(){
       let zar1 = arc4random_uniform(6)+1
        let zar2 = arc4random_uniform(6)+1
        print("zar1 : \(zar1) , zar2 : \(zar2)")
            İmgZar1.image = UIImage(named: String(zar1))
            İmgZar2.image = UIImage(named: String(zar2))
            
    }
    
    
    



}
