//
// File.swift
//
// Copyright © 2016 Peter Zignego. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

public struct File {

    public let id: String?
    public let created: Int?
    public let name: String?
    public let title: String?
    public let mimeType: String?
    public let fileType: String?
    public let prettyType: String?
    public let user: String?
    public let mode: String?
    internal(set) public var editable: Bool?
    public let isExternal: Bool?
    public let externalType: String?
    public let size: Int?
    public let urlPrivate: String?
    public let urlPrivateDownload: String?
    public let thumb64: String?
    public let thumb80: String?
    public let thumb360: String?
    public let thumb360gif: String?
    public let thumb360w: String?
    public let thumb360h: String?
    public let permalink: String?
    public let editLink: String?
    public let preview: String?
    public let previewHighlight: String?
    public let lines: Int?
    public let linesMore: Int?
    internal(set) public var isPublic: Bool?
    internal(set) public var publicSharedURL: Bool?
    internal(set) public var channels: [String]?
    internal(set) public var groups: [String]?
    internal(set) public var ims: [String]?
    public let initialComment: Comment?
    internal(set) public var stars: Int?
    internal(set) public var isStarred: Bool?
    internal(set) public var pinnedTo: [String]?
    internal(set) public var comments = [String: Comment]()
    internal(set) public var reactions = [String: Reaction]()
    
    init?(file:[String: AnyObject]?) {
        id = file?["id"] as? String
        created = file?["created"] as? Int
        name = file?["name"] as? String
        title = file?["title"] as? String
        mimeType = file?["mimetype"] as? String
        fileType = file?["filetype"] as? String
        prettyType = file?["pretty_type"] as? String
        user = file?["user"] as? String
        mode = file?["mode"] as? String
        editable = file?["editable"] as? Bool
        isExternal = file?["is_external"] as? Bool
        externalType = file?["external_type"] as? String
        size = file?["size"] as? Int
        urlPrivate = file?["url_private"] as? String
        urlPrivateDownload = file?["url_private_download"] as? String
        thumb64 = file?["thumb_64"] as? String
        thumb80 = file?["thumb_80"] as? String
        thumb360 = file?["thumb_360"] as? String
        thumb360gif = file?["thumb_360_gif"] as? String
        thumb360w = file?["thumb_360_w"] as? String
        thumb360h = file?["thumb_360_h"] as? String
        permalink = file?["permalink"] as? String
        editLink = file?["edit_link"] as? String
        preview = file?["preview"] as? String
        previewHighlight = file?["preview_highlight"] as? String
        lines = file?["lines"] as? Int
        linesMore = file?["lines_more"] as? Int
        isPublic = file?["is_public"] as? Bool
        publicSharedURL = file?["public_url_shared"] as? Bool
        channels = file?["channels"] as? [String]
        groups = file?["groups"] as? [String]
        ims = file?["ims"] as? [String]
        initialComment = Comment(comment: file?["initial_comment"] as? [String: AnyObject])
        stars = file?["num_stars"] as? Int
        isStarred = file?["is_starred"] as? Bool
        pinnedTo = file?["pinned_to"] as? [String]
        if let reactions = file?["reactions"] as? [[String: AnyObject]] {
            self.reactions = Reaction.reactionsFromArray(reactions)
        }
        
    }
    
    init?(id:String?) {
        self.id = id
        created = nil
        name = nil
        title = nil
        mimeType = nil
        fileType = nil
        prettyType = nil
        user = nil
        mode = nil
        isExternal = nil
        externalType = nil
        size = nil
        urlPrivate = nil
        urlPrivateDownload = nil
        thumb64 = nil
        thumb80 = nil
        thumb360 = nil
        thumb360gif = nil
        thumb360w = nil
        thumb360h = nil
        permalink = nil
        editLink = nil
        preview = nil
        previewHighlight = nil
        lines = nil
        linesMore = nil
        initialComment = nil
    }
}

extension File: Equatable {}

public func ==(lhs: File, rhs: File) -> Bool {
    return lhs.id == rhs.id
}
    