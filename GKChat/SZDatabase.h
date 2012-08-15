//
//  SZDatabase.h
//  GKChat
//
//  Created by admin on 8/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreData/CoreData.h"

@interface SZDatabase : NSObject

@property (strong, nonatomic) NSPersistentStoreCoordinator *PSC;
@property (strong, nonatomic) NSManagedObjectContext *MOC;
@property (strong, nonatomic) NSManagedObjectModel *MOM;

@end
