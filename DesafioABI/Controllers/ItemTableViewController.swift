//
//  ItemTableViewController.swift
//  DesafioABI
//
//  Created by Bruno on 26/11/20.
//  Copyright © 2020 Bruno. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // Função onde criei um item la na ItemViewController que reconhece meus itens e leva a informação que eu preciso desta controller pra la
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let itemViewController = segue.destination as? ItemViewController,
            let row = tableView.indexPathForSelectedRow?.row {
            
            let item = items[row]
            itemViewController.item = item
        }
    }
    

    // Onde os itens são de fato carregados para serem exibidos
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadItem.loadItems(onComplete: { (items) in
            
            self.items = items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
                        
        }) { (error) in
            print(error)
        }
    }

    // MARK: - Table view data source
    
    //Usar o count dos itens trazidos da API, para que não seja exibido nada a mais do que o necessário para exibição dos itens ta TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    // Onde fica o carregamento da minha celula personalizada com os parametros definidos por mim para exibição
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
            
        }
        
        let item = items[indexPath.row]
        // Minha célula personalizada é carregada na linha seguinte, todas as configurações já foram feitas em seu próprio arquivom então aqui é só chama-la.
        cell.configure(with: item)
        
        // A imagem é um link que a contém assim como o próprio JSON da API então para exibi-la fiz praticamente o mesmo procedimento,
        // porém percorrendo os items já listados somente na parte onde o caminho para a imagem estava alocado
        // Feito isso, o data da imagem foi "retirado" e passado para a variável image onde é possível defini-la como uma UIImage e assim exibi-la na célula!
        if let imageURL = URL(string: items[indexPath.row].imagem) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.productIMG.image = image
                    }
                }
            }
        }
        return cell
    }
}



 
