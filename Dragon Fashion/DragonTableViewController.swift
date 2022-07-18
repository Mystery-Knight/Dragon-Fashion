//
//  DragonTableViewController.swift
//  Dragon Fashion
//
//  Created by DPI STUDENT 9 on 7/6/22.
//

import UIKit

class DragonTableViewController: UITableViewController {
    var dragons = [Dragon]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let dragon1 = Dragon(name: "Smaug", signatureItem: "Ill-gotten gold")
        let dragon2 = Dragon(name: "Spyro", signatureItem: "Firefly")
        let dragon3 = Dragon(name: "Trogdor", signatureItem: "Beffy arm")
        let dragon4 = Dragon(name: "Charizard", signatureItem: "Flaming tail")
        let dragon5 = Dragon(name: "Jean the Ender Dragon", signatureItem: "The End Dimension")
        let dragon6 = Dragon(name: "Betsy", signatureItem: "Wyvern Nest")
        let dragon7 = Dragon(name: "Toothless", signatureItem: "Broken Tail-Wing")
        let dragon8 = Dragon(name: "mushu", signatureItem: "Cricket")
        let dragon9 = Dragon(name: "GrimMatchstick", signatureItem: "Sky Tower")
        let dragon10 = Dragon(name: "Ouroboros", signatureItem: "Tail")
        let dragon11 = Dragon(name: "WhiteDragon", signatureItem: "Blue Eyes")
        let dragon12 = Dragon(name: "Shenron", signatureItem: "Dragon Balls")
        let dragon13 = Dragon(name: "Haku", signatureItem: "Fancy 'Stache")
        let dragon14 = Dragon(name: "Maleficent", signatureItem: "Wand")
        let dragon15 = Dragon(name: "Dragonite", signatureItem: "Draconic Fang")
        let dragon16 = Dragon(name: "Oraxusai", signatureItem: "Broken Horn")
        let dragon17 = Dragon(name: "Yharon", signatureItem: "Jungle Tyrant")
        dragons = [dragon1, dragon2, dragon3, dragon4, dragon5, dragon6, dragon7, dragon8, dragon9, dragon10, dragon11, dragon12, dragon13, dragon14, dragon15, dragon16, dragon17]

        for dragon in dragons {
            print(dragon.name)
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return dragons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let dragon = dragons[indexPath.row]
        cell.textLabel?.text = dragon.name
        cell.detailTextLabel?.text = dragon.signatureItem
        cell.imageView?.image = UIImage(named: dragon.imageName)
      

        return cell
    }
    
    @IBAction func onBattlePress(sender: UIBarButtonItem) {
        let randomDragon1 = dragons[Int.random(in: 0...(dragons.count - 1))]
        let randomDragon2 = dragons[Int.random(in: 0...(dragons.count - 1))]
        if randomDragon1.name == randomDragon2.name {
            return onBattlePress(sender: sender)
        }
        let randomDragons = [randomDragon1, randomDragon2]
        let winnerIndex = Int.random(in: 0...1)
        var loserIndex = 0
        let winner = randomDragons[winnerIndex]
        if winnerIndex == 0 {
            loserIndex = 1
        } else {
            loserIndex = 0
        }
        let loser = randomDragons[loserIndex]
        print("\(winner.name) defeated \(loser.name)")
        
        let alert = UIAlertController (title: "Battle Over", message: "\(winner.name) defeated \(loser.name)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow!
        let dvc = segue.destination as! ViewController
        dvc.dragon = dragons[indexPath.row]
    }
    

}
