//
//  MusicViewController.m
//  WakeUp
//
//  Created by Catherine Li on 6/29/15.
//  Copyright © 2015 BigNerdRanch. All rights reserved.
//  Disclaimer: a lot of the code in this file comes from http://code.tutsplus.com/tutorials/ios-sdk-music-library-access--mobile-6188.
//

#import "MusicViewController.h"

@interface MusicViewController ()

@end

@implementation MusicViewController

@synthesize musicPlayer;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datePicker.datePickerMode = UIDatePickerModeTime;
    self.musicPlayer = [MPMusicPlayerController systemMusicPlayer];
    //    [self.volumeSlider setValue:self.musicPlayer.value];
    if ([musicPlayer playbackState] == MPMusicPlaybackStatePlaying) {
        [self.playPauseButton setImage:[UIImage imageNamed:@"pauseButton.png"] forState:UIControlStateNormal];
    } else {
        [self.playPauseButton setImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
    }
    [self registerMediaPlayerNotifications];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: MPMusicPlayerControllerNowPlayingItemDidChangeNotification
                                                  object: musicPlayer];
    
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: MPMusicPlayerControllerPlaybackStateDidChangeNotification
                                                  object: musicPlayer];
    
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: MPMusicPlayerControllerVolumeDidChangeNotification
                                                  object: musicPlayer];
    
    [musicPlayer endGeneratingPlaybackNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void) registerMediaPlayerNotifications
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver: self
                           selector: @selector(handle_NowPlayingItemChanged:)
                               name: MPMusicPlayerControllerNowPlayingItemDidChangeNotification
                             object: self.musicPlayer];
    //
    [notificationCenter addObserver: self
                           selector: @selector(handle_PlaybackStateChanged:)
                               name: MPMusicPlayerControllerPlaybackStateDidChangeNotification
                             object: self.musicPlayer];
    
    [notificationCenter addObserver: self
                           selector: @selector(handle_VolumeChanged:)
                               name: MPMusicPlayerControllerVolumeDidChangeNotification
                             object: self.musicPlayer];
    
    [self.musicPlayer beginGeneratingPlaybackNotifications];
}

- (void) handle_NowPlayingItemChanged: (id) notification
{
    MPMediaItem *currentItem = [musicPlayer nowPlayingItem];
    
    // Artwork image, no longer need
//    UIImage *artworkImage = [UIImage imageNamed:@"noArtworkImage.png"];
//    MPMediaItemArtwork *artwork = [currentItem valueForProperty: MPMediaItemPropertyArtwork];
//    
//    if (artwork) {
//        artworkImage = [artwork imageWithSize: CGSizeMake (200, 200)];
//    }
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:artworkImage];
//    [self.artworkImageView addSubview:imageView];
    
    NSString *titleString = [currentItem valueForProperty:MPMediaItemPropertyTitle];
    if (titleString) {
        self.titleLabel.text = [NSString stringWithFormat:@"Title: %@",titleString];
    } else {
        self.titleLabel.text = @"Title: Unknown title";
    }
    
    NSString *artistString = [currentItem valueForProperty:MPMediaItemPropertyArtist];
    if (artistString) {
        self.artistLabel.text = [NSString stringWithFormat:@"Artist: %@",artistString];
    } else {
        self.artistLabel.text = @"Artist: Unknown artist";
    }
    
    NSString *albumString = [currentItem valueForProperty:MPMediaItemPropertyAlbumTitle];
    if (albumString) {
        self.albumLabel.text = [NSString stringWithFormat:@"Album: %@",albumString];
    } else {
        self.albumLabel.text = @"Album: Unknown album";
    }
    
}

// MARK: IBActions

- (IBAction)setMusicTimePressed:(id)sender {
}

- (IBAction)volumeChanged:(id)sender {
    [self.musicPlayer setVolume:[self.volumeSlider value]];
}

- (IBAction)showMediaPicker:(id)sender
{
    MPMediaPickerController *mediaPicker = [[MPMediaPickerController alloc] initWithMediaTypes: MPMediaTypeAny];
    
    mediaPicker.delegate = self;
    mediaPicker.allowsPickingMultipleItems = YES;
    mediaPicker.prompt = @"Select songs to play";
    
    [self presentViewController:mediaPicker animated:YES completion:nil];
}

- (void) mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection
{
    if (mediaItemCollection) {
        [musicPlayer setQueueWithItemCollection: mediaItemCollection];
        [musicPlayer play];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) mediaPickerDidCancel: (MPMediaPickerController *) mediaPicker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) handle_PlaybackStateChanged: (id) notification {
    MPMusicPlaybackState playbackState = [musicPlayer playbackState];
    if (playbackState == MPMusicPlaybackStatePaused) {
        [self.playPauseButton setImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
    } else if (playbackState == MPMusicPlaybackStatePlaying) {
        [self.playPauseButton setImage:[UIImage imageNamed:@"pauseButton.png"] forState:UIControlStateNormal];
    } else if (playbackState == MPMusicPlaybackStateStopped) {
        [self.playPauseButton setImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
        [musicPlayer stop];
    }
}

- (void) handle_VolumeChanged: (id) notification {
    [self.volumeSlider setValue:[musicPlayer volume]];
}

// MARK: IBActions

- (IBAction)previousSong:(id)sender {
    [self.musicPlayer skipToPreviousItem];
}

- (IBAction)playPause:(id)sender {
    if ([self.musicPlayer playbackState] == MPMusicPlaybackStatePlaying) {
        [self.musicPlayer pause];
    } else {
        [self.musicPlayer play];
    }
}

- (IBAction)nextSong:(id)sender {
    [self.musicPlayer skipToNextItem];
}

@end
