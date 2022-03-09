//
//  StoryMainVC.swift
//  Storyteller
//
//  Created by Jan Kučera on 04.03.2022.
//

import UIKit
import FirebaseAuth

class StoryMainVC: UIViewController {
    
    private var nameAtIndex: String?
    private let storyViewModel: StoryMainVM = StoryMainVM()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stories"
        // Table delegate
        tableView.dataSource = self
        tableView.delegate = self
        // Add authentification listener
        Auth.auth().addStateDidChangeListener { [weak self] authentication, user in
            if user != nil {
                self?.storyViewModel.authUser = user
            } else {
                self?.segueToWelcomeScreen()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? UserProfileVC {
            dest.authUser = storyViewModel.authUser
        }
        if let dest = segue.destination as? StoryDetailVC {
            guard let n = nameAtIndex else { return }
            dest.name = n
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
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? StoryMainTableCell else { fatalError() }
        cell.iconImage.image = UIImage(systemName: RandomStuffGenerator.generateIcon())
        cell.titleLabel.text = RandomStuffGenerator.generateName()
        return cell
    }
    
}

extension StoryMainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? StoryMainTableCell else { return }
        nameAtIndex = cell.titleLabel.text
        performSegue(withIdentifier: "toStoryDetail", sender: nil)
    }
    
}
