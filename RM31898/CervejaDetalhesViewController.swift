//
//  CervejaDetalhesViewController.swift
//  RM31898
//
//  Created by Admin on 10/12/17.
//  Copyright © 2017 FiapAluno. All rights reserved.
//

import UIKit
import Kingfisher


class CervejaDetalhesViewController: UIViewController {
    
    @IBOutlet weak var lblTituloNome: UILabel!
    @IBOutlet weak var lblTagLine: UILabel!
    @IBOutlet weak var lblDescricao: UILabel!
    @IBOutlet weak var lblTeorAlcoolico: UILabel!
    @IBOutlet weak var lblEscalaAmargor: UILabel!
    @IBOutlet weak var ivCerveja: UIImageView!
    
    var cerveja: Cerveja!

    override func viewDidLoad() {
        super.viewDidLoad()

        if cerveja != nil {
            lblTituloNome.text = cerveja.nome
            if(cerveja.teorAlcoolico != nil){
                lblTeorAlcoolico.text = "\(cerveja.teorAlcoolico!)"
            } else {
                lblTeorAlcoolico.text =  "Teor alcoolico nao informado"
            }
            if(cerveja.escalaAmargor != nil){
                lblEscalaAmargor.text = "\(cerveja.escalaAmargor!)"
            } else {
                lblEscalaAmargor.text = "Escala de amaragor nao informado"
            }
            
            lblDescricao.text = cerveja.descricao
            lblTagLine.text = cerveja.tagLine
            let url = URL(string: cerveja.urlImagem)!
            ivCerveja.kf.setImage(with: url)
        }
    }
}
