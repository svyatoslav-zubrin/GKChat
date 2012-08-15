//
//  SZConnectionManager.m
//  GKChat
//
//  Created by admin on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SZConnectionManager.h"

// ------------------------------------------------------------
@interface SZConnectionManager()

@property (strong, nonatomic) GKSession *current_session;
@property (strong, nonatomic) GKPeerPickerController *peerPicker;

@end


// ------------------------------------------------------------
static SZConnectionManager *defaultManager;
static NSString *peerID;

@implementation SZConnectionManager

@synthesize current_session;
@synthesize peerPicker;
@synthesize connectionDelegate;

+ (id)sharedManager {
    @synchronized(self) 
    {
        if(defaultManager == nil) {
            defaultManager = [[super allocWithZone:NULL] init];
        }
    }
    return defaultManager;
}


+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedManager];
}


- (id)copyWithZone:(NSZone *)zone {
    return self;
}


-(id)init {
    self = [super init];
    if(self)
    {
        peerID = [[NSString alloc] initWithFormat:@"%@", [[UIDevice currentDevice] name]];
        
        self.peerPicker = [[GKPeerPickerController alloc] init];
        self.peerPicker.delegate = self;
        self.peerPicker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;
        
    }
    return self;
}

#pragma mark - GKPeerPickerControllerDelegate methods

// This creates a unique Connection Type for this particular applictaion
- (GKSession *)peerPickerController:(GKPeerPickerController *)picker sessionForConnectionType:(GKPeerPickerConnectionType)type {
	// Create a session with a unique session ID - displayName:nil = Takes the iPhone Name
	GKSession *session = [[GKSession alloc] initWithSessionID:@"com.qarea.gkchat" displayName:nil sessionMode:GKSessionModePeer];
    return session;
}

// Tells us that the peer was connected
- (void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session {
	
	// Get the session and assign it locally
    self.current_session = session;
    session.delegate = self;
    
    //No need of teh picekr anymore
	picker.delegate = nil;
    [picker dismiss];
}

// Function to receive data when sent from peer
- (void)receiveData:(NSData *)data fromPeer:(NSString *)peer inSession:(GKSession *)session context:(void *)context{
    [self.connectionDelegate connectionDidReceiveData:data];
}

#pragma mark - CGSessionDelegate methods

- (void)session:(GKSession *)session peer:(NSString *)peerID didChangeState:(GKPeerConnectionState)state {
    
	if(state == GKPeerStateConnected){

        // FIXME: for debug
		NSString *str = [NSString stringWithFormat:@"Connected with %@",[session displayNameForPeer:peerID]];
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connected" message:str delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		
		// Used to acknowledge that we will be sending data
		[session setDataReceiveHandler:self withContext:nil];
	}
}

#pragma mark - Custom logic

- (void)sendData:(NSData *)data {
    NSError *error;
    [self.current_session sendDataToAllPeers:data withDataMode:GKSendDataReliable error:&error];
    if (error) {
        NSLog(@"ERROR: %@", error.localizedDescription);
    }
}

- (void)setConnection {
    [peerPicker show];
}

@end
