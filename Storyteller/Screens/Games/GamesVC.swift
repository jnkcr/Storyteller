//
//  GamesVC.swift
//  Storyteller
//
//  Created by Jan Kučera on 11.03.2022.
//

import UIKit

class GamesVC: UIViewController {
    
    let gamesVM: GamesVM = GamesVM()
    
    let tableView: UITableView = {
        let tv: UITableView = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.estimatedRowHeight = 80
        tv.cellLayoutMarginsFollowReadableWidth = true
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .systemIndigo
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .never
        title = "Games"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(GamesCellVC.self, forCellReuseIdentifier: "gamesCell")
        // Add subviews
        view.addSubview(tableView)
        // UI Config
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}

extension GamesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gamesVM.gamesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "gamesCell", for: indexPath) as? GamesCellVC else { fatalError("Unable to create games cell") }
        let game = gamesVM.getGame(for: indexPath.row)
        cell.gameImageView.image = UIImage(named: game.imageName)!
        cell.gameTitle.text = game.name
        cell.gameSubtitle.text = String(game.year)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Games", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "gameDetail") as? GamesDetailVC else { return }
        detailVC.game = gamesVM.getGame(for: indexPath.row)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
