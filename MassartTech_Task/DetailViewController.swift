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
    
    var commentOne = NSDictionary()
    var commentTwo = NSDictionary()
    var commentThree = NSDictionary()
    var commentFour = NSDictionary()
    var commentFive = NSDictionary()
    
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
                    let comments = json as! NSArray
                    print(comments)
                    self.commentOne = comments[0] as! NSDictionary
                    self.commentTwo = comments[1] as! NSDictionary
                    self.commentThree = comments[2] as! NSDictionary
                    self.commentFour = comments[3] as! NSDictionary
                    self.commentFive = comments[4] as! NSDictionary
                    //print((self.commentOne.value(forKey: "email"))!)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
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

        if indexPath.row == 0 {
            cell.commentPostId.text = "\(self.commentOne.value(forKey: "postId"))"
            cell.commentUserId.text = "\(self.commentOne.value(forKey: "id"))"
            cell.commentName.text = "\(self.commentOne.value(forKey: "name"))"
            cell.commentEmail.text = "\(self.commentOne.value(forKey: "email"))"
            cell.commentLabel.text = "\(self.commentOne.value(forKey: "body"))"
        }else if indexPath.row == 1{
            cell.commentPostId.text = "\(self.commentTwo.value(forKey: "postId"))"
            cell.commentUserId.text = "\(self.commentTwo.value(forKey: "id"))"
            cell.commentName.text = "\(self.commentTwo.value(forKey: "name"))"
            cell.commentEmail.text = "\(self.commentTwo.value(forKey: "email"))"
            cell.commentLabel.text = "\(self.commentTwo.value(forKey: "body"))"
        }else if indexPath.row == 2{
            cell.commentPostId.text = "\(self.commentThree.value(forKey: "postId"))"
            cell.commentUserId.text = "\(self.commentThree.value(forKey: "id"))"
            cell.commentName.text = "\(self.commentThree.value(forKey: "name"))"
            cell.commentEmail.text = "\(self.commentThree.value(forKey: "email"))"
            cell.commentLabel.text = "\(self.commentThree.value(forKey: "body"))"
        }else if indexPath.row == 3{
            cell.commentPostId.text = "\(self.commentFour.value(forKey: "postId"))"
            cell.commentUserId.text = "\(self.commentFour.value(forKey: "id"))"
            cell.commentName.text = "\(self.commentFour.value(forKey: "name"))"
            cell.commentEmail.text = "\(self.commentFour.value(forKey: "email"))"
            cell.commentLabel.text = "\(self.commentFour.value(forKey: "body"))"
        }else if indexPath.row == 4{
            cell.commentPostId.text = "\(self.commentFive.value(forKey: "postId"))"
            cell.commentUserId.text = "\(self.commentFive.value(forKey: "id"))"
            cell.commentName.text = "\(self.commentFive.value(forKey: "name"))"
            cell.commentEmail.text = "\(self.commentFive.value(forKey: "email"))"
            cell.commentLabel.text = "\(self.commentFive.value(forKey: "body"))"
        }else{}
        return cell
    }
    
}
