Say, you have a page with text fields that may get hidden when the keyboard comes up, or sometimes, the text in the textfield may get too long that it cannot be seen all at once when we keep typing beyond the screen width size. Say, you have a page like this in your iPhone App

![alt tag](https://lh5.googleusercontent.com/-qTtobXOXPRA/UimXj2_cjcI/AAAAAAAABH0/i7SNWIO1_Ck/s480/Screenshot%25202013.09.06%252014.13.50.jpg)

What if you want to type in the 'city' textfield? The keyboard will come up & hide the textfield. If you integrate IKTextBox, then typing in the 'city' textfield will open up a new page in which you can have a lot of screen-space to type & also, if the text gets long, you can see it all at once. This is what IKTextBox does when you try to type into 'city' textfield, let's say

![alt tag](https://lh4.googleusercontent.com/-OLWFOFnd-z0/UimXgv-MVaI/AAAAAAAABHo/3OnVX3k7iAQ/s480/Screenshot%25202013.09.06%252014.13.56.jpg)

See that you can also have a placeholder text in the textfield! & the placeholder text can be long too. 
Once you are done typing, touch 'am done' and the IKTextBox passes the typed-in texxt to your code (via its delegate) and you may fill that text in the textbox as seen below : the pin code now appears in the 'city' textfield

![alt tag](https://lh4.googleusercontent.com/-jNEt465zLSE/UimXkRcRgMI/AAAAAAAABH4/hqkSaihXCAc/s480/Screenshot%25202013.09.06%252014.15.08.jpg)



USAGE IN CODE

IN .h FILE

```
 ...
 // STEP 1 : Import the View_IKTextBox.h file
 #import "View_IKTextBox.h"
 ...
 ...
 // STEP 2 : Implement the delegate
 @interface MyPage : UIViewController <IKTextBoxDelegate>
 ...
 ...
 // STEP 3 : Create a class variable to hold the View_IKTextBox
 @property (nonatomic, strong) View_IKTextBox *viewTextBox;
 ...
 ...
 @end



IN .m FILE
<code>
// STEP 4 : Map this class as the 'delegate' for the UITextField / UITextView component in storyboard
...
...
// STEP 5 : Implement textFieldDidBeginEditing
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        // Set the appropriate placeholder text
        [self showViewIKTextBoxWithText : text
                      IsTextPlaceholder : isItPlaceholder
                             WithSecure : secure];
    }
}


// STEP 6 : THEN DISPLAY THE IKTEXTBOX COMPONENT 
#pragma mark - IKTextBoxDelegate Handler

/**
 * Displays the View_IKTextBox
 * which shows a text view for easy entry of text
 */
-(void) showViewIKTextBoxWithText : (NSString *) text
                IsTextPlaceholder : (BOOL) isItPlaceHolder
                       WithSecure : (BOOL) isItSecure {
    
    if ((self.viewTextBox == nil) || (self.viewTextBox == NULL)) {
        self.viewTextBox = [[View_IKTextBox alloc] initWithNibName:@"View_IKTextBox" bundle:nil];
        self.viewTextBox.delegate = self;
    }
    [self.viewTextBox.view setFrame:[[UIScreen mainScreen] bounds]];
    [self.viewConnProfilesMgr.view addSubview:self.viewTextBox.view];
    [self.viewTextBox initializeWithText : text
                       IsTextPlaceholder : isItPlaceHolder
                              WithSecure : isItSecure];
}


// STEP 7 : Implement the IKTextViewDelegate method
/**
* A delegate method called when the user's done with the text entry in View_IKTextBox
*/
-(void) doneWithTextEntry : (NSString *)text {
      [self.myTextField setText:text];
}

```
