//
//  UserInfo.h
//  GKChat
//
//  Created by admin on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ChatMessage;

@interface UserInfo : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * userid;
@property (nonatomic, retain) NSSet *chatmessages;
@end

@interface UserInfo (CoreDataGeneratedAccessors)

- (void)addChatmessagesObject:(ChatMessage *)value;
- (void)removeChatmessagesObject:(ChatMessage *)value;
- (void)addChatmessages:(NSSet *)values;
- (void)removeChatmessages:(NSSet *)values;

@end
