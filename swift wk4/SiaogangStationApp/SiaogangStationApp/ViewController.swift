//
import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var IDLabel: UILabel!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var AddLabel: UILabel!
    
    
//    // set up Struct
//
//    struct Response: Codable
//    {
//        let stationID: String
//        let stationName: String
//        let stationAddress: String
//    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadStationInfo()

        //NameLabel.text =  "so tired"
       // IDLabel.text = "\(Response:stationID)"
        
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

                DispatchQueue.main.async {
                    self.IDLabel.text = result?.stationID
                    self.NameLabel.text = result?.stationName
                    self.AddLabel.text = result?.stationAddress
                }
                
                
            }
            catch{
                print("failed to convert \(error.localizedDescription)")
            }
            
            // test run print (result)
            
            guard let json = result else {
                return
            }
            
            //return result
            
            self.IDLabel.text = json.stationID
            print(json.stationName)
            print(json.stationAddress)

        }
        
        task.resume()
        
    }
    


    // Setup the url
    let url = URL(string: "https://stations-98a59.firebaseio.com/practice.json")!

}

