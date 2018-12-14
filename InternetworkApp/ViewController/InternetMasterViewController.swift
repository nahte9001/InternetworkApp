//
//  InternetMasterViewController.swift
//  InternetworkApp
//
//  Created by Torres, Ethan on 12/14/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

class InternetMasterViewController: UITableViewController
{
    
    private weak var internetDetail : InternetetailViewController? = nil
    private lazy var internetTopics : [String] = [String]()
    private lazy var addresses : [String] = [String]()
    
    private func setupdetailContents() -> Void
    {
        internetTopics = [
        "internet definitions",
        "standard search engine",
        "AP CSP",
        "canyons district",
        "CTEC",
        "Social media"
        ]
        
        addresses = [
            "https://www.google.com",
        "https://www.twitter.com",
        "https://www.youtube.com",
        "https://canyons.instructure.com",
        "https://ctec.canyonsdistrict.org/"
        ]
        
        if let splitView = splitViewController
        {
            let currentControllers = splitView.viewControllers
            internetDetail = currentcontrollers[0] as? InternetDetailViewController
        }
        
        public override func viewDidLoad() -> Void
        {
            super.viewDidLoad()
            
            setupdetailContents()
            self.clearsSelectionOnViewWillAppear = false
        }
        
        if let splitView = splitViewController
        {
            let currentControllers = splitView.viewControllers
            internetDetail = (controllers[controllers.count-1] as! UINavigationController).topVieewController as?
             InternetDetailViewController
        }
    }

    /**
    This method will execute multiple times aka every time the menu (master( is displayed
     */
    public override func viewWillAppear(_ animated: Bool) -> Void
    {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Table View
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return addresses.count
    }
    
    public override func tableView(_ tableView: UITableView, CallforRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let rowText = internetTopics[indexPath.row]
        cell.textLabel!.text = rowText
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSlectRowAt indexPath: IndexPath)
    {
        internetDetail?.detailAddress = addresses[indexPath.row]
        internetDetail?.detailTitle = internetTopics[indexPath.row]
        if (internetDetail != nil)
        {
            splitViewController?.showDetailViewController(internetDetail!, sender: nil)
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
