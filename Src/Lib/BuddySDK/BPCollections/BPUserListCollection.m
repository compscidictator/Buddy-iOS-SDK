//
//  BPUserListCollection.m
//  BuddySDK
//
//  Created by Nick Ambrose on 5/24/14.
//
//

#import "BPUserListCollection.h"
#import "BuddyCollection+Private.h"
#import "BuddyObject+Private.h"

@implementation BPUserListCollection

- (instancetype)initWithClient:(id<BPRestProviderOld>)client{
    self = [super initWithClient:client];
    if(self){
        self.type = [BPUserList class];
    }
    return self;
}

- (void)addUserList:(BPUserList *)userList
           callback:(BuddyCompletionCallback)callback
{
    [userList savetoServerWithClient:self.client callback:callback];
}

- (void)getUserList:(NSString *)userListId callback:(BuddyObjectCallback)callback
{
    [self getItem:userListId callback:callback];
}

- (void)searchUserLists:(BPSearchUserList *)searchUserList callback:(BPSearchCallback)callback
{
    id parameters = [searchUserList parametersFromDirtyProperties];
    
    [self search:parameters callback:callback];
}

@end
