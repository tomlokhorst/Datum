//
//  Initializers.swift
//  Datum
//
//  Created by Tom Lokhorst on 2016-02-25.
//  Copyright © 2016 nonstrict. All rights reserved.
//

import Foundation

extension AbsoluteDateTime {
  public init(dateInUTC: Date) {
    self.nsdate = dateInUTC
  }
}

extension RelativeDateTime {
  public init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) {
    var components = DateComponents(timeZone: utcTimeZone)
    components.year = year
    components.month = month
    components.day = day
    components.hour = hour
    components.minute = minute
    components.second = second

    self.nsdate = utcCalendar.date(from: components)!
  }
}

extension RelativeDate {
  public init(year: Int, month: Int, day: Int) {
    var components = DateComponents(timeZone: utcTimeZone)
    components.year = year
    components.month = month
    components.day = day

    self.nsdate = utcCalendar.date(from: components)!
  }
}

extension RelativeTime {
  // Note: Should we disallow negative hours/minute/second?
  // Or hours > 24 (maybe leap seconds?)
  // RelativeTime should not be a Duration or Interval
  public init(hour: Int, minute: Int, second: Int) {
    var components = DateComponents(timeZone: utcTimeZone)
    components.hour = hour
    components.minute = minute
    components.second = second

    self.components = components
  }
}

extension ZonedDateTime {
  public init(relativeDateTime: RelativeDateTime, timeZone: TimeZone) {
    self = relativeDateTime.zonedDateTime(for: timeZone)
  }

  public init(dateInUTC: Date, withTimeZone timeZone: TimeZone) {
    self.absoluteDateTime = AbsoluteDateTime(nsdate: dateInUTC)
    self.timeZone = timeZone
  }
}

extension ZonedDate {
  public init(relativeDate: RelativeDate, timeZone: TimeZone) {
    self = relativeDate.zonedDate(for: timeZone)
  }
}

extension OffsetDateTime {
  public init(relativeDateTime: RelativeDateTime, utcOffset: OffsetInSeconds) {
    self = relativeDateTime.offsetDateTime(for: utcOffset)
  }

  public init(dateInUTC: Date, withUTCOffset utcOffset: OffsetInSeconds) {
    self.absoluteDateTime = AbsoluteDateTime(nsdate: dateInUTC)
    self.utcOffset = utcOffset
  }
}

extension OffsetDate {
  public init(relativeDate: RelativeDate, utcOffset: OffsetInSeconds) {
    self = relativeDate.offsetDate(for: utcOffset)
  }
}
