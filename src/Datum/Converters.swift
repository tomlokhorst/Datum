//
//  Converters.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-06-05.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import Foundation

extension LocalDateTime {
  public var absoluteDateTime: NSDate {
    return nsdate
  }

  public func components(calendar optionalCalendar: NSCalendar? = nil) -> NSDateComponents {
    let calendar = optionalCalendar ?? NSCalendar.currentCalendar()
    return calendar.componentsInTimeZone(local.timeZone, fromDate: nsdate)
  }
}

extension RelativeDateTime {
  public var date: RelativeDate {
    let calendar = NSCalendar.currentCalendar()
    let components = calendar.componentsInTimeZone(NSTimeZone(name: "UTC")!, fromDate: nsdate)
    components.hour = 0
    components.minute = 0
    components.second = 0
    components.nanosecond = 0
    return RelativeDate(nsdate: components.date!)
  }

  public var localDateTimeForUTC: LocalDateTime {
    return LocalDateTime(nsdate: nsdate, local: Local.UTCOffset(0))
  }

  public func localDateTimeFor(timezone timezone: NSTimeZone) -> LocalDateTime {
    var date = nsdate
    date = date.dateByAddingTimeInterval(-NSTimeInterval(timezone.secondsFromGMTForDate(date)))
    return LocalDateTime(nsdate: date, local: Local.TimeZone(timezone))
  }

  public func localDateTimeFor(utcOffset utcOffset: NSTimeInterval) -> LocalDateTime {
    var date = nsdate
    date = date.dateByAddingTimeInterval(-utcOffset)
    return LocalDateTime(nsdate: date, local: Local.UTCOffset(utcOffset))
  }
}

extension RelativeDate {
  public var midnight: RelativeDateTime {
    return RelativeDateTime(nsdate: nsdate)
  }
}
