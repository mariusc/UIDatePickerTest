//
//  ViewController.m
//  DatePickerTest
//
//  Created by Marius Constantinescu on 08/06/15.
//  Copyright (c) 2015 Marius Constantinescu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *topDatePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // configure top date picker
    self.topDatePicker.datePickerMode = UIDatePickerModeDateAndTime;
    self.topDatePicker.minuteInterval = 5;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapSelectForTopPicker:(id)sender {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd MMM yyyy, HH:mm";
    self.topLabel.text = [formatter stringFromDate:self.topDatePicker.date];
}

// I need to use something like this, to make the date be the currently selected one, and not the one returned by the date picker. 
- (NSDate*)clampDate:(NSDate *)dt toMinutes:(int)minutes {
    
    int referenceTimeInterval = (int)[dt timeIntervalSinceReferenceDate];
    int remainingSeconds = referenceTimeInterval % (minutes*60);
    int timeRoundedTo5Minutes = referenceTimeInterval - remainingSeconds;
    //    if (remainingSeconds>((minutes*60)/2)) {/// round up
    //        timeRoundedTo5Minutes = referenceTimeInterval +((minutes*60)-remainingSeconds);
    //    }
    return [NSDate dateWithTimeIntervalSinceReferenceDate:(NSTimeInterval)timeRoundedTo5Minutes];
}
@end
