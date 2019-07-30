//
//  GeneralApi.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 5/21/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import Foundation

class GeneralApi {
    var channels_name: String?
    var channels_rtmp: String?
    var channels_image: String?
    
    
    
    
    init(channels_name: String?, channels_rtmp: String?, channels_image: String?) {
        self.channels_name = channels_name
        self.channels_rtmp = channels_rtmp
        self.channels_image = channels_image
        
    }
}
