//
import UIKit

struct Response
{
    let stationID: String
    let stationName: String
    let stationAddress: String
}



class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let myResponse = Response(stationID: "R0", stationName: "Taipei", stationAddress: "some address")
        print(myResponse)
    }


}

