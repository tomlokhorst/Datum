//
//  Parsers.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-06-05.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import Foundation


extension RelativeDateTime {
  public static func parse(_ string: String) -> RelativeDateTime? {
    guard let date = DateFormatters.relativeDateTime.date(from: string) else {
      return nil
    }

    return RelativeDateTime(nsdate: date)
  }
}

extension RelativeDate {
  public static func parse(_ string: String) -> RelativeDate? {
    guard let date = DateFormatters.relativeDate.date(from: string) else {
      return nil
    }

    return RelativeDate(nsdate: date)
  }
}

extension RelativeTime {
  public static func parse(_ string: String) -> RelativeTime? {
    guard let date = DateFormatters.relativeTime.date(from: string) else {
      return nil
    }

    var components = utcCalendar.dateComponents([.hour, .minute, .second], from: date)
    components.calendar = utcCalendar

    return RelativeTime(components: components)
  }
}

extension ZonedDateTime {
  public static func parse(_ string: String, timeZoneName: String) -> ZonedDateTime? {
    guard
      let relativeDateTime = RelativeDateTime.parse(string),
      let timeZone = TimeZone(identifier: timeZoneName)
    else {
      return nil
    }

    return ZonedDateTime(absoluteDateTime: AbsoluteDateTime(nsdate: relativeDateTime.nsdate), timeZone: timeZone)
  }
}

extension ZonedDate {
  public static func parse(_ string: String, timeZoneName: String) -> ZonedDate? {
    guard
      let relativeDate = RelativeDate.parse(string),
      let timeZone = TimeZone(identifier: timeZoneName)
    else {
      return nil
    }

    return ZonedDate(absoluteDateTime: AbsoluteDateTime(nsdate: relativeDate.nsdate), timeZone: timeZone)
  }
}

extension OffsetDateTime {
  public static func parse(_ string: String) -> OffsetDateTime? {
    guard let date = DateFormatters.offsetDateTime.date(from: string) else {
      return nil
    }

    let start = string.index(string.startIndex, offsetBy: 19)
    let end = string.endIndex
    let abbr = string[start ..< end]
    let utcOffset: OffsetInSeconds

    if abbr == "Z" {
      utcOffset = 0
    }
    else {
      guard let timeZone = TimeZone(abbreviation: "UTC\(abbr)") else { return nil }
      utcOffset = timeZone.secondsFromGMT()
    }

    let absoluteDateTime = AbsoluteDateTime(nsdate: date)

    return OffsetDateTime(absoluteDateTime: absoluteDateTime, utcOffset: utcOffset)
  }
}

extension OffsetDate {
  public static func parse(_ string: String) -> OffsetDate? {
    guard let date = DateFormatters.offsetDate.date(from: string) else {
      return nil
    }

    let start = string.index(string.startIndex, offsetBy: 10)
    let end = string.endIndex
    let abbr = string[start ..< end]
    let utcOffset: OffsetInSeconds

    if abbr == "Z" {
      utcOffset = 0
    }
    else {
      guard let timeZone = TimeZone(abbreviation: "UTC\(abbr)") else { return nil }
      utcOffset = timeZone.secondsFromGMT()
    }

    let absoluteDateTime = AbsoluteDateTime(nsdate: date)

    return OffsetDate(absoluteDateTime: absoluteDateTime, utcOffset: utcOffset)
  }
}
