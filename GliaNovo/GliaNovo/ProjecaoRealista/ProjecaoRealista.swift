//
//  ProjecaoRealista.swift
//  GliaNovo
//
//  Created by Glauber Moreira on 05/06/20.
//  Copyright © 2020 Glauber Moreira. All rights reserved.
//

import UIKit

class RealistaViewController: UIViewController{
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var ValorInicial: UITextField!
    
    @IBOutlet weak var ValorMensal: UITextField!
    
    @IBOutlet weak var Taxa: UITextField!
    
    @IBOutlet weak var Periodo: UITextField!
    
    @IBOutlet weak var Inflacao: UITextField!
    
    @IBOutlet weak var IR: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func Simular(_ sender: Any) {
    }
    
}
