import UIKit

// set up Struct
public struct Response: Codable
{
    public let stationID: String
    public let stationName: String
    public let stationAddress: String
    
    public init(
        stationID: String,
        stationName: String,
        stationAddress: String
    ){
        self.stationID = stationID
        self.stationName = stationName
        self.stationAddress = stationAddress
    }
    
}
