//
//  ViewController.m
//  PDFReader
//
//  Created by EG on 2017/8/14.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "ViewController.h"
#import <ReaderViewController.h>
#import <ReaderDocument.h>

#import "WebViewController.h"

@interface ViewController ()<
ReaderViewControllerDelegate,
UITableViewDelegate,
UITableViewDataSource
>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic)NSArray *resources;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.hidden = YES;
}

#pragma mark - delegate

- (void)dismissReaderViewController:(ReaderViewController *)viewController {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:self.resources[indexPath.row] ofType:@"pdf"];
        
        ReaderDocument *doc = [ReaderDocument withDocumentFilePath:path password:nil];
        ReaderViewController *readerViewController = [[ReaderViewController alloc] initWithReaderDocument:doc];
        readerViewController.delegate = self;
        readerViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        readerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.navigationController pushViewController:readerViewController animated:YES];
    }else {
        [self.navigationController pushViewController:[WebViewController new] animated:YES];

    }
}

#pragma mark - datasource 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0){
        return self.resources.count;
    }
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    if (indexPath.section == 0){
        cell.textLabel.text = self.resources[indexPath.row];
    }else {
        cell.textLabel.text = @"Web Open";
    }
    return cell;
}


- (NSArray *)resources {
    return @[@"Manul",
             @"Vim实用技巧",
             @"地图开发"];
}

@end
