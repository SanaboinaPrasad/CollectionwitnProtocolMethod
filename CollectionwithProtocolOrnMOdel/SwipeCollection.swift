//
//  SwipeCollection.swift
//  SwipeCollectioView
//
//  Created by Sriram Prasad on 02/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//


import UIKit
class SWipeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    let cellId = "Cell"

    private let nextButton :UIButton = {
        let nxtBTn = UIButton(type: .system)
        nxtBTn.backgroundColor = .clear
        nxtBTn.translatesAutoresizingMaskIntoConstraints = false
        nxtBTn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        nxtBTn.setTitle("Next", for: .normal)
        nxtBTn.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return nxtBTn
    }()
 
    private let prevButton :UIButton = {
        let Btn =  UIButton(type: .system)
    Btn.backgroundColor = .clear
    Btn.translatesAutoresizingMaskIntoConstraints = false
    Btn.setTitle("Prev", for: .normal)
    Btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    Btn.setTitleColor(.red, for: .normal)
    Btn.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return Btn
    }()
    
     lazy var pageControl:UIPageControl = {
        let pc = UIPageControl()
    pc.currentPage  = 0
    pc.currentPageIndicatorTintColor = .blue
    pc.numberOfPages = pages.count
    pc.pageIndicatorTintColor = .red
    return pc
    }()
    
    let pages = [
        Page(imageName: "s2", headertext: "let meet bro have a nice time on Monday",bodyText:" override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> 1"),
        Page(imageName: "s1", headertext: "let meet bro have a nice time on Tuesday",bodyText:" override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> 2 "),
        Page(imageName: "s3", headertext: "let meet bro have a nice time on Thursday",bodyText:" override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> 3 "),
        Page(imageName: "s1", headertext: "let meet bro have a nice timeon saturday",bodyText:" override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> 4 "),
        Page(imageName: "s4", headertext: "let meet bro have a nice time Sunday",bodyText:" override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> 5 "),
        Page(imageName: "s2", headertext: "let meet bro have a nice time on Monday",bodyText:" override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> 1"),
        Page(imageName: "s1", headertext: "let meet bro have a nice time on Tuesday",bodyText:" override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> 2 "),
        Page(imageName: "s3", headertext: "let meet bro have a nice time on Thursday",bodyText:" override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> 3 "),
        Page(imageName: "s1", headertext: "let meet bro have a nice timeon saturday",bodyText:" override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> 4 "),
        Page(imageName: "s4", headertext: "let meet bro have a nice time Sunday",bodyText:" override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> 5 "),
        

    ]
    
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        placeBottonControls()
        //        collectionView.backgroundColor = .green
        collectionView.isPagingEnabled = true
        collectionView.register(SwipeCell.self, forCellWithReuseIdentifier: cellId)
        
    }
  
   
    fileprivate func placeBottonControls(){
        view.addSubview(nextButton)
        view.addSubview(prevButton)
        
        
        let greenView = UIView()
            greenView.backgroundColor = UIColor(displayP3Red: 232/255, green: 68/255, blue: 133/255, alpha:1)
       
        let bottomControlsStackView = UIStackView(arrangedSubviews: [prevButton,pageControl,nextButton])
            bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
            bottomControlsStackView.axis = .horizontal
            bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor),
                bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            
            ])
        
    }
    
    
    @objc func handleNext(){
        let nextIndex = min(pageControl.currentPage + 1,pages.count - 1)
        let indexpath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
    }
    
    
   @objc private func handlePrev(){

    let preindexpath = max(pageControl.currentPage - 1, 0)
    let indexpath = IndexPath(item: preindexpath, section: 0)
    pageControl.currentPage = preindexpath
    collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
    }

}











