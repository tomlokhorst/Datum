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
    let date = nsdate.dateByAddingTimeInterval(-NSTimeInterval(timeZone.secondsFromGMTForDate(nsdate)))
    let absoluteDateTime = AbsoluteDateTime(nsdate: date)

    return ZonedDateTime(absoluteDateTime: absoluteDateTime, timeZone: timeZone)
  }

  public func offsetDateTimeFor(utcOffset utcOffset: NSTimeInterval) -> OffsetDateTime {
    let date = nsdate.dateByAddingTimeInterval(-utcOffset)
    let absoluteDateTime = AbsoluteDateTime(nsdate: date)

    return OffsetDateTime(absoluteDateTime: absoluteDateTime, utcOffset: utcOffset)
  }

  public var offsetDateTimeForUTC: OffsetDateTime {
    return OffsetDateTime(absoluteDateTime: AbsoluteDateTime(nsdate: nsdate), utcOffset: 0)
  }
}

extension RelativeDate {
  public var midnight: RelativeDateTime {
    return RelativeDateTime(nsdate: nsdate)
  }
}
