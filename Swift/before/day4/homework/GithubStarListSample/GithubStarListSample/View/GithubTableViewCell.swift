//
//  GithubTableViewCell.swift
//  GithubStarListSample
//
//  Created by 鈴木 大貴 on 2016/11/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit
import Kingfisher

class GithubTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static let descriptionLabelSpaces = UIEdgeInsets(top: 72, left: 12, bottom: 97, right: 12)
    static let defaultHeight: CGFloat = 187
    
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starsCountLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var watchersCountLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var descriptionLabelHeightConstraint: NSLayoutConstraint!
    
    class func height(of repository: GithubRepository, with maxSize: CGSize) -> CGFloat {
        let spaces = GithubTableViewCell.descriptionLabelSpaces
        var size = maxSize
        size.width -= (spaces.left + spaces.right)
        size.height = .greatestFiniteMagnitude
        let string = repository.description as NSString
        let height = string.boundingRect(with: size, options: [.usesLineFragmentOrigin], attributes: [NSFontAttributeName : UIFont(name: "HelveticaNeue-Light", size:14)], context: nil).size.height
        let space = spaces.top + spaces.bottom
        return max(GithubTableViewCell.defaultHeight, height + space)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.kf.cancelDownloadTask()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setImage(with url: URL) {
        iconImageView.kf.setImage(with: url)
    }
    
    func configure(with repository: GithubRepository) {
        repositoryNameLabel.text = repository.name
        userNameLabel.text = repository.owner.login
        setImage(with: repository.owner.avatarUrl)
        descriptionLabel.text = repository.description
        starsCountLabel.text = "\(repository.stargazersCount)"
        forksCountLabel.text = "\(repository.forksCount)"
        watchersCountLabel.text = "\(repository.watchersCount)"
        createdLabel.text = repository.createdAt.YYYYMMddString()
        updatedLabel.text = repository.updatedAt.YYYYMMddString()
    }
}
