//
//  LyricsGenerator.swift
//  SillySong
//
//  Created by Boxuan Zhang on 2/13/17.
//  Copyright © 2017 Boxuan Zhang. All rights reserved.
//

import XCTest
@testable import SillySong

class LyricsGeneratorTests: XCTestCase {
  
    let sut = LyricsGenerator()
    
    func testGenerateLyricWithDefaultTemplate() {
        let expected = [
            "Nate, Nate, Bo Bate",
            "Banana Fana Fo Fate",
            "Me My Mo Mate",
            "Nate"
        ].joined(separator: "\n")
        let actual = sut.lyrics(for: "Nate")
        
        XCTAssertEqual(actual, expected)
    }

    func testGenerateLyricWithCustomizedTemplate() {
        let template = "<FULL_NAME> and T<SHORT_NAME>"
        
        let expected = "Nate and Tate"
        let actual = sut.lyrics(for: "Nate", withTemplate: template)
        
        XCTAssertEqual(actual, expected)
    }
    
    func testGenerateLyricForNameWithSpecialCharacter() {
        let expected = [
            "Zöe, Zöe, Bo Böe",
            "Banana Fana Fo Föe",
            "Me My Mo Möe",
            "Zöe"
        ].joined(separator: "\n")
        let actual = sut.lyrics(for: "Zöe")
        
        XCTAssertEqual(actual, expected)
    }
    
    func testGenerateLyricForNonVowelName() {
        let expected = [
            "Bcd, Bcd, Bo Bbcd",
            "Banana Fana Fo Fbcd",
            "Me My Mo Mbcd",
            "Bcd"
        ].joined(separator: "\n")
        let actual = sut.lyrics(for: "Bcd")
        
        XCTAssertEqual(actual, expected)
    }
}
