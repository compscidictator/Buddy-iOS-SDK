//
//  BPVideo.m
//  BuddySDK
//
//  Created by Erik.Kerber on 3/5/14.
//
//

#import "BPVideo.h"
#import "BPSisterObject.h"

@implementation BPVideo
@synthesize title;
@synthesize friendlyName;
@synthesize thumbnailOffsetInSeconds;

- (void)registerProperties
{
    [super registerProperties];
    
    [self registerProperty:@selector(caption)];
}

static NSString *videos = @"videos";
+(NSString *) requestPath{
    return videos;
}

+ (void)createWithVideo:(NSData *)video
          describeVideo:(DescribeVideo)describeVideo
                 client:(id<BPRestProvider>)client
               callback:(BuddyObjectCallback)callback
{
    id videoProperties = [BPSisterObject new];
    describeVideo ? describeVideo(videoProperties) : nil;
    
    id parameters = [videoProperties parametersFromProperties:@protocol(BPVideoProperties)];
    
    [self createWithData:video parameters:parameters client:client callback:^(id newBuddyObject, NSError *error) {
        callback ? callback(newBuddyObject, error) : nil;
    }];
}

- (void)getVideo:(BuddyDataResponse)callback
{
    [self getData:^(NSData *data, NSError *error) {
        callback ? callback(data, error) : nil;
    }];
}


@end
