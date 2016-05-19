//
//  DFViewController.m
//  DFiveStreaming
//
//  Created by Douma Fang on 05/16/2016.
//

#import "GPUImage.h"
#import "ViewController.h"
#import "DFRawDataOutput.h"
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController {
    GPUImageVideoCamera *_videoCamera;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset1280x720 cameraPosition:AVCaptureDevicePositionFront];
    _videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    _videoCamera.frameRate = 20;
    
    CGSize viewSize = self.view.frame.size;
    GPUImageView *filteredVideoView = [[GPUImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, viewSize.width, viewSize.height)];
    [self.view addSubview:filteredVideoView];
    
    [_videoCamera addTarget:filteredVideoView];
    CGSize size = CGSizeMake(720, 1280);
    DFRawDataOutput *rawDataOutput = [[DFRawDataOutput alloc] initWithVideoCamera:_videoCamera withImageSize:size];
    [_videoCamera addTarget:rawDataOutput];
    
    NSString *pathToMovie = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Movie.m4v"];
    unlink([pathToMovie UTF8String]); 
    NSURL *movieURL = [NSURL fileURLWithPath:pathToMovie];
    GPUImageMovieWriter *movieWriter = [[GPUImageMovieWriter alloc] initWithMovieURL:movieURL size:size];
    movieWriter.encodingLiveVideo = YES;
    [_videoCamera addTarget:movieWriter];
    
    [_videoCamera startCameraCapture];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void) {
        _videoCamera.audioEncodingTarget = movieWriter;
        [movieWriter startRecording];
        [rawDataOutput startUploadStreamWithURL:@"rtmp://a.rtmp.youtube.com/live2" andStreamKey:@"323c-p07x-2g2e-c57k"];
        
        
        //自定义
        
        
        
        
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 120.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void) {
            [_videoCamera removeTarget:movieWriter];
            _videoCamera.audioEncodingTarget = nil;
            [movieWriter finishRecording];
            NSLog(@"Movie completed");
            
            ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
            if ([library videoAtPathIsCompatibleWithSavedPhotosAlbum:movieURL]) {
                [library writeVideoAtPathToSavedPhotosAlbum:movieURL completionBlock:^(NSURL *assetURL, NSError *error) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (error) {
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Video Saving Failed"
                                                                           delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            [alert show];
                        } else {
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Video Saved" message:@"Saved To Photo Album"
                                                                           delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            [alert show];
                        }
                    });
                }];
            }
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
