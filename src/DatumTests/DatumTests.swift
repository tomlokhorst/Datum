//
//  DatumTests.swift
//  DatumTests
//
//  Created by Tom Lokhorst on 2015-06-05.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import UIKit
import XCTest
import Datum

class DatumTests: XCTestCase {

  func testChristmas() {
    let london = NSTimeZone(name: "Europe/London")!

    // Already Christmas day in NL, not yet in UK
    let before = OffsetDateTime.parse("2016-12-25T00:30:00+01:00")!

    // Christmas day in both NL, and UK
    let during = OffsetDateTime.parse("2016-12-25T10:30:00+01:00")!

    // No longer Christmas day in NL, but still in UK
    let still = OffsetDateTime.parse("2016-12-26T00:30:00+01:00")!

    let stringFromServer = "2016-12-25" // Note from server: date in London timzone
    let christmasDay = RelativeDate.parse(stringFromServer)!
    let christmasDayInLondon = christmasDay.midnight.zonedDateTimeFor(timeZone: london)

    let calendar = NSCalendar.currentCalendar()
    calendar.timeZone = london

    print("Before: \(calendar.isDate(christmasDayInLondon.instant, inSameDayAsDate: before.instant))")
    print("During: \(calendar.isDate(christmasDayInLondon.instant, inSameDayAsDate: during.instant))")
    print("Still:  \(calendar.isDate(christmasDayInLondon.instant, inSameDayAsDate: still.instant))")

  }

  func testRelative() {
//    print(NSCalendar.currentCalendar().calendarIdentifier)
//    print(NSTimeZone.knownTimeZoneNames())
//    print(NSLocale.availableLocaleIdentifiers())

    let amsterdam = NSTimeZone(name: "Europe/Amsterdam")!
    let sydney = NSTimeZone(name: "Australia/Sydney")!
    let brisbane = NSTimeZone(name: "Australia/Brisbane")!
    let newyork = NSTimeZone(name: "America/New_York")!
    let hawaii = NSTimeZone(name: "US/Hawaii")!

    let rdt = RelativeDateTime.parse("2013-04-30T14:30:00")!
    print("Relative   \(rdt)")
    print("Date       \(rdt.date)")
    print("UTC        \(rdt.offsetDateTimeForUTC)")
    print("Amsterdam  \(rdt.zonedDateTimeFor(timeZone: amsterdam))")
    print("Sydney     \(rdt.zonedDateTimeFor(timeZone: sydney))")
    print("Brisbane   \(rdt.zonedDateTimeFor(timeZone: brisbane))")
    print("New York   \(rdt.zonedDateTimeFor(timeZone: newyork))")
    print("Hawaii     \(rdt.zonedDateTimeFor(timeZone: hawaii))")
    print("15mins     \(rdt.offsetDateTimeFor(utcOffset: 15 * 60))")


    let inauguration = RelativeDateTime.parse("2013-04-30T14:30:00")!.zonedDateTimeFor(timeZone: amsterdam)
    let auckland = NSTimeZone(name: "Pacific/Auckland")!
    let formatter = NSDateFormatter()
    formatter.dateStyle = NSDateFormatterStyle.FullStyle
    formatter.locale = NSLocale(localeIdentifier: "en_NZ")
    formatter.timeZone = auckland
    print("The inauguration took place on \(formatter.stringFromDate(inauguration.instant))")

    XCTAssert(true, "Pass")
  }

  func testLocal() {

    let ldt = OffsetDateTime.parse("2015-03-06T09:28:42+03:00")!
    print("Local   \(ldt)")
    XCTAssert(true, "Pass")
  }

  func testPerformanceParse() {
    self.measureBlock() {
      let count = 1 // 10000
      for (var i = 0; i < count; i++) {
        RelativeDateTime.parse("2015-05-06T09:28:42")
      }
    }
  }
}
