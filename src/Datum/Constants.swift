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

  internal func componentsFrom(relativeTime relativeTime: RelativeTime) -> NSDateComponents {
    let components = self.components([.Year, .Month, .Day, .Hour, .Minute, .Second, .Nanosecond], fromDate: relativeTime.nsdate)

    // Subtract default Jan 1, 2000
    components.year -= 2000
    components.month -= 1
    components.day -= 1

    return components
  }
}

extension NSDateComponents {
  internal convenience init(timeZone: NSTimeZone) {
    self.init()
    self.timeZone = timeZone
  }
}
