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
        let actorsBarButton = UIBarButtonItem(title: "Actores", style: .plain, target: self, action: #selector(actorsPressed))
        navigationItem.setRightBarButton(actorsBarButton, animated: false)
    }
    
    @objc private func cancelPressed()
    {
        dismiss(animated: true, completion: nil)
    }
    @objc private func actorsPressed()
    {
        let mySerie = series[indexCurrentSeries]
        let repartoVC = RepartoViewController(actors: mySerie.actores)
        navigationController?.pushViewController(repartoVC, animated: true)
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
    let peter = Actor(name: "PeterLaAnguila", avatarImage: "peter")
    let loco = Actor(name: "loco", avatarImage: "https://api.adorable.io/avatars/400/80197d80116b41c83618598cd8b7fc47.png")
    let lokillo = Actor(name: "lokillo", avatarImage: "lokk")
    let trogloditas = Actor(name: "trogloditas", avatarImage: "https://api.adorable.io/avatars/400/80197d80116b41c83618598cd8b7fc47.png")
    let breakingBad = Serie(name: "Breaking Bad" , imageFile:"BRBA", summary: "Better Call Saul es una serie de televisión estadounidense creada por Vince Gilligan y Peter Gould. Se trata de una precuela de Breaking Bad. La acción se ubica en el año 2002 en torno al abogado James Morgan Jimmy McGill (interpretado por Bob Odenkirk), seis años antes de su aparición en Breaking Bad como Saul Goodman. A pesar de ser una precuela también se muestra brevemente cual fue ", seasons: 5, actores:  [peter,loco,lokillo])
    
    let betterCallSaul = Serie(name: "Better Call Saul" , imageFile:"loco", summary: "Better Call Saul es una serie de televisión estadounidense creada por Vince Gilligan y Peter Gould. Se trata de una precuela de Breaking Bad. La acción se ubica en el año 2002 en torno al abogado James Morgan Jimmy McGill (interpretado por Bob Odenkirk), seis años antes de su aparición en Breaking Bad como Saul Goodman. A pesar de ser una precuela también se muestra brevemente cual fue el destino de Saul tras los hechos de la serie original.1​2​ En Estados Unidos, la serie se estrenó el 8 de febrero de 2015 y el primer episodio fue visto por 6.9 millones de espectadores, convirtiéndose en el estreno más visto en la historia de la televisión por cable en ese país.", seasons: 9, actores: [peter,loco])
    let kikos = Serie(name: "Kikos" , imageFile:"troglo", summary: "MisterCorn nos mete mucha chicha", seasons: 12, actores: [] )
    let keloke = Serie(name: "keloke", imageFile:"lokk", summary: "basuuuuuuuura", seasons: 212, actores: [peter,lokillo,trogloditas] )
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

