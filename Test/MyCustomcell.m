//
//  MyCustomcell.m
//  Test
//
//  Created by Bharat varla on 9/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyCustomcell.h"

@interface MyCustomcell ()

@end

@implementation MyCustomcell

@synthesize text1 = _text1;
@synthesize text2 = _text2;
@synthesize textsite = _textsite;
@synthesize textname = _textname;
@synthesize BthumbnailImage = _BthumbnailImage;
@synthesize SthumbnailImage = _SthumbnailImage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void) dealloc  {  
    _text1=nil;
    _text2=nil;
    _textsite=nil;
    _textname=nil;
    _BthumbnailImage=nil;
    _SthumbnailImage=nil; 
}
@end