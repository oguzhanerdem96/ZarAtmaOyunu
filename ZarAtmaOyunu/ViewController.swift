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
        if suankiSet > maxSetSayisi {
            return
        }
        
        zarDegerleriniUret()
    }
    
    func setSonucu(zar1 : Int , zar2 : Int){
        if oyuncuSıra == 1 {
            oyuncuPuanları.birinciOyuncuPuani = zar1 + zar2
            lblOyuncu1Puan.text = String(oyuncuPuanları.birinciOyuncuPuani)
            İmgOyuncu1Durum.image = UIImage(named: "bekle")
            İmgOyuncu2Durum.image = UIImage(named: "onay")
            lblSetSonucu.text = "Sıra 2.Oyuncuda..."
            oyuncuSıra = 2
            lblOyuncu2Puan.text  = "0"
            
        }else {
            oyuncuPuanları.ikinciOyuncuPuani = zar1 + zar2
            lblOyuncu2Puan.text = String(oyuncuPuanları.ikinciOyuncuPuani)
            İmgOyuncu1Durum.image = UIImage(named: "onay")
            İmgOyuncu2Durum.image = UIImage(named: "bekle")
            oyuncuSıra = 1
        
        
        if oyuncuPuanları.birinciOyuncuPuani > oyuncuPuanları.ikinciOyuncuPuani {
            oyuncuSkorları.birinciOyuncuSkoru += 1
            lblSetSonucu.text = "\(suankiSet). Seti 1.Oyuncu Kazandı..."
            suankiSet += 1
            lblOyuncuSkor1.text = String(oyuncuSkorları.birinciOyuncuSkoru)
        }else if oyuncuPuanları.ikinciOyuncuPuani > oyuncuPuanları.birinciOyuncuPuani {
            oyuncuSkorları.ikinciOyuncuSkoru += 1
            lblSetSonucu.text = "\(suankiSet). Seti 2.Oyuncu Kazandı..."
            suankiSet += 1
            lblOyuncuSkor2.text = String(oyuncuSkorları.ikinciOyuncuSkoru)
            
        }else {
            // Oyun berabere kalmış demektir.
            lblSetSonucu.text = "\(suankiSet). Set Beraber kalmıştır..."
        }
          
        }
        
    }
    func zarDegerleriniUret(){
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5 ) {

            let zar1 = arc4random_uniform(6)+1
            let zar2 = arc4random_uniform(6)+1
            
            self.İmgZar1.image = UIImage(named: String(zar1))
            self.İmgZar2.image = UIImage(named: String(zar2))
        
            self.setSonucu(zar1: Int(zar1), zar2: Int(zar2))
        
        
        
            if self.suankiSet > self.maxSetSayisi {
                if self.oyuncuSkorları.birinciOyuncuSkoru > self.oyuncuSkorları.ikinciOyuncuSkoru {
                    self.lblSetSonucu.text = "1.Oyuncu Kazandı..."
            }
                else {
                    self.lblSetSonucu.text = "2.Oyuncu Kazandı..."
        }
        }
}
        lblSetSonucu.text = "\(oyuncuSıra). Oyuncu Zar atıyor."
        İmgZar1.image = UIImage.init(named: "bilinmeyenZar")
        İmgZar2.image = UIImage.init(named: "bilinmeyenZar")

        
        
}

}
