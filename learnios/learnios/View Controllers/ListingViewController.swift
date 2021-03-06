//  ListingViewController.swift
//  learnios
//
//  Created by Guanming Qiao on 3/14/18.
//

import UIKit
import AVFoundation

class ListingViewController: UICollectionViewController {
    let segueIdentifer = "listingSegue"
    var tableData: [ListingModel] = []
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        let background = UIImage(named: "Pattern")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        tableData = ListingModel.allListings()
        collectionView?.backgroundColor = .clear
        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifer {
            guard let detailViewController = segue.destination as? MyListingDetailViewController else { return }
            guard let cell = sender as? ListingViewCell else { return }
            guard let indexPath = self.collectionView?.indexPath(for: cell) else { return }
            let selectedProfile = tableData[indexPath.item]
            detailViewController.listing = selectedProfile
        }
    }
    
    @IBAction func cartButtonTapped(_ sender: Any) {
        let cartVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "cartVC") as! UINavigationController
        present(cartVC, animated: true, completion: nil)
    }
    
}

extension ListingViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListingCell", for: indexPath as IndexPath) as! ListingViewCell
        cell.listing = tableData[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
    
}

extension ListingViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        
        return tableData[indexPath.item].image.size.height
    }
}

