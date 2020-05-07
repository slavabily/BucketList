//
//  ContentView.swift
//  BucketList
//
//  Created by slava bily on 5/5/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI
import LocalAuthentication
 
struct ContentView: View {
    @State private var isUnlocked = false
     
    var body: some View {
        VStack {
            if self.isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
    .onAppear(perform: authenticate)
         
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        // check wether biometroc authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, authenticationError) in
                // authentication has now completed
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        // there was a problem
                    }
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
