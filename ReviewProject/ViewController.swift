//
//  ViewController.swift
//  ReviewProject
//
//  Created by Reddy, P on 26/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    var fetchedMovie = [WelcomeElement]()
    var expandedIndexset : IndexSet = []
    //let parser = Parser()
    
    
    var selectedIndex = -1
    var isCollapse = false
    
    let reachability = try! Reachability()

    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseData()
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        
        //MARK: - Internet Connection Support
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi{
                print("Reachable via WiFi...")
            }
            else{
                print("Reachable Via Cellular...")
            }
        }
        reachability.whenUnreachable = { _ in
            print("Not Reachable")
            self.ShowAlert()
        }
        do{
            try reachability.startNotifier()
        }catch{
            print("Unable to start Notifier")
        }
    }

    func ShowAlert(){
        let alert = UIAlertController(title: "No Internet",
                                      message: "This App requires WiFi/Internet connection!",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Default action"),
                                      style: .default,
                                      handler: {_ in
                NSLog("The \"Ok\" alert occured...")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - API Fetch
    func parseData() {

        fetchedMovie = []

        let url = "http://api.tvmaze.com/shows/1/episodes"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"

        let congiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: congiguration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in

            if (error != nil) {
                print("Error")
            }
            else{
                do{
                    let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                    //print(fetchedData)
                    for eachFetchedMovie in fetchedData {
                        let eachMovie = eachFetchedMovie as! [String : Any]
                        let movieName = eachMovie["name"] as! String
                        let movieSum = eachMovie["summary"] as! String
                        //let movieImage = eachMovie["image"] as! Image
                        self.fetchedMovie.append(WelcomeElement(name: movieName,  summary: movieSum))
                    }
                    //print(self.fetchedMovie)
                    self.movieTableView.reloadData()

                }
                catch{
                    print("error 2")
                }
            }

        }
        task.resume()

    }
}



extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedMovie.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = movieTableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else{
            return UITableViewCell()
        }
        cell.configureCell(data: fetchedMovie[indexPath.row])
//        cell.movieName.text = fetchedMovie[indexPath.row].name
        cell.summary.text = fetchedMovie[indexPath.row].summary.html2String
        
        //mlet imgUrl = fetchedMovie[indexPath.row].
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndex == indexPath.row && isCollapse == true {
            return 250
        }
        else{
            return UITableView.automaticDimension
        }
        //return UITableView.automaticDimension
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieTableView.deselectRow(at: indexPath, animated: true)
        if selectedIndex == indexPath.row {
            if self.isCollapse == true{
                isCollapse = false
            } else {
                isCollapse = true
            }
        }
        selectedIndex = indexPath.row
        
        movieTableView.reloadRows(at: [indexPath], with: .automatic)
      }

}
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if self.MovieTableViewCell == indexPath.row && isCollapse == true{
//            return 243
//        }
//        else{
//            return 50
//        }
//    }


