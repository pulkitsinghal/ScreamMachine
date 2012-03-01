//
//  ViewController.m
//  screammachine
//
//  Created by Pulkit Singhal on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Utility.h"

@implementation ViewController

#pragma mark - Instance variables
@synthesize imagePickerController  = _imagePickerController;
@synthesize thisButtonNeedsPicture = _thisButtonNeedsPicture;

#pragma mark - NSObject methods
- (id) initWithNibName : (NSString *) nibNameOrNil
                bundle : (NSBundle *) nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
    {
        self.imagePickerController = [[UIImagePickerController alloc] init];
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        self.imagePickerController.delegate = self;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Instance methods
- (IBAction) showPopUp : (id) sender
{
    UIAlertView *popUp =
    [[UIAlertView alloc] initWithTitle : @"Guess Who?"
                               message : ((UIButton*)sender).titleLabel.text
                              delegate : nil
                     cancelButtonTitle : @"No Idea!"
                     otherButtonTitles : nil];
    [popUp show];
}

- (IBAction) takePicture : (id) sender
{
    if (((UIButton*)sender).imageView.image == nil) {
        [self presentViewController:self.imagePickerController
                           animated:YES
                         completion:
                         ^{
                             NSLog(@"This runs before the camera shutter opens :)");
                             self.thisButtonNeedsPicture = (UIButton*)sender;
                         }
        ];
    } else {
        [self showPopUp:sender];
    }
}

#pragma mark - UIImagePickerControllerDelegate methods
- (void) imagePickerController : (UIImagePickerController *) picker
         didFinishPickingImage : (UIImage *) image
{
    NSLog(@"picked a picture");

    //self.thisButtonNeedsPicture.imageView.image =
    image =
    [UIImage imageWithImage:image
               scaledToSize:(CGSizeMake(85.0, 122.0))];

    [self.thisButtonNeedsPicture setImage:image
                                 forState:UIControlStateNormal];

    [self dismissModalViewControllerAnimated:YES];
}

- (void) imagePickerController : (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo : (NSDictionary *) info
{
    NSLog(@"took a picture");

    NSLog(@"%@", self.thisButtonNeedsPicture);
    NSLog(@"%@", self.thisButtonNeedsPicture.imageView);
    NSLog(@"%@", self.thisButtonNeedsPicture.imageView.image);

    //self.thisButtonNeedsPicture.imageView.image =
    UIImage *image =
    [UIImage imageWithImage:(UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage]
               scaledToSize:(CGSizeMake(85.0, 122.0))];

    [self.thisButtonNeedsPicture setImage:image
                                 forState:UIControlStateNormal];

    [self dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel : (UIImagePickerController *) picker
{
    NSLog(@"did not take/pick a picture");
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
