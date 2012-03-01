//
//  UIImage+Utility.m
//  ShoppinPal
//
//  Created by Pulkit Singhal on 2/21/12.
//  Copyright (c) 2012 Fermyon Inc. All rights reserved.
//

#import "UIImage+Utility.h"

@implementation UIImage (Utility)
/* The following method is copied from:
 * http://stackoverflow.com/questions/603907/uiimage-resize-then-crop
 * where it was posted by: Brad Larson.
 */
+ (UIImage*)imageWithImage:(UIImage*)image 
              scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/* The following method is copied from:
 * http://stackoverflow.com/questions/9262368/where-is-the-small-medium-large-original-image-funtionality-from-apples-mail
 * where it was posted by: Kashiv.
 */
+ (double) imageSizeInKB : (UIImage*) image
{
    size_t depth = CGImageGetBitsPerPixel(image.CGImage);
    size_t width = CGImageGetWidth(image.CGImage);
    size_t height = CGImageGetHeight(image.CGImage);
    
    double bytes = ((double)width * (double)height * (double)depth) / 8.0;

    double kb = bytes / 1024.0f;

    NSString *msg = [NSString stringWithFormat:
                     @"Original %dx%d (%.2f MB)",
                     (int)width,
                     (int)height,
                     (float)kb];
    NSLog(@"%@", msg);
    return kb;
}

/* The following method is copied from:
 * http://stackoverflow.com/questions/9262368/where-is-the-small-medium-large-original-image-funtionality-from-apples-mail
 * where it was posted by: Kashiv.
 */
+ (double) imageSizeInMB : (UIImage*) image
{
    size_t depth = CGImageGetBitsPerPixel(image.CGImage);
    size_t width = CGImageGetWidth(image.CGImage);
    size_t height = CGImageGetHeight(image.CGImage);
    
    double bytes = ((double)width * (double)height * (double)depth) / 8.0;

    double mb = bytes / 1048576.0f;

    NSString *msg = [NSString stringWithFormat:
                     @"Original %dx%d (%.2f MB)",
                     (int)width,
                     (int)height,
                     (float)mb];
    NSLog(@"%@", msg);
    return mb;
}
@end
