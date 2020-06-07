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
    
    var valorDividaTotal = 0.0
    
    var Capital = 0.0
    var periodo = 0.0
    var JurosMes = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valorField.delegate = self
        jurosField.delegate = self
        periodoField.delegate = self
        
    
     
    }
    
    @IBAction func btSimular(_ sender: Any) {
        
        print(valorField.text!)
        print(jurosField.text!)
        print(periodoField.text!)
        
        Capital = NSString(string: valorField.text!).doubleValue
        periodo = NSString(string: periodoField.text!).doubleValue
        JurosMes = NSString(string: jurosField.text!).doubleValue
        
        valorDividaTotal = descMontante(Capital, JurosMes, periodo)
        
    }
    
    func descMontante(_ capital: Double, _ jurosMes: Double, _ periodoM: Double) -> Double {
        
        let Capital = capital
        var JurosMes = jurosMes
        print(JurosMes)
        JurosMes = JurosMes / 100.0
        let periodo = periodoM
        
        var Temp = pow(1 + JurosMes, periodo)
        Temp = (Temp - 1) / (Temp * JurosMes)
        Temp = Capital / Temp
        

        let Valorpgo = Temp * periodo

        let valorpago = Valorpgo

        return valorpago
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ResulJurosViewController
       
        vc.valorDivida = valorField.text!
        
        
        
        vc.jurosPorcen = jurosField.text!
        vc.periodoMes = periodoField.text!

        vc.valorTotalDivida = valorDividaTotal
        vc.jurosPago = valorDividaTotal - Capital
        vc.parcelas = valorDividaTotal / periodo

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        valorField.resignFirstResponder()
        jurosField.resignFirstResponder()
        periodoField.resignFirstResponder()
    }
    
}

class ResulJurosViewController: UIViewController {
    
    @IBOutlet weak var labelValorDivida: UILabel!
    @IBOutlet weak var labelJurosMes: UILabel!
    @IBOutlet weak var labelMes: UILabel!
    
    @IBOutlet weak var resulParcela: UILabel!
    @IBOutlet weak var resulTotalJuros: UILabel!
    @IBOutlet weak var resulTotalPago: UILabel!
    
    var valorDivida = ""
    var jurosPorcen = ""
    var periodoMes = ""
    
    var valorTotalDivida = 0.0
    var jurosPago = 0.0
    var parcelas = 0.0
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current

        // We'll force unwrap with the !, if you've got defined data you may need more error checking
        
        
//        let myNumber = NSNumber(value: valorTotalDivida)
//        let juros = NSNumber(value: jurosPago)
//        let parce = NSNumber(value: parcelas)
//
        
        let mostraValorDivT = currencyFormatter.string(from: NSNumber(value: valorTotalDivida))!
        let mostraValorJuropgo = currencyFormatter.string(from: NSNumber(value: jurosPago))!
        let mostraValorparcela = currencyFormatter.string(from: NSNumber(value: parcelas))!
        
//        let mostraValorDivT = currencyFormatter.string(from: NSNumber(value: valorTotalDivida))!
//        let mostraValorJuropgo = currencyFormatter.string(from: NSNumber(value: jurosPago))!
//        let mostraValorparcela = currencyFormatter.string(from: NSNumber(value: parcelas))!
    
        labelValorDivida.text = valorDivida
        labelJurosMes.text = jurosPorcen + "%"
        labelMes.text = periodoMes
        
        resulParcela.text = mostraValorparcela
        resulTotalJuros.text = mostraValorJuropgo
        resulTotalPago.text = mostraValorDivT
        
    }
    
    
    
}

extension String {
    var doubleValue: Double {
        return Double(self) ?? 0
    }
}

extension JurosViewController: UITextFieldDelegate {
    
    
}
