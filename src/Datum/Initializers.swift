//
//  Initializers.swift
//  Datum
//
//  Created by Tom Lokhorst on 2016-02-25.
//  Copyright © 2016 nonstrict. All rights reserved.
//

import Foundation

extension AbsoluteDateTime {
  public init(dateInUTC: NSDate) {
    self.nsdate = dateInUTC
  }
}

extension RelativeDateTime {
  public init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) {
    let components = NSDateComponents(timeZone: utcTimeZone)
    components.year = year
    components.month = month
    components.day = day
    components.hour = hour
    components.minute = minute
    components.second = second

    self.nsdate = utcCalendar.dateFromComponents(components)!
  }
}

extension RelativeDate {
  public init(year: Int, month: Int, day: Int) {
    let components = NSDateComponents(timeZone: utcTimeZone)
    components.year = year
    components.month = month
    components.day = day

    self.nsdate = utcCalendar.dateFromComponents(components)!
  }
}

extension RelativeTime {
  // Note: Should we disallow negative hours/minute/second?
  // Or hours > 24 (maybe leap seconds?)
  // RelativeTime should not be a Duration or Interval
  public init(hour: Int, minute: Int, second: Int) {
    let components = NSDateComponents(timeZone: utcTimeZone)
    components.hour = hour
    components.minute = minute
    components.second = second

    self.components = components
  }
}

extension ZonedDateTime {
  public init(relativeDateTime: RelativeDateTime, timeZone: NSTimeZone) {
    self = relativeDateTime.zonedDateTimeFor(timeZone: timeZone)
  }

  public init(dateInUTC: NSDate, withTimeZone timeZone: NSTimeZone) {
    self.absoluteDateTime = AbsoluteDateTime(nsdate: dateInUTC)
    self.timeZone = timeZone
  }
}

extension ZonedDate {
  public init(relativeDate: RelativeDate, timeZone: NSTimeZone) {
    self = relativeDate.zonedDateFor(timeZone: timeZone)
  }
}

extension OffsetDateTime {
  public init(relativeDateTime: RelativeDateTime, utcOffset: OffsetInSeconds) {
    self = relativeDateTime.offsetDateTimeFor(utcOffset: utcOffset)
  }

  public init(dateInUTC: NSDate, withUTCOffset utcOffset: OffsetInSeconds) {
    self.absoluteDateTime = AbsoluteDateTime(nsdate: dateInUTC)
    self.utcOffset = utcOffset
  }
}

extension OffsetDate {
  public init(relativeDate: RelativeDate, utcOffset: OffsetInSeconds) {
    self = relativeDate.offsetDateFor(utcOffset: utcOffset)
  }
}
