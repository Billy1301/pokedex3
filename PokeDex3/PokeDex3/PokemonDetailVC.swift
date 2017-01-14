//
//  PokemonDetailVC.swift
//  PokeDex3
//
//  Created by Billy on 1/13/17.
//  Copyright © 2017 Billy. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
    }

}
