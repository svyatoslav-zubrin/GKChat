//
//  SZConnectionManager.h
//  GKChat
//
//  Created by admin on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SZConnectionManagerDelegate

- (void)connectionDidReceiveData:(NSData *)data;

@end


@interface SZConnectionManager : NSObject <GKPeerPickerControllerDelegate, GKSessionDelegate>

@property (nonatomic, assign) id<SZConnectionManagerDelegate> connectionDelegate; 

+ (id)sharedManager;

- (void)sendData:(NSData *)data;
- (void)setConnection;

@end
