//
//  MovieTableViewCell.swift
//  ReviewProject
//
//  Created by Reddy, P on 26/05/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var summary: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension MovieTableViewCell{
    func configureCell(data: WelcomeElement){
        //movieImg.image = UIImage(named: data.image.medium)
        movieName.text = data.name
        summary.text = data.summary
    }
    
}
