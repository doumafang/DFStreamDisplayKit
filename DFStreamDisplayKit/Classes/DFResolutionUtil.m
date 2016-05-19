//
//  Created by Douma Fang on 16/5/17.
//

#import "DFResolutionUtil.h"


const struct DFResolution DFResolution1440p60fps = {
    .size = {.width = 2560.f, .height = 1440.f},
    .bitrate = {.min = 9000, .max = 18000}
};
const struct DFResolution DFResolution1440p = {
    .size = {.width = 2560.f, .height = 1440.f},
    .bitrate = {.min = 6000, .max = 13000}
};
const struct DFResolution DFResolution1080p60fps = {
    .size = {.width = 1920.f, .height = 1080.f},
    .bitrate = {.min = 4500, .max = 9000}
};
const struct DFResolution DFResolution1080p = {
    .size = {.width = 1920.f, .height = 1080.f},
    .bitrate = {.min = 3000, .max = 6000}
};
const struct DFResolution DFResolution720p60fps = {
    .size = {.width = 1280.f, .height = 720.f},
    .bitrate = {.min = 2250, .max = 6000}
};
const struct DFResolution DFResolution720p = {
    .size = {.width = 1280.f, .height = 720.f},
    .bitrate = {.min = 1500, .max = 4000}
};
const struct DFResolution DFResolution480p = {
    .size = {.width = 854.f, .height = 480.f},
    .bitrate = {.min = 500, .max = 2000}
};
const struct DFResolution DFResolution360p = {
    .size = {.width = 640.f, .height = 360.f},
    .bitrate = {.min = 400, .max = 1000}
};
const struct DFResolution DFResolution240p = {
    .size = {.width = 426.f, .height = 240.f},
    .bitrate = {.min = 300, .max = 700}
};

@implementation DFResolutionUtil {

}

+ (CGSize)videoSize:(NSString *)sessionPreset isPortrait:(BOOL)isPortrait {
  float width = [self videoWidth:sessionPreset];
  float height = [self videoHeight:sessionPreset];
  return isPortrait ? CGSizeMake(height, width) : CGSizeMake(width, height);
}

+ (float)videoWidth:(NSString *)sessionPreset {
  if ([AVCaptureSessionPreset1920x1080 isEqualToString:sessionPreset]) {
    return 1920;
  } else if ([AVCaptureSessionPreset1280x720 isEqualToString:sessionPreset]) {
    return 1280;
  } else if ([AVCaptureSessionPreset640x480 isEqualToString:sessionPreset]) {
    return 640;
  } else if ([AVCaptureSessionPreset352x288 isEqualToString:sessionPreset]) {
    return 352;
  } else {
    return 0;
  }
}

+ (float)videoHeight:(NSString *)sessionPreset {
  if ([AVCaptureSessionPreset1920x1080 isEqualToString:sessionPreset]) {
    return 1080;
  } else if ([AVCaptureSessionPreset1280x720 isEqualToString:sessionPreset]) {
    return 720;
  } else if ([AVCaptureSessionPreset640x480 isEqualToString:sessionPreset]) {
    return 480;
  } else if ([AVCaptureSessionPreset352x288 isEqualToString:sessionPreset]) {
    return 288;
  } else {
    return 0;
  }
}
@end