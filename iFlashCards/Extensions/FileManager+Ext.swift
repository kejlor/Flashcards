//
//  FileManager+Ext.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 03/04/2022.
//

import Foundation

extension FileManager {
    private static let fileName = "decks.json"
    private static let sharedFileName = "sharedDeck.json"
    static var docDirUrl: URL {
        `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    private static let url = docDirUrl.appendingPathComponent(fileName)
    private static let sharedUrl = docDirUrl.appendingPathComponent(sharedFileName)
    
    func readFile() throws -> Data {
        do {
            return try Data(contentsOf: Self.url)
        } catch {
            print("Error while fetching JSON: \(error)")
            throw error
        }
    }
    
    func saveFile(contents: String) throws {
        do {
            try contents.write(to: Self.url, atomically: true, encoding: .utf8)
        } catch {
            print("Error while saving JSON: \(error)")
        }
    }
    
    func saveSharedFile(contents: String) throws {
        do {
            try contents.write(to: Self.sharedUrl, atomically: true, encoding: .utf8)
        } catch {
            print("Error while saving JSON: \(error)")
        }
    }
}
