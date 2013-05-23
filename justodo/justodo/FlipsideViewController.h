//
//  FlipsideViewController.h
//  justodo
//
//  Created by Oleksiy Radyvanyuk on 5/23/13.
//  Copyright (c) 2013 Oleksiy Radyvanyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
