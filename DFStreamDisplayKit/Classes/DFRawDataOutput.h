//
//  Created by Douma Fang on 16/5/17.
// Copyright (c) 2016 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DFStreamUploader.h"
#import "GPUImage.h"

@class GPUImageVideoCamera;
@protocol GPUImageAudioEncodingTarget
- (BOOL)hasAudioTrack;

- (void)processAudioBuffer:(CMSampleBufferRef)audioBuffer;
@end

@interface DFRawDataOutput : GPUImageRawDataOutput <DFStreamUploader>

- (instancetype)initWithVideoCamera:(GPUImageVideoCamera *)camera withImageSize:(CGSize)newImageSize;

@end