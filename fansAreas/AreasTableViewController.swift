//
//  AreasTableViewController.swift
//  fansAreas
//
//  Created by lisz on 2017/2/27.
//  Copyright © 2017年 lisz. All rights reserved.
//

import UIKit

class AreasTableViewController: UITableViewController {
    var areas = ["上海","北京","杭州","昆明","南京","西安","临沧","沈阳","重庆","成都","昆明","苏州","无锡"]
    var images=["111","222","333","444","555","666","777","888","999","110","112","113","114",]
    var shengfen = ["上海","北京","杭州","昆明","南京","西安","临沧","沈阳","重庆","成都","昆明","苏州","无锡"]
    var quyu = ["上海","北京","杭州","昆明","南京","西安","临沧","沈阳","重庆","成都","昆明","苏州","无锡"]
    var visited = [Bool](repeating: false, count:13)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: -  Table view delegate
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let actionshare = UITableViewRowAction(style: .normal, title: "分享") { (_, indexPath) in
            let actionsheet = UIAlertController(title: "分享", message:nil, preferredStyle: .actionSheet)
            let option1 = UIAlertAction(title: "QQ", style: .default, handler: nil)
            let option2 = UIAlertAction(title: "微信", style: .default, handler: nil)
            let option3 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            actionsheet.addAction(option1)
            actionsheet.addAction(option2)
            actionsheet.addAction(option3)
            self.present(actionsheet, animated: true, completion: nil)
        }
        actionshare.backgroundColor = UIColor(colorLiteralRed: 238/255, green: 84/255, blue: 32/255, alpha: 1)
        let delet = UITableViewRowAction(style:.destructive, title: "删除") { (_, indexPath) in
                // Delete the row from the data source
                self.images.remove(at: indexPath.row)
                self.areas.remove(at: indexPath.row)
                self.quyu.remove(at: indexPath.row)
                self.shengfen.remove(at: indexPath.row)
                self.visited.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                    }
        let actiontop = UITableViewRowAction(style: .normal, title: "置顶") { (_, indexPath) in
            tableView.moveRow(at: indexPath, to: [0,0])
        }
        actiontop.backgroundColor = UIColor(colorLiteralRed: 242/255, green: 130/255, blue: 203/255, alpha: 1)

        return [delet,actionshare,actiontop]
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("你点击了",indexPath.section,"组",indexPath.row,"行")
        let menu = UIAlertController(title: "交互菜单", message:"你点击了\(indexPath.row)行", preferredStyle: .actionSheet)
//      let option1 = UIAlertAction(title: "确定", style:.default, handler: nil)
//      menu.addAction(option1)
        let option2 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        menu.addAction(option2)
        let option3 = UIAlertAction(title: "我去过", style: .default) {(_) in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.visited[indexPath.row] = true
        }
        menu.addAction(option3)
        self.present(menu, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return areas.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as!CustomTableViewCell
        cell.lableName.text = areas[indexPath.row]
        cell.imageSimple.image=UIImage(named: images[indexPath.row])
        /*
         cell.imageSimple.layer.cornerRadius = cell.imageSimple.frame.size.width/2
         */
        cell.imageSimple.clipsToBounds = true
        cell.lableShengfen.text = shengfen[indexPath.row]
        cell.lableQuyu.text = quyu[indexPath.row]
        cell.accessoryType = visited[indexPath.row] ? .checkmark : .none
        return cell
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.images.remove(at: indexPath.row)
            self.areas.remove(at: indexPath.row)
            self.quyu.remove(at: indexPath.row)
            self.shengfen.remove(at: indexPath.row)
            self.visited.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
