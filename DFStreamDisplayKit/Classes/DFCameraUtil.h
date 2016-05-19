//
//  DFCameraUtil.h
//  Pods
//
//  Created by Douma Fang on 16/5/17.
//
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@class GPUImageView;
@class GPUImageVideoCamera;

@interface DFCameraUtil : NSObject

// Focusing and Exposure on tap
+ (void)captureDevice:(AVCaptureDevice *)device focusWithMode:(AVCaptureFocusMode)focusMode exposeWithMode:(AVCaptureExposureMode)exposureMode atDevicePoint:(CGPoint)point monitorSubjectAreaChange:(BOOL)monitorSubjectAreaChange;

// Convert tap's coordinates in preview view to the coordinate space of the capture device
+ (CGPoint)captureDevicePointOfInterestForPoint:(CGPoint)point inPreview:(GPUImageView *)previewView withVideoCamera:(GPUImageVideoCamera *)videoCamera;
@end
