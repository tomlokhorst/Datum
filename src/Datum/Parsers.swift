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

    return RelativeTime(nsdate: date)
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

extension OffsetDateTime {
  public static func parse(string: String) -> OffsetDateTime? {
    guard let date = DateFormatters.offsetDateTime.dateFromString(string) else {
      return nil
    }

    let start = string.startIndex.advancedBy(19)
    let end = start.advancedBy(6)
    let abbr = string.substringWithRange(Range(start: start, end: end))
    let timeZone = NSTimeZone(abbreviation: "UTC\(abbr)")!

    let absoluteDateTime = AbsoluteDateTime(nsdate: date)

    return OffsetDateTime(absoluteDateTime: absoluteDateTime, utcOffset: timeZone.secondsFromGMT)
  }
}
