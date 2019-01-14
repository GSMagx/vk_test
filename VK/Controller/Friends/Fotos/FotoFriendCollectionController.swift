//
//  FriendsFotoCollection.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 12/01/2019.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit


class FotoFriendCollectionController: UICollectionViewController {
    
    var fotoDelegate: [String] = []
    var foto : [String] = []
    var text = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        foto = fotoDelegate

    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foto.count - 1
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FotoCell", for: indexPath) as! FotoCollectionCell
            
        let foto = fotoDelegate[indexPath.row]
        cell.allFoto.image = UIImage(named: foto)
//        cell.fotoLabelName.text = text
        
        return cell
    }


}




