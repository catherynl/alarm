//
//  MusicViewController.h
//  WakeUp
//
//  Created by Catherine Li on 6/29/15.
//  Copyright © 2015 BigNerdRanch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MusicViewController : UIViewController <MPMediaPickerControllerDelegate> 

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;
@property (weak, nonatomic) IBOutlet UIButton *playPauseButton;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumLabel;

@property (nonatomic, retain) MPMusicPlayerController *musicPlayer;

- (IBAction)volumeChanged:(id)sender;
- (IBAction)showMediaPicker:(id)sender;
- (IBAction)previousSong:(id)sender;
- (IBAction)playPause:(id)sender;
- (IBAction)nextSong:(id)sender;

@end
