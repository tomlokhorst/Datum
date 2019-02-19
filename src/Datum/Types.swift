//
//  Types.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-06-05.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import Foundation

public typealias OffsetInSeconds = Int

public struct AbsoluteDateTime: Hashable {
  internal let nsdate: Date // Invariant: Should be UTC
}

public struct RelativeDateTime: Hashable {
  internal let nsdate: Date // Invariant: Should be UTC
}

public struct RelativeDate: Hashable {
  internal let nsdate: Date // Invariant: Should be midnight UTC
}

public struct RelativeTime: Hashable {
  internal let components: DateComponents

  public static func ==(lhs: RelativeTime, rhs: RelativeTime) -> Bool {
    return lhs.components.hour == rhs.components.hour
      && lhs.components.minute == rhs.components.minute
      && lhs.components.second == rhs.components.second
  }
}

public struct ZonedDateTime: Hashable {
  internal let absoluteDateTime: AbsoluteDateTime // Invariant: Should be UTC
  public let timeZone: TimeZone
}

public struct ZonedDate: Hashable {
  internal let absoluteDateTime: AbsoluteDateTime // Invariant: Should be midnight UTC
  public let timeZone: TimeZone
}

public struct OffsetDateTime: Hashable {
  internal let absoluteDateTime: AbsoluteDateTime // Invariant: Should be UTC
  public let utcOffset: OffsetInSeconds
}

public struct OffsetDate: Hashable {
  internal let absoluteDateTime: AbsoluteDateTime // Invariant: Should be midnight UTC
  public let utcOffset: OffsetInSeconds
}

public enum HammerTime {
  /* Can't touch this */
}
