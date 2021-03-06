//
//  learniosUITests.swift
//  learniosUITests
//
//  Created by 万琳莉 on 01/03/2018.
//  Copyright © 2018 Linli. All rights reserved.
//

import XCTest

class learniosUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLogin() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        let emailAddressJd2920ColumbiaEduTextField = app.textFields["Email Address: jd2920@columbia.edu"]
        emailAddressJd2920ColumbiaEduTextField.tap()
        emailAddressJd2920ColumbiaEduTextField.typeText("tc000@columbia.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("appple")
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .button)["Login"].tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element.tap()
        app.navigationBars["Listing"].buttons["Market Listings"].tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["My Listings"].tap()
        tabBarsQuery.buttons["My Profile"].tap()
        app.buttons["Log Out"].tap()
        
        let app2 = app
        app2/*@START_MENU_TOKEN@*/.buttons["Register"]/*[[".segmentedControls.buttons[\"Register\"]",".buttons[\"Register\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["Name: John Dough"].tap()
    }
    
    func testRegister() {
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.buttons["Register"]/*[[".segmentedControls.buttons[\"Register\"]",".buttons[\"Register\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let nameJohnDoughTextField = app.textFields["Name: John Dough"]
        nameJohnDoughTextField.tap()
        nameJohnDoughTextField.typeText("Tim Cook")
        
        let emailAddressJd2920ColumbiaEduTextField = app.textFields["Email Address: jd2920@columbia.edu"]
        emailAddressJd2920ColumbiaEduTextField.tap()
        emailAddressJd2920ColumbiaEduTextField.tap()
        emailAddressJd2920ColumbiaEduTextField.typeText("tc000@columbia.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("appple")
        
        let registerButton = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .button)["Register"]
        registerButton.tap()
        
        app.tabBars.buttons["My Profile"].tap()
        app.buttons["Log Out"].tap()
        
    }
    func testMarketListing() {
    
        let app = XCUIApplication()
        let emailAddressJd2920ColumbiaEduTextField = app.textFields["Email Address: jd2920@columbia.edu"]
        emailAddressJd2920ColumbiaEduTextField.tap()
        emailAddressJd2920ColumbiaEduTextField.typeText("tc000@columbia.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("appple")
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .button)["Login"].tap()
        app.tabBars.buttons["Market Listings"].tap()
        app.navigationBars["Market Listings"].buttons["CartButton"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Brush my teeth"]/*[[".cells.staticTexts[\"Brush my teeth\"]",".staticTexts[\"Brush my teeth\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Walk the dog"]/*[[".cells.staticTexts[\"Walk the dog\"]",".staticTexts[\"Walk the dog\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Shopping cart"].buttons["Cancel"].tap()
    }
    func testMyListing() {
        let app = XCUIApplication()
        let emailAddressJd2920ColumbiaEduTextField = app.textFields["Email Address: jd2920@columbia.edu"]
        emailAddressJd2920ColumbiaEduTextField.tap()
        emailAddressJd2920ColumbiaEduTextField.typeText("tc000@columbia.edu")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("appple")
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .button)["Login"].tap()
        app.tabBars.buttons["My Listings"].tap()
        app.collectionViews.cells.otherElements.containing(.image, identifier:"01").element.tap()
        app.navigationBars["My Listing"].buttons["My Listings"].tap()
        app.navigationBars["My Listings"].buttons["New"].tap()
        app.sheets.buttons["Use Existing"].tap()
    }
}


