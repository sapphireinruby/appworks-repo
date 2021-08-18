import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITabBarDelegate
{

    
    @IBOutlet weak var rowTableView: UITableView!
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellInfo") as! TableViewCell
    }

}

