//
//  Parsers.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-06-05.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import Foundation

extension LocalDateTime {
  public static func parse(string: String) -> LocalDateTime? {
    guard let date = DateFormatters.localDateTime.dateFromString(string) else {
      return nil
    }

    let start = string.startIndex.advancedBy(19)
    let end = start.advancedBy(6)
    let abbr = string.substringWithRange(Range(start: start, end: end))
    let timezone = NSTimeZone(abbreviation: "UTC\(abbr)")!

    return LocalDateTime(nsdate: date, local: Local.TimeZone(timezone))
  }
}

extension RelativeDateTime {
  public static func parse(string: String) -> RelativeDateTime? {
    guard let date = DateFormatters.relativeDateTime.dateFromString(string) else {
      return nil
    }

    return RelativeDateTime(nsdate: date)
  }
}
