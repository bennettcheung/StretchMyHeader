//
//  MasterViewController.swift
//  StretchMyHeader
//
//  Created by Bennett on 2018-09-11.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

  var detailViewController: DetailViewController? = nil
  var newsItems = [NewsItem]()


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    navigationItem.leftBarButtonItem = editButtonItem

    let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
    navigationItem.rightBarButtonItem = addButton
    if let split = splitViewController {
        let controllers = split.viewControllers
        detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
    }
    
    loadSampleItems()
  }

  override func viewWillAppear(_ animated: Bool) {
    clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
    super.viewWillAppear(animated)
  }

  private func loadSampleItems(){
    newsItems = [ NewsItem(category: NewsItemCategory.World,
                           headline: "Climate change protests, divestments meet fossil fuels realities"),
                  NewsItem(category: NewsItemCategory.Europe, headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"),
                  NewsItem(category: NewsItemCategory.MiddleEast, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
                  NewsItem(category: NewsItemCategory.Africa, headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
                  NewsItem(category: NewsItemCategory.AsiaPacific, headline: "Despite UN ruling, Japan seeks backing for whale hunting"),
                  NewsItem(category: NewsItemCategory.Americas, headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
                  NewsItem(category: NewsItemCategory.World, headline: "South Africa in $40 billion deal for Russian nuclear reactors"),
                  NewsItem(category: NewsItemCategory.Europe, headline: "'One million babies' created by EU student exchanges")
    ]

  }
  
  
  @objc
  func insertNewObject(_ sender: Any) {
    newsItems.insert(NewsItem(category: NewsItemCategory.Americas, headline: "Some headline"), at: 0)
    let indexPath = IndexPath(row: 0, section: 0)
    tableView.insertRows(at: [indexPath], with: .automatic)
  }

  // MARK: - Segues

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
        if let indexPath = tableView.indexPathForSelectedRow {
            let newsitem = newsItems[indexPath.row]
            let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
            controller.detailItem = newsitem
            controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
            controller.navigationItem.leftItemsSupplementBackButton = true
        }
    }
  }

  // MARK: - Table View

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return newsItems.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? HeadlineTableViewCell else{
      print("Issue dequeueing proper type of cell")
      return UITableViewCell()
    }

    let newsitem = newsItems[indexPath.row]
    cell.categoryLabel!.text = newsitem.category.rawValue
    cell.headlineLabel!.text = newsitem.headline
    return cell
  }

  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }

  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        newsItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
  }

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
  override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }

}

