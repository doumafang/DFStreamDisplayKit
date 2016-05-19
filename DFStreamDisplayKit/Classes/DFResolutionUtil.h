//
//  Created by Douma Fang on 16/5/18.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

struct DFRange {
  CGFloat min;
  CGFloat max;
};
typedef struct DFRange DFRange;
struct DFResolution {
  CGSize size;
  struct DFRange bitrate;
};
typedef struct DFResolution DFResolution;

extern const struct DFResolution DFResolution1440p60fps;
extern const struct DFResolution DFResolution1440p;
extern const struct DFResolution DFResolution1080p60fps;
extern const struct DFResolution DFResolution1080p;
extern const struct DFResolution DFResolution720p60fps;
extern const struct DFResolution DFResolution720p;
extern const struct DFResolution DFResolution480p;
extern const struct DFResolution DFResolution360p;
extern const struct DFResolution DFResolution240p;

@interface DFResolutionUtil : NSObject
+ (CGSize)videoSize:(NSString *)sessionPreset isPortrait:(BOOL)isPortrait;

+ (float)videoWidth:(NSString *)sessionPreset;

+ (float)videoHeight:(NSString *)sessionPreset;
@end