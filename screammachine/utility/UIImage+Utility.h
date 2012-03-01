//
//  UIImage+Utility.h
//  ShoppinPal
//
//  Created by Pulkit Singhal on 2/21/12.
//  Copyright (c) 2012 Fermyon Inc. All rights reserved.
//

@interface UIImage (Utility)
+ (UIImage*) imageWithImage : (UIImage*)image 
               scaledToSize : (CGSize)newSize;

+ (double) imageSizeInKB : (UIImage*) image;

+ (double) imageSizeInMB : (UIImage*) image;
@end
