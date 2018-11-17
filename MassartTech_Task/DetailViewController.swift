//
//  DetailViewController.swift
//  MassartTech_Task
//
//  Created by FURQAN on 11/17/18.
//  Copyright © 2018 FURQAN. All rights reserved.
//
import UIKit
struct jsonCommentData: Decodable {
    let Body:String
    let Email:String
    let Id:Int
    let Name:String
    let PostID:Int
}

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var commentDataArray = [jsonCommentData]()
    @IBOutlet weak var postIdLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var postId = " "
    var userId = " "
    var titleLbl = " "
    var body = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Post Data"
        getCommentDataFromApi(postId: postId)
        postIdLabel.text = postId
        userIdLabel.text = userId
        titleLabel.text = titleLbl
        bodyLabel.text = body
        
    }
    
    func getCommentDataFromApi(postId:String){
//        let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=2")
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//
//            guard let data = data else {return}
//
//            do{
//                self.commentDataArray = try JSONDecoder().decode([jsonCommentData].self, from: data)
//
//                for mainArray in self.commentDataArray{
//                    print("PostId:\(mainArray.PostID)")
//                    print("UserId:\(mainArray.Id)")
//                    print("Name:\(mainArray.Name)")
//                    print("Email:\(mainArray.Email)")
//                    print("Body:\(mainArray.Body)")
//                    print(" - - - - - -")
////                    DispatchQueue.main.async {
////                        self.tableView.reloadData()
////                    }
//                }
//
//            }catch let jsonErr{
//                print("Error Json Serialization",jsonErr)
//            }
//
//            }.resume()

        
        
        let headers = [
            "cache-control": "no-cache",
            "postman-token": "439ae9f1-9109-30d3-9560-aadc505d483a"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(self.postId)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse)
                guard let data = data else{return}

                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    print(json)
                    
                }catch{
                    print("Error")
                }
            }
        })

        dataTask.resume()

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCellComments = tableView.dequeueReusableCell(withIdentifier: "cell2") as! TableViewCellComments

        if indexPath.row >= 0 {
               cell.commentPostId.text = "\(self.postId)"
        cell.commentUserId.text = "70"
        cell.commentName.text = "Furqan"
        cell.commentEmail.text = "mfurqanulhaq1997@gmail.com"
        cell.commentLabel.text = "comment"
        }else{
            
        }
        return cell
    }
    
}
