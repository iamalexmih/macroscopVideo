//
//  EditorData.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 01.06.2023.
//

import Foundation


class EditorDataService {
    static let shared = EditorDataService()
    private init() { }
    
    func editData(_ frameData: Data) -> Data? {
        let newString = String(data: frameData, encoding: .macOSRoman)
        let targetWord = "ˇÿˇ‡"
        if let range = newString?.range(of: targetWord) {
            let changeFrameString = newString?.suffix(from: range.lowerBound)
            let imageData = changeFrameString?.data(using: .macOSRoman)
            return imageData
        } else {
            print("Слово не найдено в строке.")
        }
        return nil
    }
}
