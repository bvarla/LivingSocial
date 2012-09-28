//
//  ViewController.m
//  Test
//
//  Created by Bharat varla on 9/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//




#import "ViewController.h"
#import "MyCustomcell.h"

@interface ViewController ()

@end

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0) //1
#define kLatestKivaLoansURL [NSURL URLWithString: @"http://warm-eyrie-4354.herokuapp.com/feed.json"] //2


@implementation ViewController

@synthesize table,staticImageDictionary,text1,text2,textname,textsite,BthumbnailImage,SthumbnailImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 
    
     Atext1 = [[NSMutableArray alloc] init];
     Atextname = [[NSMutableArray alloc] init];
     Atextsite = [[NSMutableArray alloc] init];
     ABthumbnailImage = [[NSMutableArray alloc] init];
     ASthumbnailImage = [[NSMutableArray alloc] init];
    
   // dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL: 
                        kLatestKivaLoansURL];
        
         NSError* error;
        json = [NSJSONSerialization
                              JSONObjectWithData:data //1
                              
                              options:kNilOptions 
                              error:&error];

    

    if (!error) {
        NSDictionary *list=[NSDictionary dictionary];

        
        for(int i=0;i<[json count];i++)
        {
            
            list =[json objectAtIndex:i];
            
            [Atext1 addObject:[list objectForKey:@"desc"]];
            
            [ABthumbnailImage addObject:[list objectForKey:@"src"]];
            
            [ASthumbnailImage addObject:[[(NSDictionary*)[list objectForKey:@"user"] objectForKey:@"avatar"] objectForKey:@"src"]];
            
            [Atextname addObject:[(NSDictionary*)[list objectForKey:@"user"] objectForKey:@"username"]];
            
            
            if(i==28)
            {
                [Atextsite addObject:@"Object doesnt exist"];
            }
            else
                
                [Atextsite addObject:[list objectForKey:@"attrib"]];
            
            
        }
        

        
    }
        }

#pragma mark -
#pragma mark Cache Images

- (UIImage*)imageNamed:(NSString*)imageNamed cache:(BOOL)cache
{
    
    UIImage* retImage = [staticImageDictionary objectForKey:imageNamed];
    if (retImage == nil)
    {
        retImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageNamed]]];
        if (cache)
        {
            if (staticImageDictionary == nil)
                staticImageDictionary = [[NSMutableDictionary alloc] init];
            if(imageNamed==nil){
                
            }
            [staticImageDictionary setObject:retImage forKey:imageNamed];
            
        }
    }
    return retImage;
}





#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [json count] ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 153.0;
}




// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"MyCustomcell";
	
	MyCustomcell *cell = (MyCustomcell*)[tableView dequeueReusableCellWithIdentifier: CellIdentifier];
	if (cell == nil) {
		
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyCustomcell" owner:self options:nil];
		cell = (MyCustomcell*)[nib objectAtIndex:0];
	}
	
    cell.text1.text = [Atext1 objectAtIndex:indexPath.row];
    cell.textsite.text = [Atextsite objectAtIndex:indexPath.row];
    cell.textname.text = [Atextname objectAtIndex:indexPath.row];
    
  
    
    
    //GCD is used to queue the requests
    
    dispatch_async(kBgQueue, ^{
    UIImage *im;
    UIImage *im1;
    
    if((indexPath.row==3))
    {
       im1 =[UIImage imageNamed:@"no.gif"];
    }
    else
    {
    im1=[self imageNamed:[ASthumbnailImage objectAtIndex:indexPath.row] cache:YES];
    }
        
    if((indexPath.row==1) || (indexPath.row == 28))
    {
        im=[UIImage imageNamed:@"no.gif"];
        
    }
    else
    {
     im = [self imageNamed:[ABthumbnailImage objectAtIndex:indexPath.row] cache:YES];
    }

  dispatch_async(dispatch_get_main_queue(), ^{
    

      cell.BthumbnailImage.image = im;
      cell.SthumbnailImage.image = im1;
     
  });
});
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
	return cell;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
