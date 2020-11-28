//
//  ItemViewController.swift
//  DesafioABI
//
//  Created by Bruno on 27/11/20.
//  Copyright © 2020 Bruno. All rights reserved.
//

import UIKit

final class ItemViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    // MARK: - Properties
    var item: Item?
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = item {
        
            productName.text = item.produto
            productDesc.text = item.descricao
            productPrice.text = item.priceFormatted
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


