//
//  WebViewController.m
//  PDFReader
//
//  Created by EG on 2017/8/14.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.hidden = NO;
    [self loadPDFResource];
}

- (void)loadPDFResource {
    [self.webView loadRequest:
     [NSURLRequest requestWithURL:
      [NSURL URLWithString:
       [[NSBundle mainBundle] pathForResource:@"Manul" ofType:@"pdf"
        ]]]];
    
    [self.webView setScalesPageToFit:YES];
 }

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = YES;

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

@end
