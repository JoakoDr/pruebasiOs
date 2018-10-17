//
//  RepartoViewController.swift
//  iOsPrueba
//
//  Created by JOAQUIN DIAZ RAMIREZ on 3/10/18.
//  Copyright © 2018 JOAQUIN DIAZ RAMIREZ. All rights reserved.
//

import UIKit
import SDWebImage

class RepartoViewController: UIViewController  {
    
    @IBOutlet weak var tableView : UITableView!
    internal var actors: [Actor] = []
    
    convenience init(actors: [Actor])
    {
        self.init()
        self.actors = actors
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        registerCells()
        setupBarButtonsItems()
        // Do any additional setup after loading the view.
    }
    
    private func registerCells ()
    {
        let indentifier = "ActorsTableViewCell"
        let cellNib = UINib(nibName: indentifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "actorsCell")
        let indentifier1 = "EmptyAlertTableViewCell"
        let cellNib1 = UINib(nibName: indentifier1, bundle: nil)
        tableView.register(cellNib1, forCellReuseIdentifier: "EmptyAlert")
    }
    
    private func setupBarButtonsItems()
    {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPressed))
        navigationItem.setRightBarButton(addButton, animated: false)

    }
    
    @objc private func addPressed()
    {
        let date = Date()
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeStyle = .medium
        
    
        
        
        let actor = Actor(name: dateFormatter.string(from: date), avatarImage: "https://api.adorable.io/avatars/200/80197d80116b41c83618598cd8b7fc47.png" )
        actors.append(actor)
        
        tableView.beginUpdates()
        
        if actors.count == 1 {
            tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        }
        else {
            tableView.insertRows(at: [IndexPath(row: actors.count - 1 , section: 0)], with: .automatic)
        }
        tableView.endUpdates()
    }
    @objc private func seriesPressed()
    {
    
     //   navigationController?.pushViewController(RepartoViewController, animated: true)
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
extension RepartoViewController: UITableViewDelegate,UITableViewDataSource
    
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if actors.count>=1 {
            return actors.count
        }
         return 1
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return (actors.count>0)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            deleteActorAtIndexPath(indexPath)
        }
    }
    
    func deleteActorAtIndexPath (_ indexPath: IndexPath)
    {
        
        actors.remove(at: indexPath.row)
        tableView.beginUpdates()
        
        if actors.count == 0 {
            tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        }
        else {
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        tableView.endUpdates()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if actors.count>=1 {
            return 55.0
        }
         return 130.5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if actors.count == 0 {
            let cell: EmptyAlertTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "EmptyAlert", for: indexPath) as? EmptyAlertTableViewCell)!
            cell.delegate = self 
            cell.layer.cornerRadius = 10
            return cell
        }else{
            let actor = actors[indexPath.row]
            let cell: ActorsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "actorsCell", for: indexPath) as? ActorsTableViewCell)!
            
        cell.lblName.text = actor.name
            cell.imgAvatar.sd_setImage(with: URL(string: actor.avatarImage)!, completed: nil)
            cell.layer.cornerRadius = 10
            
            return cell
            
        }
        
        
    }
 
    
}
    extension RepartoViewController: EmptyAlertCellDelegate
    {
        func emptyStatusCellDidPressBack(cell: EmptyAlertTableViewCell)
        {
            navigationController?.popViewController(animated: true)
        }
    }


