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
    if let date = DateFormatters.localDateTime.dateFromString(string) {
      let start = advance(string.startIndex, 19)
      let end = advance(start, 6)
      let abbr = string.substringWithRange(Range(start: start, end: end))
      let timezone = NSTimeZone(abbreviation: "UTC\(abbr)")!

      return LocalDateTime(nsdate: date, local: Local.TimeZone(timezone))
    }
    return nil
  }
}

extension RelativeDateTime {
  public static func parse(string: String) -> RelativeDateTime? {
    if let date = DateFormatters.relativeDateTime.dateFromString(string) {
      return RelativeDateTime(nsdate: date)
    }
    return nil
  }
}
