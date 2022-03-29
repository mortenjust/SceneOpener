//
//  SCNScene + Open in Xcode.swift
//
//  Created by Morten Just on 3/29/22.
//

import Foundation
import SceneKit

extension SCNScene {
    
    /// Open the current scene in the default app for .scn files (defaults to Xcode). Requires file access.
    public func openCurrentSceneInDefaultApp() {
        let destUrl = FileManager.default
            .urls(for: .cachesDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("Debug Scene \(UUID().uuidString).scn")
        
            write(to: destUrl,
                    options: nil,
                    delegate: nil) { progress, err, _ in
            print("savescn:", progress)
            if progress == 1 {
                NSWorkspace.shared.open(destUrl)
            }
        }
    }
}
