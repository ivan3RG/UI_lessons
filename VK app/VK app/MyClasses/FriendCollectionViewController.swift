//
//  FriendCollectionViewController.swift
//  VK app
//
//  Created by Иван Кочетков on 31.08.2020.
//  Copyright © 2020 Ivan Kochetkov. All rights reserved.
//

import UIKit


class FriendCollectionViewController: UICollectionViewController {

    var friendWatch = UserAcc()
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCollectionViewCell", for: indexPath) as! FriendCollectionViewCell
        
        cell.photoLabel.text = ("\(friendWatch.friends[indexPath.row]) аватар")
        cell.imageFriend.image = UIImage(named: friendWatch.images[indexPath.row])
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}
