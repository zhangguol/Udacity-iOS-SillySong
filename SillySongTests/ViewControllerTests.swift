//
//  ViewControllerTests.swift
//  SillySong
//
//  Created by Boxuan Zhang on 2/13/17.
//  Copyright © 2017 Boxuan Zhang. All rights reserved.
//

import XCTest
@testable import SillySong

class ViewControllerTests: XCTestCase {
   
    var sut: ViewController!
    
    override func setUp() {
        super.setUp()
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        _ = sut.view
    }
    
    func testNameFieldDelegate() {
        XCTAssertTrue(sut.nameField.delegate === sut)
    }
    
    func testReset() {
        sut.nameField.text = "TestName"
        sut.lyricsView.text = "TestLyrics"
        
        sut.nameField.sendActions(for: .editingDidBegin)
        
        XCTAssertTrue(sut.nameField.text == "")
        XCTAssertTrue(sut.lyricsView.text == "")
    }
    
    func testDisplayLyricsForAValidName() {
        let expected = [
            "Nate, Nate, Bo Bate",
            "Banana Fana Fo Fate",
            "Me My Mo Mate",
            "Nate"
        ].joined(separator: "\n")
        
        sut.nameField.text = "Nate"
        sut.nameField.sendActions(for: .editingDidEnd)
       
        XCTAssertTrue(sut.lyricsView.text == expected)
    }
    
    func testDisplayLyricsForAnEmptyName() {
        sut.nameField.text = ""
        sut.nameField.sendActions(for: .editingDidEnd)
       
        XCTAssertTrue(sut.lyricsView.text == "")
    }
    
    func testTextFieldShouldReturn() {
        let mockField = MockTextField()
        sut.nameField = mockField
        
        let actual = sut.textFieldShouldReturn(sut.nameField)
        
        XCTAssertEqual(actual, false)
        XCTAssertTrue(mockField.resignFirstResponder_wasCalled)
    }
}

fileprivate extension ViewControllerTests {
    class MockTextField: UITextField {
        var resignFirstResponder_wasCalled = false
        fileprivate override func resignFirstResponder() -> Bool {
            resignFirstResponder_wasCalled = true
            return super.resignFirstResponder()
        }
    }
}
