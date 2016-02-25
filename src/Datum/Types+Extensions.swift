//
//  Types+Extensions.swift
//  Datum
//
//  Created by Tom Lokhorst on 2016-02-25.
//  Copyright © 2016 nonstrict. All rights reserved.
//

import Foundation

extension AbsoluteDateTime : Hashable {
  public var hashValue: Int {
    return nsdate.hashValue
  }
}

public func ==(lhs: AbsoluteDateTime, rhs: AbsoluteDateTime) -> Bool {
  return lhs.nsdate.isEqualToDate(rhs.nsdate)
}

extension RelativeDateTime : Hashable {
  public var hashValue: Int {
    return nsdate.hashValue
  }
}

public func ==(lhs: RelativeDateTime, rhs: RelativeDateTime) -> Bool {
  return lhs.nsdate.isEqualToDate(rhs.nsdate)
}

extension RelativeDate : Hashable {
  public var hashValue: Int {
    return nsdate.hashValue
  }
}

public func ==(lhs: RelativeDate, rhs: RelativeDate) -> Bool {
  return lhs.nsdate.isEqualToDate(rhs.nsdate)
}

extension ZonedDateTime : Hashable {
  public var hashValue: Int {
    return (31 &* absoluteDateTime.nsdate.hashValue) &+ timeZone.hashValue
  }
}

public func ==(lhs: ZonedDateTime, rhs: ZonedDateTime) -> Bool {
  return lhs.absoluteDateTime.nsdate.isEqualToDate(rhs.absoluteDateTime.nsdate) && lhs.timeZone.isEqualToTimeZone(rhs.timeZone)
}

extension ZonedDate : Hashable {
  public var hashValue: Int {
    return (31 &* absoluteDateTime.nsdate.hashValue) &+ timeZone.hashValue
  }
}

public func ==(lhs: ZonedDate, rhs: ZonedDate) -> Bool {
  return lhs.absoluteDateTime.nsdate.isEqualToDate(rhs.absoluteDateTime.nsdate) && lhs.timeZone.isEqualToTimeZone(rhs.timeZone)
}
