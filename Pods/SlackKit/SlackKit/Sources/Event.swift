//
// Message.swift
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

internal enum EventType: String {
    case Hello = "hello"
    case Message = "message"
    case UserTyping = "user_typing"
    case ChannelMarked = "channel_marked"
    case ChannelCreated = "channel_created"
    case ChannelJoined = "channel_joined"
    case ChannelLeft = "channel_left"
    case ChannelDeleted = "channel_deleted"
    case ChannelRenamed = "channel_rename"
    case ChannelArchive = "channel_archive"
    case ChannelUnarchive = "channel_unarchive"
    case ChannelHistoryChanged = "channel_history_changed"
    case DNDUpdated = "dnd_updated"
    case DNDUpatedUser = "dnd_updated_user"
    case IMCreated = "im_created"
    case IMOpen = "im_open"
    case IMClose = "im_close"
    case IMMarked = "im_marked"
    case IMHistoryChanged = "im_history_changed"
    case GroupJoined = "group_joined"
    case GroupLeft = "group_left"
    case GroupOpen = "group_open"
    case GroupClose = "group_close"
    case GroupArchive = "group_archive"
    case GroupUnarchive = "group_unarchive"
    case GroupRename = "group_rename"
    case GroupMarked = "group_marked"
    case GroupHistoryChanged = "group_history_changed"
    case FileCreated = "file_created"
    case FileShared = "file_shared"
    case FileUnshared = "file_unshared"
    case FilePublic = "file_public"
    case FilePrivate = "file_private"
    case FileChanged = "file_change"
    case FileDeleted = "file_deleted"
    case FileCommentAdded = "file_comment_added"
    case FileCommentEdited = "file_comment_edited"
    case FileCommentDeleted = "file_comment_deleted"
    case PinAdded = "pin_added"
    case PinRemoved = "pin_removed"
    case PresenceChange = "presence_change"
    case ManualPresenceChange = "manual_presence_change"
    case PrefChange = "pref_change"
    case UserChange = "user_change"
    case TeamJoin = "team_join"
    case StarAdded = "star_added"
    case StarRemoved = "star_removed"
    case ReactionAdded = "reaction_added"
    case ReactionRemoved = "reaction_removed"
    case EmojiChanged = "emoji_changed"
    case CommandsChanged = "commands_changed"
    case TeamPlanChange = "team_plan_change"
    case TeamPrefChange = "team_pref_change"
    case TeamRename = "team_rename"
    case TeamDomainChange = "team_domain_change"
    case EmailDomainChange = "email_domain_change"
    case BotAdded = "bot_added"
    case BotChanged = "bot_changed"
    case AccountsChanged = "accounts_changed"
    case TeamMigrationStarted = "team_migration_started"
    case SubteamCreated = "subteam_created"
    case SubteamUpdated = "subteam_updated"
    case SubteamSelfAdded = "subteam_self_added"
    case SubteamSelfRemoved = "subteam_self_removed"
    case Ok = "ok"
    case Error = "error"
}

internal enum MessageSubtype: String {
    case BotMessage = "bot_message"
    case MeMessage = "me_message"
    case MessageChanged = "message_changed"
    case MessageDeleted = "message_deleted"
    case ChannelJoin = "channel_join"
    case ChannelLeave = "channel_leave"
    case ChannelTopic = "channel_topic"
    case ChannelPurpose = "channel_purpose"
    case ChannelName = "channel_name"
    case ChannelArchive = "channel_archive"
    case ChannelUnarchive = "channel_unarchive"
    case GroupJoin = "group_join"
    case GroupLeave = "group_leave"
    case GroupTopic = "group_topic"
    case GroupPurpose = "group_purpose"
    case GroupName = "group_name"
    case GroupArchive = "group_archive"
    case GroupUnarchive = "group_unarchive"
    case FileShare = "file_share"
    case FileComment = "file_comment"
    case FileMention = "file_mention"
    case PinnedItem = "pinned_item"
    case UnpinnedItem = "unpinned_item"
}

internal struct Event {
    
    let type: EventType?
    let ts: String?
    let subtype: String?
    let channelID: String?
    let text: String?
    let eventTs: String?
    let latest: String?
    let hidden: Bool?
    let isStarred: Bool?
    let hasPins: Bool?
    let pinnedTo: [String]?
    let fileID: String?
    let presence: String?
    let name: String?
    let value: AnyObject?
    let plan: String?
    let url: String?
    let domain: String?
    let emailDomain: String?
    let reaction: String?
    let replyTo: Double?
    let reactions: [[String: AnyObject]]?
    let edited: Edited?
    let bot: Bot?
    let channel: Channel?
    let comment: Comment?
    let user: User?
    let file: File?
    let message: Message?
    let nestedMessage: Message?
    let item: Item?
    let dndStatus: DoNotDisturbStatus?
    let subteam: UserGroup?
    let subteamID: String?
    
    init(event:[String: AnyObject]) {
        if let eventType = event["type"] as? String {
            type = EventType(rawValue:eventType)
        } else {
            type = EventType(rawValue: "ok")
        }
        ts = event["ts"] as? String
        subtype = event["subtype"] as? String
        channelID = event["channel_id"] as? String
        text = event["text"] as? String
        eventTs = event["event_ts"] as? String
        latest = event["latest"] as? String
        hidden = event["hidden"] as? Bool
        isStarred = event["is_starred"] as? Bool
        hasPins = event["has_pins"] as? Bool
        pinnedTo = event["pinned_top"] as? [String]
        fileID = event["file_id"] as? String
        presence = event["presence"] as? String
        name = event["name"] as? String
        value = event["value"]
        plan = event["plan"] as? String
        url = event["url"] as? String
        domain = event["domain"] as? String
        emailDomain = event["email_domain"] as? String
        reaction = event["reaction"] as? String
        replyTo = event["reply_to"] as? Double
        reactions = event["reactions"] as? [[String: AnyObject]]
        bot = Bot(bot: event["bot"] as? [String: AnyObject])
        edited = Edited(edited:event["edited"] as? [String: AnyObject])
        dndStatus = DoNotDisturbStatus(status: event["dnd_status"] as? [String: AnyObject])
        item = Item(item: event["item"] as? [String: AnyObject])
        subteam = UserGroup(userGroup: event["subteam"] as? [String: AnyObject])
        subteamID = event["subteam_id"] as? String
        message = Message(message: event)
        nestedMessage = Message(message: event["message"] as? [String: AnyObject])
        
        // Comment, Channel, User, and File can come across as Strings or Dictionaries
        if (Comment(comment: event["comment"] as? [String: AnyObject])?.id == nil) {
            comment = Comment(id: event["comment"] as? String)
        } else {
            comment = Comment(comment: event["comment"] as? [String: AnyObject])
        }
        
        if (User(user: event["user"] as? [String: AnyObject])?.id == nil) {
            user = User(id: event["user"] as? String)
        } else {
            user = User(user: event["user"] as? [String: AnyObject])
        }
        
        if (File(file: event["file"] as? [String: AnyObject])?.id == nil) {
            file = File(id: event["file"] as? String)
        } else {
            file = File(file: event["file"] as? [String: AnyObject])
        }
        
        if (Channel(channel: event["channel"] as? [String: AnyObject])?.id == nil) {
            channel = Channel(id: event["channel"] as? String)
        } else {
            channel = Channel(channel: event["channel"] as? [String: AnyObject])
        }
    }
    
}
