//
//  Constants.swift
//  Datum
//
//  Created by Tom Lokhorst on 2016-02-25.
//  Copyright © 2016 nonstrict. All rights reserved.
//

import Foundation

internal let utcTimeZone = NSTimeZone(name: "UTC")!
internal let utcCalendar = NSCalendar(timeZone: utcTimeZone)


extension NSCalendar {
  internal convenience init(timeZone: NSTimeZone) {
    self.init(calendarIdentifier: NSCalendarIdentifierGregorian)!
    self.timeZone = timeZone
  }
}

extension NSDateComponents {
  internal convenience init(timeZone: NSTimeZone) {
    self.init()
    self.timeZone = timeZone
  }
}
