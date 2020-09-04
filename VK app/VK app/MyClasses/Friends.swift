//
//  Friends.swift
//  VK app
//
//  Created by Иван Кочетков on 30.08.2020.
//  Copyright © 2020 Ivan Kochetkov. All rights reserved.
//

import UIKit
//Yes, the structure looks more logical, but the deadlines have already failed...twice


class Friends: UITableViewController {
    
    let friends = UserAcc(friends: ["Василий Пупкин", "Иван Иванов", "Татьяна Мухина"], images: ["image1", "image2", "image3"])
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath)
        let friend = friends.friends[indexPath.row]
        cell.textLabel?.text = friend
        cell.contentView.backgroundColor = .blue
        cell.textLabel?.textColor = .white
        cell.imageView?.image = UIImage(named: friends.images[indexPath.row])
        cell.imageView?.frame = CGRect(x: 0, y: 0, width: 100, height: 100) //focus failed (I wanted to set the size of thumbnails)
        return cell
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard segue.identifier == "showFriend" else { return }
    guard let destination = segue.destination as? FriendCollectionViewController else { return }
        destination.friendWatch.friends.append(friends.friends[tableView.indexPathForSelectedRow!.row])
        destination.friendWatch.images.append(friends.images[tableView.indexPathForSelectedRow!.row])
        
    }
        
    }


