//
//  ViewController.swift
//  OneKeychain
//
//  Created by Evgenii on 28/05/2016.
//  Copyright © 2016 Evgenii Neumerzhitckii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var label: UILabel!
  
  let keychainWrapper = KeychainTextWrapper()
  let keychainItemKey = "myKey"
  var counter = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Get app id prefix for accessing keychain from Info.plist
    let appIdPrefix = Bundle.main.object(forInfoDictionaryKey: "AppIdentifierPrefix") as! String
    // Uncomment following if hardcoding app id prefix in app.
//    let appIdPrefix = "8XPT93F9Q7"
    print("AppIdPrefix : "+appIdPrefix)

    // keychainAccessIdentifier is the identifier mentioned in entitlements file for keychain-access-groups
    // Uncomment following line if your keychain access group identifier is same as bundleid and comment the next line where we are hardcoding it
//  let keychainAccessIdentifier = Bundle.main.bundleIdentifier as! String
    let keychainAccessIdentifier = "myKeychainGroup1"
    print("keychainAccessIdentifier : "+keychainAccessIdentifier)
//    "8XPT93F9Q7.com.sample.example"
    keychainWrapper.accessGroup = appIdPrefix + keychainAccessIdentifier
  }

  @IBAction func didTapAddButton(_ sender: AnyObject) {
    counter += 1
    keychainWrapper.add(keychainItemKey, itemValue: "myValue \(counter)")
    showKeychainItem()
  }
  
  @IBAction func didTapGetButton(_ sender: AnyObject) {
    label.text = keychainWrapper.find(keychainItemKey)
    showKeychainItem()
  }
  
  fileprivate func showKeychainItem() {
    label.text = keychainWrapper.find(keychainItemKey)
  }
  
  @IBAction func didTapRemoveButton(_ sender: AnyObject) {
    keychainWrapper.delete(keychainItemKey)
    showKeychainItem()
  }

}

