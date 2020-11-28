//
//  ItemTableViewCell.swift
//  DesafioABI
//
//  Created by Bruno on 27/11/20.
//  Copyright © 2020 Bruno. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productIMG: UIImageView!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //Função que popula com os dados de Item minha célula, de forma personalizada e fazendo sentido com tudo o que precisa ser exibido por la
    func configure(with item: Item) {
        productNameLabel.text = item.produto
        productDescription.text = item.descricao
        productPrice.text = item.priceFormatted
        //if onde é validado o desconto no produto, e se sim já faz a mudança do preço para verde
        if (item.desconto) != false {
        productPrice.textColor =  UIColor .green
        //print(item.desconto)
        }
        else {
            return()
        }
    }
}
