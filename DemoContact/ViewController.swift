//
//  ViewController.swift
//  DemoContact
//
//  Created by Rifluxyss on 01/02/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, Pass{
    
    //InputData
    var name = [String]()
    var number = [String]()
    var selectedRow: Int = 0
    
    //AddButton For Contact
    @IBAction func AddContact(_ sender: Any) {
        let AlerBox = UIAlertController(title: "Add New Contact", message: nil, preferredStyle: .alert)
        AlerBox.addTextField { (Textfield) in
            
        }
        AlerBox.addTextField { (Textfield_2) in
            
        }
        let action = UIAlertAction(title: "Save", style: .default) { (action) in
            let New_name = AlerBox.textFields?[0].text
            self.name.append(New_name!)
            let New_num = AlerBox.textFields?[1].text
            self.number.append(New_num!)
            self.TableView.reloadData()
        }
        AlerBox.addAction(action)
        present(AlerBox, animated: true, completion: nil)
    }
    //Swap
    @IBAction func Swap(_ sender: Any) {
        if TableView.isEditing{
            TableView.isEditing = false
        }
        else{
            TableView.isEditing = true
        }
    }
    
    //MainTableView
    @IBOutlet weak var TableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
    }
    
    //Header Size
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    //View For Header In Section
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let Header = UIView(frame: CGRect(x: 0, y: 0, width: self.TableView.frame.width, height: 50))
        let Label = UILabel(frame: CGRect(x: 0, y: 0, width: self.TableView.frame.width, height: 50))
        Label.text = "Contact"
        Label.textAlignment = .center
        Label.font = UIFont.boldSystemFont(ofSize: 30.0)
        Header.addSubview(Label)
        return Header
    }
    
    //Number of Row in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    //Set data in TableviewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ContactViewCell
        cell.InputNameLabel.text = name[indexPath.row]
        cell.InputNumberLabel.text = number[indexPath.row]
        return cell
    }
    
    //Navigation to nextpage
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ContactPage") as! ContactPage
        vc.Con_name = name[indexPath.row]
        vc.Con_num = number[indexPath.row]
        self.selectedRow = indexPath.row
        vc.UpdateData = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //Delect
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delectaction = UITableViewRowAction(style: .destructive, title: "Delect") { (_, indexPath) in
            self.name.remove(at: indexPath.row)
            self.TableView.deleteRows(at: [indexPath], with: .automatic)
        }
        delectaction.backgroundColor = .red
        return[delectaction]
    }
    
    //MoveRow
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //Rearrange the Data
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        name.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    func PassData(str: String) {
        name[selectedRow] = str
        TableView.reloadData()
    }
}


