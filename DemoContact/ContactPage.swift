//
//  ContactPage.swift
//  DemoContact
//
//  Created by Rifluxyss on 01/02/23.
//

import UIKit

protocol Pass {
    func PassData(str : String)
}
class ContactPage: UIViewController {
    var Con_name = ""
    var Con_num = ""
    var UpdateData : Pass!
    @IBOutlet weak var OTName: UILabel!
    @IBOutlet weak var OTNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OTName.text = Con_name
        OTNumber.text = Con_num
    }
    
    @IBAction func Edit(_ sender: Any) {
        let alerbox = UIAlertController(title: "Edit", message: nil, preferredStyle: .alert)
        alerbox.addTextField { (Txt) in
            Txt.text = self.OTName.text
        }

        let action = UIAlertAction(title: "SAVE", style: .default) { (action) in
            let demo_name = alerbox.textFields?[0].text
            self.UpdateData.PassData(str: demo_name!)
            self.OTName.text = demo_name
        }
        let cancel = UIAlertAction(title: "Canel", style: .cancel, handler: .none)
        alerbox.addAction(action)
        alerbox.addAction(cancel)
        present(alerbox, animated: true, completion: nil)
    }
    
}
