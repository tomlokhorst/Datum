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
    "yyyy-MM-dd'T'HH:mm:ss": relativeDateTime,
    "yyyy-MM-dd": relativeDate,
    "yyyy-MM-dd'T'HH:mm:ssZZZZZ": offsetDateTime,
    "yyyy-MM-ddZZZZZ": offsetDate
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

  static let relativeDateTime: NSDateFormatter = {
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    formatter.timeZone = NSTimeZone(name: "UTC")

    return formatter
  }()

  static let relativeDate: NSDateFormatter = {
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    formatter.timeZone = NSTimeZone(name: "UTC")

    return formatter
  }()

  static let offsetDateTime: NSDateFormatter = {
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    formatter.timeZone = NSTimeZone(name: "UTC")

    return formatter
  }()


  static let offsetDate: NSDateFormatter = {
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-ddZZZZZ"
    formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    formatter.timeZone = NSTimeZone(name: "UTC")

    return formatter
  }()
}
