//
//  BPVideoCollection.m
//  BuddySDK
//
//  Created by Erik.Kerber on 3/5/14.
//
//

#import "BPVideoCollection.h"
#import "BPVideo.h"
#import "BuddyCollection+Private.h"

@implementation BPVideoCollection

- (instancetype)initWithClient:(id<BPRestProviderOld>)client {
    self = [super initWithClient:client];
    if(self){
        self.type = [BPVideo class];
    }
    return self;
}

- (void)addVideo:(BPVideo *)video
       videoData:(NSData *)videoData
        callback:(BuddyCompletionCallback)callback
{
    [video savetoServerWithData:videoData client:self.client callback:callback];
}

- (void)searchVideos:(BPVideoSearch *)searchVideo callback:(BPSearchCallback)callback;
{
    id parameters = [searchVideo parametersFromDirtyProperties];
    
    [self search:parameters callback:callback];
}

- (void)getVideo:(NSString *)pictureId callback:(BuddyObjectCallback)callback
{
    [self getItem:pictureId callback:callback];
}

@end
