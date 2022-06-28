//
//  YoutubeSearchResponse.swift
//  NetflixClone
//
//  Created by LAP15516 on 28/06/2022.
//

import Foundation


/*
 {
etag = LDJZXtaFAC2Urhg2HhQ8d5RPka0;
id =             {
 kind = "youtube#video";
 videoId = SNkwT1DfmVU;
};
kind = "youtube#searchResult";
},
 
 
 */


struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
