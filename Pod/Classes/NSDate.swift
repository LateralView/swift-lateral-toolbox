//
//  NSDate.swift
//  Pods
//
//  Created by Leandro Tami on 3/10/16.
//
//

import UIKit

extension NSDate
{
    
    public func dateByAdding(days: Int = 0, months: Int = 0, years: Int = 0) -> NSDate?
    {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let offsets = NSDateComponents()
        offsets.year = years;
        offsets.month = months;
        offsets.day = days;
        return calendar.dateByAddingComponents(offsets, toDate: self, options: [])
    }
    
}
