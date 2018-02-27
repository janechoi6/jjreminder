//
//  JJPMainViewController.swift
//  JJReminder
//
//  Created by Naver on 2018. 2. 17..
//  Copyright © 2018년 jjproject. All rights reserved.
//

import UIKit

class JJPMainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var collectionViewCellSize = CGSize.zero
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        let nib = UINib(nibName: JJPItemCollectionViewCell.nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: JJPItemCollectionViewCell.reuseIdentifier)
        
        let length = CGFloat((ScreenUtils.screenWidth - totalSpacing) / CGFloat(numberOfItemsPerRow))
        collectionViewCellSize =  CGSize(width: length, height: length)
    }
    
    @objc func showDetails() {
        
        let vc = JJPDetailsViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        present(navigationController, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension JJPMainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionViewCellSize
    }
}

extension JJPMainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JJPItemCollectionViewCell.reuseIdentifier, for: indexPath) as! JJPItemCollectionViewCell
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension JJPMainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        perform(#selector(showDetails), with: nil, afterDelay: 2)
        perform(#selector(showDetails))
    }
    

}
