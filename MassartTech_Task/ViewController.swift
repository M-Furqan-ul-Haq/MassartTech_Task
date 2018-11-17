//
//  ViewController.swift
//  MassartTech_Task
//
//  Created by FURQAN on 11/17/18.
//  Copyright © 2018 FURQAN. All rights reserved.
//

import UIKit

struct jsonData: Decodable {
    let userId:Int
    let id:Int
    let title:String
    let body:String
}
var myindex = 0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataArray = [jsonData]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromApi()
    }
    
    func getDataFromApi(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard let data = data else {return}
            
            do{
                self.dataArray = try JSONDecoder().decode([jsonData].self, from: data)
                
                for mainArray in self.dataArray{
                    print(mainArray.id," : ",mainArray.title)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                
            }catch let jsonErr{
                print("Error Json Serialization",jsonErr)
            }
            
            }.resume()
    }
    
    // Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArray.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        if indexPath.row == 0 {
            cell.cell_id.text = "U Id"
            cell.cell_label.text = "                            Title"
        }else{
            cell.cell_id.text = "\(dataArray[indexPath.row-1].userId)"
            cell.cell_label.text = "\(dataArray[indexPath.row-1].title)"
        }
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myindex = indexPath.row
        
        if myindex == 0{
            // Do Nothing
        }else if myindex == 3{
            // Show Alert
            let alert = UIAlertController(title: "Warning", message: "Post is Locked. Please pay to unlock.", preferredStyle: .alert)
            let action = UIAlertAction (title: "OK", style: .default) { (UIAlertAction) in
            }
            alert.addAction(action)
            present ( alert ,  animated : true , completion : nil )
        }else{
            let detail:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
            detail.postId = "\(self.dataArray[indexPath.row].id)"
            detail.userId = "\(self.dataArray[indexPath.row].userId)"
            detail.titleLbl = "\(self.dataArray[indexPath.row].title)"
            detail.body = "\(self.dataArray[indexPath.row].body)"
            self.navigationController?.pushViewController(detail, animated: true)
            //performSegue(withIdentifier: "segue", sender: self)
        }
        
    }

    
}

