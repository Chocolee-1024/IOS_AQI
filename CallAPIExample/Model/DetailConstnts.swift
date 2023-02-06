//
//  DetailConstnts.swift
//  CallAPIExample
//
//  Created by imac-1763 on 2023/2/6.
//

import Foundation

struct DetailConstnts {
    enum healthy: String {
        case leval_One = "各類人群可正常活動"
        case leval_Two = "極少數異常敏感人群應減少戶外活動"
        case leval_Three = "兒童、老年人及心臟病、呼吸系統疾病患者應減少長時間、高強度的戶外鍛鍊"
        case leval_Four = "兒童、老年人及心臟病、呼吸系統疾病患者應避免長時間、高強度的戶外鍛鍊，一般人群適量減少戶外運動"
        case leval_Five = "兒童、老年人及心臟病、呼吸系統疾病患者應停留在室內，停止戶外活動，一般人群應避免戶外活動"
        case leval_Six = "兒童、老年人及心臟病、呼吸系統疾病患者應停留在室內，避免體力消耗，一般人群應避免戶外活動"

    }
    enum measure: String {
        case leval_One = "空氣品質令人滿意，基本無空氣污染"
        case leval_Two = "空氣品質可接受，但某些污染物可能對極少數異常敏感人群健康有較弱影響"
        case leval_Three =  "易感人群症狀有輕度加劇，健康人群出現刺激症狀"
        case leval_Four = "進一步加劇易感人群症狀，可能對健康人群心臟、呼吸系統有影響"
        case leval_Five = "心臟病和肺病患者症狀顯著加劇，運動耐受力降低，健康人群普遍出現症狀"
        case leval_Six = "健康人群運動耐受力降低，有明顯強烈症狀，提前出現某些疾病"
    }
    
}
