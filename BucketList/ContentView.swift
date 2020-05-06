//
//  ContentView.swift
//  BucketList
//
//  Created by slava bily on 5/5/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
     }
 
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
        ].sorted()
    
    var body: some View {
        Text("Hello World")
            .onTapGesture {
                let str = "Test Message"
 
                // MARK:  test of FileManager
                let fileManager = FileManager()
                // recording to file
                fileManager.record(string: str, fileName: "message.txt")
                // reading from file
                let input = fileManager.read(fileName: "message.txt")
                print(input)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
