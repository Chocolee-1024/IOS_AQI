
import Foundation

struct AQIResponse: Decodable{
    let records: [Records]
    
    struct Records: Decodable{
        let county: String
        let aqi: String
        let status: String
    }
}


