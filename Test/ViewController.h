//
//  ViewController.h
//  Test
//
//  Created by Bharat varla on 9/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    //
    
    NSArray* json;
    NSMutableArray *Atext1;
    NSMutableArray *Atextname;
    NSMutableArray *Atextsite;
    NSMutableArray *ABthumbnailImage;
    NSMutableArray *ASthumbnailImage;
    
        
}


@property (nonatomic,strong) IBOutlet UITableView *table;
@property (nonatomic, strong) IBOutlet UILabel *text1;
@property (nonatomic, strong) IBOutlet UILabel *text2;
@property (nonatomic, strong) IBOutlet UILabel *textname;
@property (nonatomic, strong) IBOutlet UILabel *textsite;
@property (nonatomic, strong) IBOutlet UIImageView *BthumbnailImage;
@property (nonatomic, strong) IBOutlet UIImageView *SthumbnailImage;
@property (nonatomic, strong) NSMutableDictionary *staticImageDictionary;

@end
