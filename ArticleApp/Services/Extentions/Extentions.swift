//
//  Extentions.swift
//  ArticleApp
//
//  Created by Andrey Dorofeev on 26/03/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    func as1ptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        let ctx = UIGraphicsGetCurrentContext()
        self.setFill()
        ctx?.fill(CGRect(x: 0, y: 0, width: 1, height: 0.3))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsGetCurrentContext()
        return image!
    }
}


extension UIImage {

    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }

}

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alphaValue: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alphaValue)
    }
    
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff, alphaValue: alpha)
    }
    
    func toImage(size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        guard let cgImage = image?.cgImage else { return nil }
        return UIImage(cgImage: cgImage)
    }
    
}

extension Date {
    static func getTimeAgo(timeString: String) -> String{
        var result = "test"
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "HH mm"

        if let date: Date = dateFormatterGet.date(from: timeString) {
            let currentDate = Date()
            
            let calendar = Calendar.current
            let currentHour = calendar.component(.hour, from: currentDate)
            let currentMinute = calendar.component(.minute, from: currentDate)
            
            let hhmm = dateFormatterPrint.string(from: date)
            let time = hhmm.components(separatedBy: " ")
            let hour = time[0]
            let minute = time[1]
            if currentHour == Int(hour) {
                if let min = Int(minute) {
                    let minutesAgo = currentMinute - min
                    result = "●  \(minutesAgo)m ago"
                }
            } else {
                if let h = Int(hour) {
                    let hoursAgo = currentHour - h
                    if hoursAgo > 0 {
                        result = "●  \(hoursAgo)h ago"
                    } else {
                        result = "●  a day ago"
                    }
                }
            }
        }
        return result
    }
}
