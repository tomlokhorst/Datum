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

extension RelativeTime : Hashable {
  public var hashValue: Int {
    return components.hashValue
  }

  public var hour: Int {
    return components.hour
  }

  public var minute: Int {
    return components.minute
  }

  public var second: Int {
    return components.second
  }
}

public func ==(lhs: RelativeTime, rhs: RelativeTime) -> Bool {
  return lhs.components.hour == rhs.components.hour
    && lhs.components.minute == rhs.components.minute
    && lhs.components.second == rhs.components.second
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

extension OffsetDateTime : Hashable {
  public var hashValue: Int {
    return (31 &* absoluteDateTime.nsdate.hashValue) &+ utcOffset.hashValue
  }
}

public func ==(lhs: OffsetDateTime, rhs: OffsetDateTime) -> Bool {
  return lhs.absoluteDateTime.nsdate.isEqualToDate(rhs.absoluteDateTime.nsdate) && lhs.utcOffset == rhs.utcOffset
}

extension OffsetDate : Hashable {
  public var hashValue: Int {
    return (31 &* absoluteDateTime.nsdate.hashValue) &+ utcOffset.hashValue
  }
}

public func ==(lhs: OffsetDate, rhs: OffsetDate) -> Bool {
  return lhs.absoluteDateTime.nsdate.isEqualToDate(rhs.absoluteDateTime.nsdate) && lhs.utcOffset == rhs.utcOffset
}
