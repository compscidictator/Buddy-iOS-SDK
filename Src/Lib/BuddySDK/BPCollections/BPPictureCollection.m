//
//  BPPictureCollection.m
//  BuddySDK
//
//  Created by Erik Kerber on 11/22/13.
//
//

#import "BPPictureCollection.h"
#import "BPPicture.h"
#import "BPClient.h"
#import "BuddyObject+Private.h"
#import "BuddyCollection+Private.h"
#import "Buddy.h"

@implementation BPPictureCollection

- (instancetype)initWithClient:(id<BPRestProviderOld>)client {
    self = [super initWithClient:client];
    if(self){
        self.type = [BPPicture class];
    }
    return self;
}

- (void)addPicture:(BPPicture *)picture
             image:(UIImage *)image
          callback:(BuddyCompletionCallback)callback
{
    [picture savetoServerWithImage:image client:self.client callback:callback];
}

-(void)searchPictures:(BPSearchPictures *)searchPictures callback:(BPSearchCallback)callback
{
    id parameters = [searchPictures parametersFromDirtyProperties];
    
    [self search:parameters callback:callback];
}

- (void)getPicture:(NSString *)pictureId callback:(BuddyObjectCallback)callback
{
    [self getItem:pictureId callback:callback];
}

@end
