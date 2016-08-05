//
//  DetailVC.swift
//  EnglishForKids
//
//  Created by HuuLuong on 7/29/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var stringTitle: String!
    var dictData: NSDictionary!
    var arrayKeys: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = stringTitle
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        createDataWithName(stringTitle)
        
    }
    
    func createDataWithName(title: String) {
        var path: String = ""
        
        if (title == "Animals") {
            path = NSBundle.mainBundle().pathForResource("AnimalsList", ofType: "plist")!
        }
        
        if (title == "Transportations") {
            path = NSBundle.mainBundle().pathForResource("TransportationsList", ofType: "plist")!
        }
        dictData = NSDictionary(contentsOfFile: path)!
        arrayKeys = dictData.allKeys
        arrayKeys = arrayKeys.sortedArrayUsingSelector(#selector(NSNumber.compare(_:)))
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayKeys.count
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath)
        
        let key: String = arrayKeys[indexPath.row] as! String
        cell.textLabel?.text = key
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        
        return cell 
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.row) - \(arrayKeys[indexPath.row])")
        
    }
    func tableView(tableView: UITableView, accessoryTypeForRowWithIndexPath indexPath: NSIndexPath) -> UITableViewCellAccessoryType {
        
        return UITableViewCellAccessoryType.DisclosureIndicator
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowWordDetail" {
            let detailWordVC = segue.destinationViewController as! DetailWordVC
            let selecetedRowIndex: NSIndexPath = self.tableView.indexPathForSelectedRow!
            let selectedCell: UITableViewCell = self.tableView.cellForRowAtIndexPath(selecetedRowIndex)!
            
            detailWordVC.wordText = (selectedCell.textLabel?.text)!
            detailWordVC.wordImage = (selectedCell.imageView?.image)!
        }
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
