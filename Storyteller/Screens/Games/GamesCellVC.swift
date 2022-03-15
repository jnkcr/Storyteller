//
//  GamesCellVC.swift
//  Storyteller
//
//  Created by Jan Kučera on 14.03.2022.
//

import UIKit

class GamesCellVC: UITableViewCell {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // NIB setup
        Bundle.main.loadNibNamed("GamesCell", owner: self, options: nil)
        contentView.addSubview(mainView)
        mainView.frame = self.frame
        // UI Config
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
