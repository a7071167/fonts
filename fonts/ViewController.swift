//
//  ViewController.swift
//  fonts
//
//  Created by user on 14.07.2018.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    var numberOfFonts = [UIFont.Weight.bold, .heavy, .ultraLight, .light, .thin, .regular, .semibold, .medium, .black]
    var numberOfFontsText = ["bold", "heavy", "ultraLight", "light", "thin", "regular", "semibold", "medium", "black"]
    var nameFont = ""
    @IBOutlet weak var collectionOfFonts: UICollectionView!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionOfFonts.delegate = self
        collectionOfFonts.dataSource = self
        getFont()
    }
    
    // MARK: - Get name of systems font
    func getFont() {
        let sizeFont = CGFloat(20.0)
        let systemFont = UIFont.systemFont(ofSize: sizeFont)
        nameFont = systemFont.familyName
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfFonts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionOfFonts.dequeueReusableCell(withReuseIdentifier: "FontCell", for: indexPath) as! FontCollectionViewCell
        item.titleLabel.font = UIFont.systemFont(ofSize: 20.0, weight: numberOfFonts[indexPath.row])
        item.titleLabel.text = nameFont
        item.titleLabel.numberOfLines = 1
        item.titleLabel.minimumScaleFactor = 0.3
        item.titleLabel.adjustsFontSizeToFitWidth = true
        item.descriptionLabel.font = UIFont.systemFont(ofSize: 15.0, weight: numberOfFonts[indexPath.row])
        item.descriptionLabel.text = numberOfFontsText[indexPath.row]
        item.descriptionLabel.numberOfLines = 1
        item.descriptionLabel.minimumScaleFactor = 0.3
        item.descriptionLabel.adjustsFontSizeToFitWidth = true
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("user tapped at: \(indexPath.row)")
        let infoVC = storyboard?.instantiateViewController(withIdentifier: "FontInfoViewController") as? FontInfoViewController
        infoVC?.family = nameFont
        infoVC?.weight = numberOfFontsText[indexPath.row]
        infoVC?.fonts = UIFont.systemFont(ofSize: 17.0, weight: numberOfFonts[indexPath.row])
        navigationController?.pushViewController(infoVC!, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 2) / 2, height: (view.frame.height - 2) / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
