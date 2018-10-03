//
//  LogInViewController.swift
//  iOsPrueba
//
//  Created by JOAQUIN DIAZ RAMIREZ on 3/10/18.
//  Copyright © 2018 JOAQUIN DIAZ RAMIREZ. All rights reserved.
//

import UIKit


class LogInViewController: UIViewController {
    @IBOutlet var txtUser: UITextField?
    @IBOutlet var txtPass: UITextField?
    @IBOutlet var btnLogin: UIButton?
    
    let alert = UIAlertController(title: "¡Te has logeado!", message: "Gracias!", preferredStyle: UIAlertControllerStyle.alert)
    let alert1 = UIAlertController(title: "¡NO te has logeado!", message: "Introduce datos!", preferredStyle: UIAlertControllerStyle.alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        alert1.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func eventoClickLogin()  {
    
        if (txtPass?.text == "keloke"  && txtUser?.text == "joako")
        {
            showSeriesVC()
            let user = txtUser?.text
            let pass = txtPass?.text
            print(user! + "" + pass!)
            

        }
        else
        {
            
            self.present(alert1, animated: true, completion: nil)
            let user = txtUser?.text
            let pass = txtPass?.text
            print(user! + "" + pass!)
            showSeriesVC()
        }
        
        
        
    
        
    }
    
    private func showSeriesVC()
    {
        let seriesVC = SeriesViewController()
        let navigationController = UINavigationController(rootViewController: seriesVC)
        navigationController.modalTransitionStyle = .flipHorizontal
        present(navigationController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
