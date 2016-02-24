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
    return DateFormatters.relativeDateTime.stringFromDate(nsdate)
  }
}

extension RelativeDate: CustomStringConvertible {
  public var description: String {
    return DateFormatters.relativeDate.stringFromDate(nsdate)
  }
}

extension ZonedDateTime: CustomStringConvertible {
  public var description: String {
    return DateFormatters.offsetDateTime.stringFromZonedDateTime(self) + " \(timeZone.name)"
  }
}

extension OffsetDateTime: CustomStringConvertible {
  public var description: String {
    return DateFormatters.offsetDateTime.stringFromOffsetDateTime(self)
  }
}
