# DFStreamDisplayKit

## 介绍

鉴于在完成直播需求的时候需要对摄像头采集的画面加滤镜，于是我在VideoCore的基础上实现了DFStreamDisplayKit.

集成了推流与上传的功能。

DFStreamDisplayKit是一个桥梁，能够沟通GPUImage和VideoCore，原理是构建一个Util类，然后将RawData的output输出到filter上。

这样就OK了。



