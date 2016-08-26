//
//  Page1ViewController.swift
//  CoreDataH1
//
//  Created by admin on 8/26/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import CoreData

class Page1ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var items = [NSManagedObject]()
    
    @IBOutlet weak var tableView:UITableView!
    
    @IBAction func btnAdd(sender: AnyObject) {
        print("Add")
        self.saveItem("Cat")
        self.tableView.reloadData()
    }
    
    func saveItem(name:String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: managedContext)
        let cart = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        cart.setValue(name, forKey: "name")
        do {
            try managedContext.save()
            items.append(cart)
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return items.count
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell0 = tableView.dequeueReusableCellWithIdentifier("tableCell0")
        //let item = items[indexPath.row]
        //cell0?.textLabel?.text = item.valueForKey("name") as? String
        return cell0!
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
        print("ViewWillAppear")
        /*
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Item")
        do { let results = try managedContext.executeFetchRequest(fetchRequest)
            items = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

