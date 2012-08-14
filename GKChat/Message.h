//
//  Message.h
//  GKChat
//
//  Created by admin on 8/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Message : NSManagedObject

@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSManagedObject *sender;
@property (nonatomic, retain) NSManagedObject *receiver;

@end
