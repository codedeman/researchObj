//
//  ViewController.m
//  ResearchTableView
//
//  Created by Ominext on 2/6/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

#import "ViewController.h"
#import "Article.h"

@interface ViewController ()
{
    
    NSMutableArray *arrTitle;
    NSArray *tableData;
    

}

@property (strong,nonatomic) NSMutableArray<Article *> *arrArticle;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController
 NSString *cellID = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];

//    [self setupArticle];
    
    [self configureTableView];
    
//    NSLog(self.arrArticle);
    
    

    
    
}
-(void) setupArticle{
    Article *article = Article.new;
    
    article.name = @"Kevin";
    article.substring = @"What the fuck";
    article.image = @"WTF.jpg";

    
    [self.arrArticle addObject:article];
    
    [self fetchArticeUsingJson];
}
-(void) fetchArticeUsingJson{
    
    //https://api.github.com/search/users?q=dung
    NSString *urlString = @"https://api.github.com/search/users?q=dung";
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *userData =  [[NSData alloc] initWithContentsOfURL:url];
    
    NSError *error;
    NSMutableDictionary *githubUser = [NSJSONSerialization JSONObjectWithData:userData options:NSJSONReadingMutableContainers error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);

    }else {
    
        NSArray *items = githubUser[@"items"];
        
        for (NSDictionary *userDict in items ) {
            NSString *name = userDict[@"login"];
            NSString *type = userDict[@"type"];
            NSString *image = userDict[@"avatar_url"];
            
            self.arrArticle = NSMutableArray.new;
            Article *article = Article.new;
            article.name = name;
            article.image = image;
            article.substring = type;
            [self.arrArticle addObject:article];
            
        }
        
        dispatch_async(dispatch_get_main_queue() ^{
           
            [self]
        });
        
        
    }
            
}
               
//
//    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//        NSLog(@"Finish fetching ");
//
//        NSString *dumyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"Dumy string @",dumyString);
//
//    }]resume];
//

-(void) configureTableView{
    
    self.navigationItem.title = @"WTF";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];

    
}
-(void) arraySetUp{
    
    arrTitle = [NSMutableArray arrayWithArray:@[@"What the hell",@"What the fuck you doing"]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return  self.arrArticle.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  self.arrArticle.count;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
//    NSMutableArray *news = [self.arrArticle objectAtIndex:indexPath.row];
    Article *article = self.arrArticle[indexPath.row];
    
    cell.textLabel.text =  article.name;
    cell.imageView.image = [UIImage.addImage];
    
//    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    
//    cell.backgroundView = UIColor.redColor;
    return cell;

}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return     [self tableViewData  ]
//}







@end
