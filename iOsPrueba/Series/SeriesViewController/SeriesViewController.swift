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
        loadAllSeries()
        refreshUIwithSerie(serie: series[indexCurrentSeries])
        mainImageView.layer.cornerRadius = 50.0
        mainImageView.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func refreshUIwithSerie( serie : Serie)
    {
        titleLabel.text = serie.name
        mainImageView.image = UIImage(named: serie.imageFile)
        sumaryTextView.text = serie.summary
        
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
    
    private func loadAllSeries()
{
    let breakingBad = Serie(name: "Breaking Bad" , imageFile:"BRBA", summary: "El profesor bacterio llega y te mata", seasons: 5 )
     let betterCallSaul = Serie(name: "Better Call Saul" , imageFile:"", summary: "Looco", seasons: 9 )
     let kikos = Serie(name: "Kikos" , imageFile:"", summary: "MisterCorn nos mete mucha chicha", seasons: 12 )
    let keloke = Serie(name: "keloke", imageFile:"", summary: "basuuuuuuuura", seasons: 212 )
    
    series.append(breakingBad)
    series.append(betterCallSaul)
    series.append(kikos)
    series.append(keloke)
    }
    @IBAction func eventoClickNext()  {
       indexCurrentSeries = (indexCurrentSeries + 1 ) % series.count
            refreshUIwithSerie(serie: series[indexCurrentSeries])
      
    }
    @IBAction func eventoClickBack()  {
        indexCurrentSeries = ((indexCurrentSeries + series.count - 1) % series.count)
        refreshUIwithSerie(serie: series[indexCurrentSeries])
        
    }
}

