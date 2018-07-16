//
//  FontInfoViewController.swift
//  fonts
//
//  Created by user on 14.07.2018.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class FontInfoViewController: UIViewController {

    // MARK: - Variables
    @IBOutlet weak var fontFamily: UILabel!
    @IBOutlet weak var fontWeight: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    var family = ""
    var weight = ""
    var fonts = UIFont()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontFamily.text = family
        fontWeight.text = weight
        exampleLabel.font = fonts.withSize(17.0)
        exampleLabel.textColor = UIColor.green
        let size = exampleLabel.font.pointSize
        pointsLabel.text = "Points: \(size)"
    }
}
