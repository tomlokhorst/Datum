//
//  DateFormatters.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-06-06.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import Foundation

struct DateFormatters {
  static var cache: [String: NSDateFormatter] = [
    "yyyy-MM-dd'T'HH:mm:ssZZZZZ": localDateTime,
    "yyyy-MM-dd'T'HH:mm:ss": relativeDateTime,
    "yyyy-MM-dd": relativeDate
  ]

  static func formatterForFormat(formatString: String) -> NSDateFormatter {
    if let formatter = cache[formatString] {
      return formatter
    }

    let formatter = NSDateFormatter()
    formatter.dateFormat = formatString
    cache[formatString] = formatter

    return formatter
  }

  static let localDateTime: NSDateFormatter = {
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"

    return formatter
  }()

  static let relativeDateTime: NSDateFormatter = {
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    formatter.timeZone = NSTimeZone(name: "UTC")

    return formatter
  }()

  static let relativeDate: NSDateFormatter = {
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.timeZone = NSTimeZone(name: "UTC")

    return formatter
  }()
}
