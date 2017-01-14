//
//  Protocols.swift
//  Datum
//
//  Created by Tom Lokhorst on 2016-02-25.
//  Copyright © 2016 nonstrict. All rights reserved.
//

import Foundation

public protocol Instant {
  var instant: Date { get }
}

extension AbsoluteDateTime : Instant {
  public var instant: Date {
    return nsdate as Date
  }
}

extension ZonedDateTime : Instant {
  public var instant: Date {
    return absoluteDateTime.nsdate as Date
  }
}

extension OffsetDateTime : Instant {
  public var instant: Date {
    return absoluteDateTime.nsdate as Date
  }

}
