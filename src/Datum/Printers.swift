//
//  Printers.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-06-06.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import Foundation


extension AbsoluteDateTime: CustomStringConvertible {
  public var description: String {
    return nsdate.description
  }
}

extension RelativeDateTime: CustomStringConvertible {
  public var description: String {
    return DateFormatters.relativeDateTime.string(from: nsdate)
  }
}

extension RelativeDate: CustomStringConvertible {
  public var description: String {
    return DateFormatters.relativeDate.string(from: nsdate)
  }
}

extension RelativeTime: CustomStringConvertible {
  public var description: String {
    if components.calendar == nil {
      fatalError("RelativeTime: components.calendar should be set")
    }
    guard let date = components.date else {
      fatalError("RelativeTime: Can't compute date")
    }

    return DateFormatters.relativeTime.string(from: date)
  }
}

extension ZonedDateTime: CustomStringConvertible {
  public var description: String {
    let dateFormatter = DateFormatters.offsetDateTime.copy() as! DateFormatter
    dateFormatter.timeZone = timeZone

    return dateFormatter.string(from: absoluteDateTime.nsdate) + " \(timeZone.identifier)"
  }
}

extension ZonedDate: CustomStringConvertible {
  public var description: String {
    let dateFormatter = DateFormatters.offsetDate.copy() as! DateFormatter
    dateFormatter.timeZone = timeZone

    return dateFormatter.string(from: absoluteDateTime.nsdate) + " \(timeZone.identifier)"
  }
}

extension OffsetDateTime: CustomStringConvertible {
  public var description: String {
    let dateFormatter = DateFormatters.offsetDateTime.copy() as! DateFormatter
    dateFormatter.timeZone = TimeZone(secondsFromGMT: Int(utcOffset))

    return dateFormatter.string(from: absoluteDateTime.nsdate)
  }
}

extension OffsetDate: CustomStringConvertible {
  public var description: String {
    let dateFormatter = DateFormatters.offsetDate.copy() as! DateFormatter
    dateFormatter.timeZone = TimeZone(secondsFromGMT: Int(utcOffset))

    return dateFormatter.string(from: absoluteDateTime.nsdate)
  }
}
