//
//  Parsers.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-06-05.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import Foundation


extension RelativeDateTime {
  public static func parse(string: String) -> RelativeDateTime? {
    guard let date = DateFormatters.relativeDateTime.dateFromString(string) else {
      return nil
    }

    return RelativeDateTime(nsdate: date)
  }
}

extension RelativeDate {
  public static func parse(string: String) -> RelativeDate? {
    guard let date = DateFormatters.relativeDate.dateFromString(string) else {
      return nil
    }

    return RelativeDate(nsdate: date)
  }
}

extension RelativeTime {
  public static func parse(string: String) -> RelativeTime? {
    guard let date = DateFormatters.relativeTime.dateFromString(string) else {
      return nil
    }

    let components = utcCalendar.components([.Hour, .Minute, .Second], fromDate: date)
    components.calendar = utcCalendar

    return RelativeTime(components: components)
  }
}

extension ZonedDateTime {
  public static func parse(string: String, timeZoneName: String) -> ZonedDateTime? {
    guard let
      relativeDateTime = RelativeDateTime.parse(string),
      timeZone = NSTimeZone(name: timeZoneName)
    else {
      return nil
    }

    return ZonedDateTime(absoluteDateTime: AbsoluteDateTime(nsdate: relativeDateTime.nsdate), timeZone: timeZone)
  }
}

extension ZonedDate {
  public static func parse(string: String, timeZoneName: String) -> ZonedDate? {
    guard let
      relativeDate = RelativeDate.parse(string),
      timeZone = NSTimeZone(name: timeZoneName)
    else {
      return nil
    }

    return ZonedDate(absoluteDateTime: AbsoluteDateTime(nsdate: relativeDate.nsdate), timeZone: timeZone)
  }
}

extension OffsetDateTime {
  public static func parse(string: String) -> OffsetDateTime? {
    guard let date = DateFormatters.offsetDateTime.dateFromString(string) else {
      return nil
    }

    let start = string.startIndex.advancedBy(19)
    let end = string.endIndex
    let abbr = string.substringWithRange(start ..< end)
    let timeZone = NSTimeZone(abbreviation: "UTC\(abbr)")!

    let absoluteDateTime = AbsoluteDateTime(nsdate: date)

    return OffsetDateTime(absoluteDateTime: absoluteDateTime, utcOffset: timeZone.secondsFromGMT)
  }
}

extension OffsetDate {
  public static func parse(string: String) -> OffsetDate? {
    guard let date = DateFormatters.offsetDate.dateFromString(string) else {
      return nil
    }

    let start = string.startIndex.advancedBy(10)
    let end = string.endIndex
    let abbr = string.substringWithRange(start ..< end)
    let timeZone = NSTimeZone(abbreviation: "UTC\(abbr)")!

    let absoluteDateTime = AbsoluteDateTime(nsdate: date)

    return OffsetDate(absoluteDateTime: absoluteDateTime, utcOffset: timeZone.secondsFromGMT)
  }
}
