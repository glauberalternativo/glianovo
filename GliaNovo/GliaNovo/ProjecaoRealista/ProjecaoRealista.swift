//
//  ProjecaoRealista.swift
//  GliaNovo
//
//  Created by Glauber Moreira on 05/06/20.
//  Copyright © 2020 Glauber Moreira. All rights reserved.
//

import UIKit

class RealistaViewController: UIViewController{
    
    var Tempo = 0.0
    var PMT = 0.0
    var PV = 0.0
    var Rend = 0.0
    var ipca = 0.0
    var IR = 0.0
    var Dap = 0.0
    var Dat1 = 0.0
    var Dat2 = 0.0
    var DAT = 0.0
    var FB = 0.0
    var FL = 0.0
    var Luc = 0.0
    var Result = 0.000
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var ValorInicial: UITextField!
    
    @IBOutlet weak var ValorMensal: UITextField!
    
    @IBOutlet weak var Taxa: UITextField!
    
    @IBOutlet weak var Periodo: UITextField!
    
    @IBOutlet weak var Inflacao: UITextField!
    
    @IBOutlet weak var IR1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func Simular(_ sender: Any) {
   
    Resultado()

           print(DAT)
           print(FB)
           print(FL)
           print(Luc)
           print(Result)
    
    }
    

    func Resultado() {

        ipca = NSString(string:Inflacao.text!).doubleValue
        ipca = ipca/100

        Rend = NSString(string:Taxa.text!).doubleValue
        Rend = Rend/100

        IR = NSString(string:IR1.text!).doubleValue
        IR = IR/100

        Tempo = NSString(string:Periodo.text!).doubleValue

        PV = NSString(string:ValorInicial.text!).doubleValue

        PMT = NSString(string:ValorMensal.text!).doubleValue


        Dap = PV + PMT*Tempo
        Dat1 = PMT*(ipca+1)*(pow((ipca+1),Tempo)-1)/ipca
        Dat2 = PV*pow((ipca+1),Tempo)

        DAT = Dat1+Dat2
        FB = ((1+Rend)*((pow(1+Rend,Tempo)-1)/Rend)*PMT)+(PV*pow((1+Rend),Tempo))
        FL = FB-((FB-Dap)*IR)
        Luc = FL-DAT
        Result = (Luc/DAT)*100
    }
    
}

extension String {
    var doubleValue: Double {
        return Double(self) ?? 0
    }
}
