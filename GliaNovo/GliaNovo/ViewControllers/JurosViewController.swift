//
//  JurosViewController.swift
//  GliaNovo
//
//  Created by Glauber Moreira on 03/06/20.
//  Copyright © 2020 Glauber Moreira. All rights reserved.
//

import UIKit

class JurosViewController: UIViewController {
    
    @IBOutlet weak var valorField: UITextField!
    @IBOutlet weak var jurosField: UITextField!
    @IBOutlet weak var periodoField: UITextField!
    
    @IBOutlet weak var labelResulValortotal: UILabel!
    @IBOutlet weak var labelResulJurostotal: UILabel!
    @IBOutlet weak var labelResulParcela: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     

    }
    
    @IBAction func btSimular(_ sender: Any) {
        
        print(valorField.text!)
        print(jurosField.text!)
        print(periodoField.text!)
        
        descMontante()
        
    }
    
    func descMontante() {
        
        let Capital = Double(valorField.text!)
        var JurosMes = Double(jurosField.text!)
        print(JurosMes!)
        JurosMes! = JurosMes! / 100.0
        let periodo = Double(periodoField.text!)
        
        var Temp = pow(1 + JurosMes!, periodo!)
        Temp = (Temp - 1) / (Temp * JurosMes!)
        Temp = Capital! / Temp
        

        let Valorpgo = Temp * periodo!
        
        
        
        labelResulValortotal.text = String(format: "%.1f", Valorpgo)
        
        labelResulJurostotal.text = String(format: "%.1f",Valorpgo - Capital!)
        
        labelResulParcela.text = String(format: "%.1f",Valorpgo / periodo!)
        
        
    }
    
    
}
