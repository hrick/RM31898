//
//  Cerveja.swift
//  RM31898
//
//  Created by Admin on 10/12/17.
//  Copyright © 2017 FiapAluno. All rights reserved.
//

import Foundation

class Cerveja {
    var urlImagem: String
    var nome: String
    var tagLine: String
    var teorAlcoolico: Double?
    var escalaAmargor: Double?
    var descricao: String?
    
    init(urlImagem: String, nome: String, tagLine: String, teorAlcoolico: Double?, escalaAmargor: Double?, descricao: String) {
        self.urlImagem = urlImagem
        self.nome = nome
        self.tagLine = tagLine
        self.teorAlcoolico = teorAlcoolico
        self.descricao = descricao
        self.escalaAmargor = escalaAmargor
    }
}
