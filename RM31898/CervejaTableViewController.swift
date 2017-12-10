//
//  CervejaTableViewController.swift
//  RM31898
//
//  Created by Admin on 10/12/17.
//  Copyright © 2017 FiapAluno. All rights reserved.
//

import UIKit
import Kingfisher

class CervejaTableViewController: UITableViewController {
    
    var label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 22))
    var cervejas: [Cerveja] = []

    override func viewDidLoad() {

        super.viewDidLoad()
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        label.text = "Sua lista está vazia"
        label.textAlignment = .center
        label.textColor = .black
        carregarCevejas()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CervejaDetalhesViewController {
            if tableView.indexPathForSelectedRow != nil {
                vc.cerveja = cervejas[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
    
    func carregarCevejas() {
        REST.carregarCervejas { (cervejas: [Cerveja]?) in
            if let cervejas = cervejas {
                self.cervejas = cervejas
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cervejas.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cervejaCell", for: indexPath) as! CervejaTableViewCell
        let cerveja = cervejas[indexPath.row]
        cell.lblNome.text = cerveja.nome
        if(cerveja.teorAlcoolico != nil){
            cell.lblTeor.text = "Teor alcoolico: \(cerveja.teorAlcoolico!)"
        } else {
            cell.lblTeor.text = "Teor nao informado"
        }
        let url = URL(string: cerveja.urlImagem)!
        cell.ivCerveja.kf.setImage(with: url)
   
        return cell
    }

}
