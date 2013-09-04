//
//  View_IKTextBox.h
//  connecttosqlserver
//
//  Created by Priyanka on 8/13/13.
//  Copyright (c) 2013 iKosmik. MIT License.
//

#import <UIKit/UIKit.h>

@protocol IKTextBoxDelegate <NSObject>
-(void) doneWithTextEntry : (NSString *) text;
@end


@interface View_IKTextBox : UIViewController <UITextViewDelegate> {
    BOOL isTextPlaceholder;
}

@property (nonatomic, strong) IBOutlet UITextView *txtView;
@property (nonatomic, strong) IBOutlet UIButton *buttonDone;
@property (nonatomic, weak) id <IKTextBoxDelegate> delegate;

-(void) initializeWithText : (NSString *) text
         IsTextPlaceholder : (BOOL) isItPlaceHolder
                WithSecure : (BOOL) isItSecure;
-(IBAction) buttonDonePressed : (id)sender;

@end
