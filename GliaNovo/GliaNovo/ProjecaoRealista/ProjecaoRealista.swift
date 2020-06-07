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
    
    var MostrarVAp = ""
    var MostrarVAt = ""
    var MostrarFBr = ""
    var MostrarFLi = ""
    var MostrarLu = ""
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var ValorInicial: UITextField!
    @IBOutlet weak var ValorMensal: UITextField!
    @IBOutlet weak var Taxa: UITextField!
    @IBOutlet weak var Periodo: UITextField!
    @IBOutlet weak var Inflacao: UITextField!
    @IBOutlet weak var IR1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ValorInicial.delegate = self
        ValorMensal.delegate = self
        Taxa.delegate = self
        Periodo.delegate = self
        Inflacao.delegate = self
        IR1.delegate = self
        
    }
     
    @IBAction func Simular(_ sender: Any) {
        
    Resultado()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        ValorInicial.resignFirstResponder()
        ValorMensal.resignFirstResponder()
        Taxa.resignFirstResponder()
        Periodo.resignFirstResponder()
        Inflacao.resignFirstResponder()
        IR1.resignFirstResponder()
    }
    
    func Resultado() {

        ipca =  Inflacao.text!.myDoubleConverter
        
        ipca = ipca / 100.0
        ipca = ipca / 12

        Rend = Taxa.text!.myDoubleConverter
        Rend = Rend / 100.0
        Rend = Rend / 12

        IR = IR1.text!.myDoubleConverter
        IR = IR / 100.0
        
        
        Tempo = Periodo.text!.myDoubleConverter
        PV = ValorInicial.text!.myDoubleConverter
        PMT = ValorMensal.text!.myDoubleConverter

   
        
        Dap = PV + PMT*Tempo
        Dat1 = PMT*(ipca + 1)*(pow((ipca + 1),Tempo) - 1)/ipca
        Dat2 = PV*pow((ipca + 1),Tempo)

        DAT = Dat1 + Dat2
        FB = ((1+Rend)*((pow(1+Rend,Tempo)-1)/Rend)*PMT)+(PV*pow((1+Rend),Tempo))
        FL = FB-((FB-Dap)*IR)
        Luc = FL-DAT
        Result = (Luc/DAT)*100.0
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        MostrarVAp = currencyFormatter.string(from: NSNumber(value: Dap))!
        MostrarVAt = currencyFormatter.string(from: NSNumber(value: DAT))!
        MostrarFBr = currencyFormatter.string(from: NSNumber(value: FB))!
        MostrarFLi = currencyFormatter.string(from: NSNumber(value: FL))!
        MostrarLu = currencyFormatter.string(from: NSNumber(value: Luc))!
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! ResultProjecao
        
        vc.VAp = MostrarVAp
        vc.VAt = MostrarVAt
        vc.FBr = MostrarFBr
        vc.FLi = MostrarFLi
        vc.Lu = MostrarLu
        vc.LSI = Result
    }
}

class ResultProjecao: UIViewController{
    
    var VAp = ""
    var VAt = ""
    var FBr = ""
    var FLi = ""
    var Lu = ""
    var LSI = 0.0
    
    @IBOutlet weak var ValorAportado: UILabel!
    @IBOutlet weak var ValorAtualizado: UILabel!
    @IBOutlet weak var FuturoBruto: UILabel!
    @IBOutlet weak var FuturoLiquido: UILabel!
    @IBOutlet weak var Lucro: UILabel!
    @IBOutlet weak var LucroSobreInflacao: UILabel!
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        ValorAportado.text = VAp
        ValorAtualizado.text = VAt
        FuturoBruto.text = FBr
        FuturoLiquido.text = FLi
        Lucro.text = Lu
        LucroSobreInflacao.text = String(format: "%.01f", LSI) + "%"
     }
}


extension String {
    var doubleValue: Double {
        return Double(self) ?? 0
    }
}

extension String {
var myDoubleConverter: Double {
let converter = NumberFormatter()

converter.decimalSeparator = ","
if let result = converter.number(from: self){
return result.doubleValue

} else {

converter.decimalSeparator = "."
if let result = converter.number(from: self) {
return result.doubleValue
}
}
return 0
}
}

extension RealistaViewController: UITextFieldDelegate {
    
}
