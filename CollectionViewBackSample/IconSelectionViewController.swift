//
//  IconSelectionViewController.swift
//  CollectionViewBackSample
//
//  Created by Hina on 2024/02/12.
//

import UIKit

class IconSelectionViewController: UIViewController,UICollectionViewDelegate {
    var selectedIcon: String?

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        configCollectionView()
    }
    private func registerCells() {
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }

    private func configCollectionView() {

        collectionView.delegate = self
        collectionView.dataSource = self

        // セルの大きさを変更する
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30 // 行間の余白
        layout.sectionInset = UIEdgeInsets(top: 30, left: 5, bottom: 30, right: 5)

        // サイズ
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 20) / 2 // 画面サイズ-40
        let height = width
        layout.itemSize = CGSize(width: width, height: height)

        collectionView.collectionViewLayout = layout
    }
}

extension IconSelectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Common().iconList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setIcon(imageString: Common().iconList[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selectedIcon: String
        selectedIcon = Common().iconList[indexPath.row]
        let preVC = self.presentingViewController as! ViewController
        preVC.icon = self.selectedIcon ?? "Image1"  //ここで値渡し
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
