//
//  Camera.m
//  ZpzchinaMobile
//
//  Created by 汪洋 on 14-6-30.
//  Copyright (c) 2014年 汪洋. All rights reserved.
//

#import "Camera.h"
@implementation Camera
@synthesize delegate;
-(void)getCameraView:(UIViewController *)viewController flag:(int)flag{
    cameraFlag = flag;
    if(flag == 0){
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
        {
            pickerController = [[UIImagePickerController alloc] init];
            pickerController.delegate = self;
            //设置拍照后的图片可被编辑
            pickerController.allowsEditing = YES;
            pickerController.sourceType = sourceType;
            
            [viewController presentViewController:pickerController animated:YES completion:Nil];
        }else{
            NSLog(@"模拟其中无法打开照相机,请在真机中使用");
        }
    }else{
        pickerController= [[UIImagePickerController alloc] init];
        pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        pickerController.delegate = self;
        //设置选择后的图片可被编辑
        pickerController.allowsEditing = YES;
        [viewController presentViewController:pickerController animated:YES completion:nil];
    }
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:Nil];
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.image"]) {
        UIImage *photo = [info objectForKey:UIImagePickerControllerEditedImage];
        if(cameraFlag ==0){
            UIImageWriteToSavedPhotosAlbum(photo, self, nil, nil);
        }
        [self setBigImage:photo];
    }
}

-(void)setBigImage:(UIImage *)img{
    [pickerController dismissViewControllerAnimated:YES completion:Nil];
    if([delegate respondsToSelector:@selector(setBigImage:)]){
        [delegate setBigImage:img];
    }
}
@end
