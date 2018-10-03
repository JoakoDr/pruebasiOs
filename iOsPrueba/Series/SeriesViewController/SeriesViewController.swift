//
//  SeriesViewController.swift
//  iOsPrueba
//
//  Created by JOAQUIN DIAZ RAMIREZ on 3/10/18.
//  Copyright © 2018 JOAQUIN DIAZ RAMIREZ. All rights reserved.
//

import UIKit

class SeriesViewController: UIViewController {
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var mainImageView : UIImageView!
    @IBOutlet weak var sumaryTextView : UITextView!
    @IBOutlet weak var btnNext : UIButton!
    
    internal var series : [Serie] = []
    internal var indexCurrentSeries = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButtonsItems()
        mainImageView.layer.cornerRadius = 0.0
        mainImageView.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func setupBarButtonsItems()
    {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPressed))
        navigationItem.setLeftBarButton(cancelButton, animated: false)
    }
    @objc private func cancelPressed()
    {
        dismiss(animated: true, completion: nil)
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
