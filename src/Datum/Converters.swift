//
//  Converters.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-06-05.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import Foundation

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

  public func zonedDateTimeFor(timeZone timeZone: NSTimeZone) -> ZonedDateTime {
    var date = nsdate
    date = date.dateByAddingTimeInterval(-NSTimeInterval(timeZone.secondsFromGMTForDate(date)))
    return ZonedDateTime(nsdate: date, timeZone: timeZone)
  }

  public func offsetDateTimeFor(utcOffset utcOffset: NSTimeInterval) -> OffsetDateTime {
    var date = nsdate
    date = date.dateByAddingTimeInterval(-utcOffset)
    return OffsetDateTime(nsdate: date, utcOffset: utcOffset)
  }

  public var offsetDateTimeForUTC: OffsetDateTime {
    return OffsetDateTime(nsdate: nsdate, utcOffset: 0)
  }
}

extension RelativeDate {
  public var midnight: RelativeDateTime {
    return RelativeDateTime(nsdate: nsdate)
  }
}

extension ZonedDateTime {
  public init(relativeDateTime: RelativeDateTime, timeZone: NSTimeZone) {
    self.nsdate = relativeDateTime.nsdate
    self.timeZone = timeZone
  }

  public var absoluteDateTime: NSDate {
    return nsdate
  }

  public func components(calendar optionalCalendar: NSCalendar? = nil) -> NSDateComponents {
    let calendar = optionalCalendar ?? NSCalendar.currentCalendar()
    return calendar.componentsInTimeZone(timeZone, fromDate: nsdate)
  }
}
