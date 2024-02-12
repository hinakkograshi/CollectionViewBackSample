//
//  ViewController.swift
//  CollectionViewBackSample
//
//  Created by Hina on 2024/02/12.
//

import UIKit

class ViewController: UIViewController {
    var icon: String?

    @IBOutlet weak var iconImage: UIImageView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(icon)
        iconImage.image = UIImage(named: icon ?? "Image1")
    }
    override func viewDidLoad() {

    }



    @IBAction func didTapSelectionIcon(_ sender: Any) {
        let IconVC = UIStoryboard(name: "IconSelection", bundle: nil).instantiateViewController(withIdentifier: "IconSelection") as! IconSelectionViewController

        IconVC.modalPresentationStyle = .formSheet
            present(IconVC, animated: true, completion: nil)
    }
    
}

