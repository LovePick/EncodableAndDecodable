//
//  Post.swift
//  EncodableAndDecodable
//
//  Created by T2P mac mini on 19/8/2563 BE.
//  Copyright © 2563 pucknavin. All rights reserved.
//

import Foundation

struct Post: Encodable, Decodable{
    let userId:Int?
    let id:Int?
    let title:String?
    let body:String?
}
