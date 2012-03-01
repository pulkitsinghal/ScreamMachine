//
//  ViewController.h
//  screammachine
//
//  Created by Pulkit Singhal on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, retain) UIImagePickerController   *imagePickerController;
@property (nonatomic, retain) UIButton                  *thisButtonNeedsPicture;

- (IBAction) showPopUp : (id) sender;

- (IBAction) takePicture : (id) sender;

@end
