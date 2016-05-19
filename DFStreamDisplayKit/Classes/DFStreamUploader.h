//
//  Created by Douma Fang on 16/5/19.
//

#import <Foundation/Foundation.h>

@protocol DFStreamUploader <NSObject>
- (void)startUploadStreamWithURL:(NSString *)rtmpUrl andStreamKey:(NSString *)streamKey;

- (void)stopUploadStream;

@end