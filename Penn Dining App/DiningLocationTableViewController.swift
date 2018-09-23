//
//  DiningLocationTableViewController.swift
//  Penn Dining App
//
//  Created by Marta García Ferreiro on 9/22/18.
//  Copyright © 2018 Marta García Ferreiro. All rights reserved.
//

import UIKit

class DiningLocationTableViewController: UITableViewController {
    //create an array of dining locations
    var diningLocations = [DiningLocation]()
    
    private func loadLocations() {
        
        let commons = DiningLocation(name: "1920 Commons", image: UIImage(named: "1920Commons"), openClosed: "OPEN", hours: "11-3", menuURL: "http://university-of-pennsylvania.cafebonappetit.com/cafe/1920-commons/")
        let mcclelland = DiningLocation(name: "McClelland", image: UIImage(named: "mcclelland"), openClosed: "OPEN", hours: "11-3", menuURL: "http://university-of-pennsylvania.cafebonappetit.com/cafe/mcclelland/")
        let nch = DiningLocation(name: "NCH Dining", image: UIImage(named: "nch"), openClosed: "OPEN", hours: "11-3", menuURL: "http://university-of-pennsylvania.cafebonappetit.com/cafe/new-college-house/")
        let hill = DiningLocation(name: "Hill House", image: UIImage(named: "hill"), openClosed: "OPEN", hours: "11-3", menuURL: "https://university-of-pennsylvania.cafebonappetit.com/cafe/hill-house/")
        let kceh = DiningLocation(name: "English House", image: UIImage(named: "kceh"), openClosed: "OPEN", hours: "11-3", menuURL: "http://university-of-pennsylvania.cafebonappetit.com/cafe/kings-court-english-house/")
        let hillel = DiningLocation(name: "Falk Kosher", image: UIImage(named: "hillel"), openClosed: "OPEN", hours: "11-3", menuURL: "http://university-of-pennsylvania.cafebonappetit.com/cafe/falk-dining-commons/")
        //fill the array with the dining locations
        diningLocations += [commons, mcclelland, nch, hill, kceh, hillel]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //load the dining locations
        loadLocations()
        parseJSON()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//get the values from the JSON, will not use them because I didn't have time
func parseJSON() {
    guard let url = URL(string: "http://api.pennlabs.org/dining/venues") else {return}
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
            error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return }
        do{
            //here dataResponse received from a network request
            let jsonResponse = try JSONSerialization.jsonObject(with:
                dataResponse, options: [])

            print(jsonResponse) //Response result
        } catch let parsingError {
            print("Error", parsingError)
        }
    }
    task.resume()
}
    // table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diningLocations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create cell that has the properties of the TableViewCell we defined, otherwise it gives an error
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as? TableViewCell else {
            fatalError("The dequeued cell is not an instance of TableViewCell.")
        }
        //put the data for the dining locations in the cell
        let diningLocation = diningLocations[indexPath.row]
        cell.nameLabel.text = diningLocation.name
        cell.diningImage.image = diningLocation.image
        cell.openclosedLabel.text = diningLocation.openClosed
        cell.openHoursLabel.text = diningLocation.hours
        
        return cell
    }

    // prepare for segue by getting the name of the location we clicked on
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueID"{
        let destination = segue.destination as! MenuViewController
        let index = tableView.indexPathForSelectedRow?.row
        destination.menuURL = diningLocations[index!].menuURL
        print(diningLocations[index!].menuURL)
        }
    }

}
