//
//  FileManager.swift
//  BucketList
//
//  Created by slava bily on 6/5/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import Foundation

extension FileManager {
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func record(string: String, fileName: String) {
        let url = self.getDocumentsDirectory().appendingPathComponent(fileName)
        do {
            try string.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func read(fileName: String) -> String {
        let url = self.getDocumentsDirectory().appendingPathComponent(fileName)
        let input: String
        do {
            input = try String(contentsOf: url)
            return input
        } catch {
            return error.localizedDescription
        }
     }
 }
