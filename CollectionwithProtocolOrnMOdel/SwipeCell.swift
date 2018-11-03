//
//  SwipeCell.swift
//  CollectionViewPaginationWithbottomControls
//
//  Created by Sriram Prasad on 03/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit

class SwipeCell: UICollectionViewCell {
    
    let topCantainerView = UIView()
    var imageView = UIImageView()
    var page: Page? {
        didSet {
            guard let unWrapped = page else { return }
            imageView.image = UIImage(named: unWrapped.imageName)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.center

            let attributedText = NSMutableAttributedString(string: unWrapped.headertext , attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),NSAttributedString.Key.paragraphStyle:paragraphStyle])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(unWrapped.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray,NSAttributedString.Key.paragraphStyle:paragraphStyle]))
            descriptionTextView.attributedText = attributedText
        }
    }
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        //       textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .boldSystemFont(ofSize: 20)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView .textAlignment = .center
        
        return textView
    }()
    //    let label : UITextView = {
    //        label.text = "Lets do Something Dude"
    //        label.textAlignment = .center
    //        label.translatesAutoresizingMaskIntoConstraints = false
    //        label.isScrollEnabled = false
    //        label.isEditable = false
    //
    //        let yourAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black, .font: UIFont.boldSystemFont(ofSize: 25)]
    //        let yourOtherAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 14)]
    //        let partOne = NSMutableAttributedString(string: "This is an example ", attributes: yourAttributes)
    //        let partTwo = NSMutableAttributedString(string: "\n\n\nfor the combination of Attributed String!", attributes: yourOtherAttributes)
    //        partOne.append(partTwo)
    //        label.attributedText = partOne
    //        label.textAlignment = .center
    //
    //    }()
    //
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
        backgroundColor = .purple
    }
    
    
    
    
    func  setupViews(){
        
        //    topCantainerView.backgroundColor = .blue
        topCantainerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topCantainerView)
        topCantainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topCantainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topCantainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topCantainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        //placing imageView on ContainerView
        //    imageView.image = UIImage(named: "green")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 100
        imageView.clipsToBounds = true
        topCantainerView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints  = false
        imageView.centerYAnchor.constraint(equalTo: topCantainerView.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: topCantainerView.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: topCantainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        
        //    plaing desciption text
        
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topCantainerView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo:bottomAnchor,constant: 10 ).isActive = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
