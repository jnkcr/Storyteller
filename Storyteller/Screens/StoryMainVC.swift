//
//  StoryMainVC.swift
//  Storyteller
//
//  Created by Jan Kučera on 04.03.2022.
//

import UIKit
import FirebaseAuth

class StoryMainVC: UIViewController {
    
    private var user: User?
    private var index: Int?
    @IBOutlet weak var tableView: UITableView!
    
    let tableData = [String](repeating: "Alena", count: 30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stories"
        // Table delegate
        tableView.dataSource = self
        tableView.delegate = self
        // Add authentification listener
        Auth.auth().addStateDidChangeListener { [weak self] authentication, user in
            if user != nil {
                self?.user = user
            } else {
                self?.segueToWelcomeScreen()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? UserProfileVC {
            dest.user = user
        }
        if let dest = segue.destination as? StoryDetailVC {
            guard let i = index else { return }
            dest.name = tableData[i]
        }
    }
    
}

// MARK: - Additional functionality

private extension StoryMainVC {
    
    func segueToWelcomeScreen() {
        performSegue(withIdentifier: "toWelcomeScreen", sender: nil)
    }
    
}

// MARK: - Tableview delegates

extension StoryMainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? StoryMainTableCell else { fatalError() }
        cell.iconImage.image = UIImage(systemName: RandomIconGenerator.generateIcon())
        cell.titleLabel.text = tableData[indexPath.row]
        return cell
    }
    
}

extension StoryMainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "toStoryDetail", sender: nil)
    }
    
}
