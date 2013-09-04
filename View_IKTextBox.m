//
//  View_IKTextBox.m
//  connecttosqlserver
//
//  Created by Priyanka on 8/13/13.
//  Copyright (c) 2013 ikosmik. MIT License.
//

#import "View_IKTextBox.h"


@implementation View_IKTextBox

@synthesize delegate;



#pragma mark - Initializer

/**
 * Initalizes the page
 * 1. Clears the text in the textview
 * 2. Makes the keyboard come up (first responder)
 *
 * @created 13 Aug 2013
 */
-(void) initializeWithText : (NSString *)text
         IsTextPlaceholder : (BOOL)isItPlaceHolder
                WithSecure : (BOOL)isItSecure {
    
    NSLog(@"initializeWithText secure %d", isItSecure);
    [self.txtView setSecureTextEntry : isItSecure];
    isTextPlaceholder = isItPlaceHolder;
    if (isTextPlaceholder) {
        [self.txtView setTextColor:[UIColor lightGrayColor]];
    }
    [self.txtView setText:text];
    
    //[self.txtView becomeFirstResponder];
}



#pragma mark Delegate Handler

- (void)notifyDelegateAboutTextEntryCompletion {
    NSLog(@"notifyDelegateAboutTextEntryCompletion");
    if ([self.delegate respondsToSelector:@selector(doneWithTextEntry:)]) {
        [self.delegate doneWithTextEntry : self.txtView.text];
    }
}



#pragma mark - Button Handler

-(IBAction) buttonDonePressed : (id)sender {
    [self.view removeFromSuperview];
    [self notifyDelegateAboutTextEntryCompletion];
    [self.txtView resignFirstResponder];
    [self.txtView setText:kEmptyString];
}



#pragma mark - TextViewDelegate Handler

- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"textViewDidBeginEditing");
    if (isTextPlaceholder) {
        [self.txtView setText:kEmptyString];
    }
    [self.txtView setTextColor:[UIColor blackColor]];
}


#pragma mark - Generic Class Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.txtView setDelegate:self];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
