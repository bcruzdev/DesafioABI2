//
//  Item.swift
//  DesafioABI
//
//  Created by Bruno on 26/11/20.
//  Copyright © 2020 Bruno. All rights reserved.
//

import Foundation

// Essa classe é justamente o item retirado do JSON na API,
//por aqui é que o simples texto de la é inserido em um array de objetos efetivamente

struct ItemData: Codable
{
    var ItemList: [Item]
}

class Item:Codable
{
    var produto: String
    var descricao: String
    var preco: Double
    var desconto: Bool
    var imagem: String
    
    //Fazer o preço do produto que vem em double ser exibido em um preço formatado na visualização
    var priceFormatted: String {"R$ \(preco)"
    }
}
