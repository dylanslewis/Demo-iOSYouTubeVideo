//
//  ViewController.m
//  YouTubeVideo
//
//  Created by Dylan Lewis on 06/09/2014.
//  Copyright (c) 2014 Dylan Lewis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];

    [self showYouTubeVideo:@"Rr6w3tOeXpY" forX:0 forY:0 forWidth:200 forHeight:200];
}

- (void)showYouTubeVideo:(NSString *)url forX:(double)x forY:(double)y forWidth:(double)width forHeight:(double)height {
    NSString *fullURL = [NSString stringWithFormat:@"http://www.youtube.com/embed/%@", url];
    
    UIWebView *videoView = [[UIWebView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    videoView.backgroundColor = [UIColor clearColor];
    videoView.opaque = NO;
    videoView.delegate = self;
    [self.view addSubview:videoView];
    
    NSString *videoHTML = [NSString stringWithFormat:@"\
                           <html>\
                           <head>\
                           <style type=\"text/css\">\
                           iframe {position:absolute; top:50%%; margin-top:-130px;}\
                           body {background-color:#000; margin:0;}\
                           </style>\
                           </head>\
                           <body>\
                           <iframe width=\"100%%\" height=\"240px\" src=\"%@\" frameborder=\"0\" allowfullscreen></iframe>\
                           </body>\
                           </html>", fullURL];
    
    [videoView loadHTMLString:videoHTML baseURL:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
