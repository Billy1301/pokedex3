//
//  PokemonDetailVC.swift
//  PokeDex3
//
//  Created by Billy on 1/13/17.
//  Copyright © 2017 Billy. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexIDLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAtkLbl: UILabel!
    @IBOutlet weak var nextEvoLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetail {
            self.updateUI()
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    
    func updateUI() {
        baseAtkLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        typeLbl.text = pokemon.type
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        pokedexIDLbl.text = "\(pokemon.pokedexId)"
        descriptionLbl.text = pokemon.descriptions
        
        if pokemon.nextEvolutionId == "" {
            nextEvoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
        } else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvoLevel)"
            nextEvoLbl.text = str
        }
    }
}
