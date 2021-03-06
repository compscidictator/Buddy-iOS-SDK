//
//  BPCheckinCollection.h
//  BuddySDK
//
//  Created by Erik Kerber on 11/15/13.
//
//

#import "BuddyCollection.h"
#import "BPCheckin.h"
#import "BPCoordinate.h"

@interface BPCheckinCollection : BuddyCollection

- (void)addCheckin:(BPCheckin *)checkin
          callback:(BuddyCompletionCallback)callback;

- (void)searchCheckins:(BPSearchCheckins *)searchCheckin callback:(BPSearchCallback)callback;

- (void)getCheckin:(NSString *)checkinId callback:(BuddyObjectCallback)callback;

@end
