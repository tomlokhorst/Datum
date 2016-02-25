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
    let calendar = NSCalendar(timeZone: utcTimeZone)
    let components = calendar.componentsInTimeZone(utcTimeZone, fromDate: nsdate)
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

  public var zonedDateTimeForUTC: ZonedDateTime {
    return ZonedDateTime(absoluteDateTime: AbsoluteDateTime(nsdate: nsdate), timeZone: utcTimeZone)
  }

  public func offsetDateTimeFor(utcOffset utcOffset: OffsetInSeconds) -> OffsetDateTime {
    let date = nsdate.dateByAddingTimeInterval(-NSTimeInterval(utcOffset))
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

  public func withTime(relativeTime: RelativeTime) -> RelativeDateTime {
    let dateComponents = utcCalendar.components([.Year, .Month, .Day], fromDate: self.nsdate)
    let timeComponents = utcCalendar.components([.Hour, .Minute, .Second, .Nanosecond], fromDate: relativeTime.nsdate)

    // NOTE: This only works with positive times
    // This wraps after 24 hours, and ignores DST
    //
    // TODO: Make this better
    dateComponents.hour = timeComponents.hour
    dateComponents.minute = timeComponents.minute
    dateComponents.second = timeComponents.second
    dateComponents.nanosecond = timeComponents.nanosecond

    // NOTE: completely untested
    let resultDate = utcCalendar.dateFromComponents(dateComponents)!

    return RelativeDateTime(nsdate: resultDate)
  }

  public func zonedDateFor(timeZone timeZone: NSTimeZone) -> ZonedDate {
    return midnight.zonedDateTimeFor(timeZone: timeZone).date
  }

  public var zonedDateForUTC: ZonedDate {
    return midnight.zonedDateTimeForUTC.date
  }

  public func offsetDateFor(utcOffset utcOffset: OffsetInSeconds) -> OffsetDate {
    return midnight.offsetDateTimeFor(utcOffset: utcOffset).date
  }

  public var offsetDateForUTC: OffsetDate {
    return midnight.offsetDateTimeForUTC.date
  }
}

extension ZonedDateTime {
  public var date: ZonedDate {
    let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
    let components = calendar.componentsInTimeZone(timeZone, fromDate: absoluteDateTime.nsdate)
    components.hour = 0
    components.minute = 0
    components.second = 0
    components.nanosecond = 0

    return ZonedDate(absoluteDateTime: AbsoluteDateTime(nsdate: components.date!), timeZone: timeZone)
  }

  public var offsetDateTime: OffsetDateTime {
    return OffsetDateTime(absoluteDateTime: absoluteDateTime, utcOffset: timeZone.secondsFromGMT)
  }
}

extension ZonedDate {
  public var midnight: ZonedDateTime {
    return ZonedDateTime(absoluteDateTime: absoluteDateTime, timeZone: timeZone)
  }

  public func withTime(relativeTime: RelativeTime) -> ZonedDateTime {
    let dateCalendar = NSCalendar(timeZone: timeZone)
    let timeCalendar = utcCalendar

    let dateComponents = dateCalendar.components([.Year, .Month, .Day], fromDate: absoluteDateTime.nsdate)
    let timeComponents = timeCalendar.components([.Hour, .Minute, .Second, .Nanosecond], fromDate: relativeTime.nsdate)

    // NOTE: This only works with positive times
    // This wraps after 24 hours, and ignores DST
    //
    // TODO: Make this better
    dateComponents.hour = timeComponents.hour
    dateComponents.minute = timeComponents.minute
    dateComponents.second = timeComponents.second
    dateComponents.nanosecond = timeComponents.nanosecond

    // NOTE: completely untested
    let resultDate = dateCalendar.dateFromComponents(dateComponents)!

    return ZonedDateTime(absoluteDateTime: AbsoluteDateTime(nsdate: resultDate), timeZone: timeZone)
  }

  public var offsetDate: OffsetDate {
    return OffsetDate(absoluteDateTime: absoluteDateTime, utcOffset: timeZone.secondsFromGMT)
  }
}

extension OffsetDateTime {
  public var date: OffsetDate {
    let timeZone = NSTimeZone(forSecondsFromGMT: Int(utcOffset))

    let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
    let components = calendar.componentsInTimeZone(timeZone, fromDate: absoluteDateTime.nsdate)
    components.hour = 0
    components.minute = 0
    components.second = 0
    components.nanosecond = 0

    return OffsetDate(absoluteDateTime: AbsoluteDateTime(nsdate: components.date!), utcOffset: utcOffset)
  }
}

extension OffsetDate {
  public var midnight: OffsetDateTime {
    return OffsetDateTime(absoluteDateTime: absoluteDateTime, utcOffset: utcOffset)
  }
}
