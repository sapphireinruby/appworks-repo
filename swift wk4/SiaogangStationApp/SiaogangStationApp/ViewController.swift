//
import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var IDLabel: UILabel!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var AddLabel: UILabel!
    
    
    // set up Struct
    
    struct Response: Codable
    {
        let stationID: String
        let stationName: String
        let stationAddress: String
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadStationInfo()

        IDLabel.text = "R0"
        
        let myResponse = Response(stationID: "R0", stationName: "Taipei", stationAddress: "some address")
        print(myResponse)
    }
    
    
    func loadStationInfo()
    {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                print("something wrong when loading")
                return
            }
            
            //convert the data
            
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch{
                print("failed to convert \(error.localizedDescription)")
            }
            
            guard let json = result else {
                return
            }

            self.IDLabel.text = json.stationID
            self.NameLabel.text = json.stationName

        }
        
        task.resume()
        
    }
    


    // Setup the url
    let url = URL(string: "https://stations-98a59.firebaseio.com/practice.json")!

}

