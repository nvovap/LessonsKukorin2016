//
//  CardViewController.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 27.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var headerView: CardHeaderView!
    private var tableHeaderHeight: CGFloat = 350.0
    private var headerMaskLayer: CAShapeLayer!
    
    var card: Card!
    
    private var comments = [Comment]()
    
    private var newCommentButton: ActionButton!
    
    
    func fetchComment() {
        //comments = Comment.allComment
        tableView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateHeaderView()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        updateHeaderView()
//    }
    
    override func viewDidLoad() {
        headerView = tableView.tableHeaderView as! CardHeaderView
        tableView.tableHeaderView = nil
        
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsets(top: tableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -tableHeaderHeight)
        
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.blackColor().CGColor
        headerView.layer.mask = headerMaskLayer
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        
        updateHeaderView()
        
        fetchComment()
        
        createNewCommentButton()
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -tableHeaderHeight, width: tableView.bounds.width, height: tableHeaderHeight)
        
        if tableView.contentOffset.y < -tableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        headerView.frame = headerRect
        
        headerView.card = card
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: 0))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: 0))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLineToPoint(CGPoint(x: 0, y: headerRect.height))
        
        headerMaskLayer?.path = path.CGPath
        
    }
    
    func createNewCommentButton() {
        newCommentButton = ActionButton(attachedToView: self.view, items: [])
        
        newCommentButton.action = {button in
            self.performSegueWithIdentifier("ShowComment", sender: nil)
        }
        
    }
}

extension CardViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
        
        let offset = scrollView.contentOffset.y
        let adjustment: CGFloat = 100.0
        
        if -offset > (adjustment + tableHeaderHeight) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}

extension CardViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCellWithIdentifier("CommentCell", forIndexPath: indexPath) as! CommentCell
        
        let comment = comments[indexPath.row]
        
        cell.comment = comment
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}
