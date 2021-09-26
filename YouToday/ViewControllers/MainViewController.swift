//
//  ViewController.swift
//  YouToday
//
//  Created by Игорь Сысоев on 26.09.2021.
//

import UIKit

class MainViewController: UIViewController {
    private var heroURL = "https://www.superheroapi.com/api.php/4504394589582466/\(Int.random(in: 1...731))"
    
    //MARK: - IBOutlet
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroFullName: UILabel!
    @IBOutlet weak var heroRase: UILabel!
    @IBOutlet weak var heroAligment: UILabel!
    
    //MARK: - IBActon
    @IBAction func youToday(_ sender: UIButton) {
        getHero()
        
        sender.setTitle("Wow!", for: .normal)
    }
}

    //MARK: - currentHero
extension MainViewController {
    func getHero() {
        guard let url = URL(string: heroURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No localiz description ")
                return
            }
            
            do {
                let hero = try JSONDecoder().decode(Hero.self, from: data)
                self.currentHeroInfo(hero: hero)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func currentHeroInfo(hero: Hero) {
        DispatchQueue.main.async {
            guard let url = URL(string: hero.image.url ) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            self.heroImageView.image = UIImage(data: imageData)
            
            self.heroName.text = "Name: " + hero.name
            self.heroFullName.text = "Gender: " +  hero.appearance.gender
            self.heroRase.text = "Rase: " + hero.appearance.race
            self.heroAligment.text = "Alignment: " + hero.biography.alignment
        }
    }
}

