//
//  Printers.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-06-06.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import Foundation

extension Local {
  var timeZone: NSTimeZone {
    switch self {
    case .TimeZone(let timezone):
      return timezone
    case .UTCOffset(let timeinterval):
      return NSTimeZone(forSecondsFromGMT: Int(timeinterval))
    }
  }
}

extension LocalDateTime: CustomStringConvertible {
  public var description: String {
    return DateFormatters.localDateTime.stringFromLocalDateTime(self)
  }
}

extension RelativeDateTime: CustomStringConvertible {
  public var description: String {
    return DateFormatters.relativeDateTime.stringFromDate(nsdate)
  }
}

extension RelativeDate: CustomStringConvertible {
  public var description: String {
    return DateFormatters.relativeDate.stringFromDate(nsdate)
  }
}
