//
//  TableViewController.m
//  MDF1_week2
//
//  Created by Scott Caruso on 2/11/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "TableViewController.h"
#import "FirstViewController.h"
#import "ResearchDetail.h"
#import "AppDelegate.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
    }
    return self;
}

int backgroundColorTag;

- (void)viewDidLoad
{
    AppDelegate *accessAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (accessAppDelegate.backgroundColorTag == 0)
    {
        self.view.backgroundColor = [UIColor whiteColor];
    } else if (accessAppDelegate.backgroundColorTag == 1)
    {
        self.view.backgroundColor = [UIColor blueColor];
    } else if (accessAppDelegate.backgroundColorTag == 2)
    {
        self.view.backgroundColor = [UIColor orangeColor];
    } else
    {
        //do nothing
    }
    listOfArticles = [[NSMutableArray alloc] initWithObjects:
                                      @"A Formal Software Testing Technique",
                                      @"Improving Software Testing Process",
                                      @"Analysis of Software Testing Strategies",
                                      @"Quantitative effects of software testing",
                                      @"Survey on software testing practices",
                                        nil];
    
    firstArticle = [[NSDictionary alloc] initWithObjectsAndKeys:
                    @"http://goo.gl/ZtXyK",@"URL",
                    @"Baig, M. M.; Khan, A. A.",@"Author", 
                    @"Pakistan Journal of Science",@"Publication",
                    @"December 2011",@"Date",
                    @"Software Testing is defined as a single phase activity in software development process by using water fall model. We have been working on a research project on formal software testing technique. In this paper, contrary to usual practice, a built-in testing module at each stage of software development process is proposed. The problem description is first expressed in a formal notation to get the problem-definition, in an unambiguous and formal format. This formal description of the problem will be more accurate and will form a formal test bed in the tabular form. This test bed will facilitate different types of relevant testing at each phase of system development process, both vertical and horizontal testing. The said software testing technique consists of three modules. This paper covers the work done in the first module.",@"Abstract",nil];
    
    secondArticle = [[NSDictionary alloc] initWithObjectsAndKeys:
                    @"http://goo.gl/FEA4R",@"URL",
                    @"Qi Li; Ye Yang; Mingshu Li; Qing Wang; Boehm, Barry W.; Chenyong Hu",@"Author",
                    @"Journal of Software: Evolution and Process",@"Publication",
                    @"November 2012",@"Date",
                    @" For a successful software project, acceptable quality must be achieved within an acceptable cost, demonstrating business value to customers and satisfactorily meeting delivery timeliness. Testing serves as the most widely used approaches to determine that the intended functionalities are performed correctly and achieve the desired level of services; however, it is also a labor-intensive and expensive process during the whole software life cycle. Most current testing processes are often technique-centered, rather than organized to maximize business value. In this article, we extend and elaborate the '4+ 1' theoretical lenses of Value-based Software Engineering (VBSE) framework in the software testing process; propose a multi-objective feature prioritization strategy for testing planning and controlling, which aligns the internal testing process with value objectives coming from customers and markets. Our case study in a real-life business project shows that this method allows reasoning about the software testing process in different dimensions: it helps to manage the testing process effectively and efficiently, provides information for continuous internal software process improvement, and increases customer satisfaction, which makes winners of all success-critical stakeholders (SCSs) in the software testing process.",@"Abstract",nil];
    
    thirdArticle = [[NSDictionary alloc] initWithObjectsAndKeys:
                    @"http://goo.gl/ijHLB",@"URL",
                    @"Zachariah, Babu",@"Author",
                    @"IEEE Transactions on Reliability",@"Publication",
                    @"June 2012",@"Date",
                    @"This paper discusses efficacy issues in software testing strategies through attained failure size. Failure size is the probability of finding an input that causes a failure in the input domain. As testing progresses, failure size decreases due to debugging. The failure size at the termination of testing is called the attained failure size. Using this measure, we compare the efficacies of partition testing and random testing, derive conditions that lead to the superiority of partition testing, and obtain optimal time allocations in partition testing. The core findings are presented in a decision tree to assist testers in test management.",@"Abstract",nil];
    
    fourthArticle = [[NSDictionary alloc] initWithObjectsAndKeys:
                    @"http://goo.gl/PfdCL",@"URL",
                    @"Cao, Ping; Dong, Zhao; Liu, Ke; Cai, Kai-Yuan",@"Author",
                    @"Information Sciences",@"Publication",
                    @"January 2013",@"Date",
                    @"Software testing is essential for software reliability improvement and assurance. However, software testing is subject to imperfect debugging in the sense that new defects may be introduced into the software under test while detected defects are removed. The quantitative effects of software testing on software reliability improvement are obscure. In this paper we propose a Markov usage model to explore the quantitative relationships between software testing and software reliability in the presence of imperfect debugging. Several interesting quantities for software reliability assessment are derived and the corresponding upper and lower bounds are obtained.",@"Abstract",nil];
    
    fifthArticle = [[NSDictionary alloc] initWithObjectsAndKeys:
                    @"http://goo.gl/NDXFV",@"URL",
                    @"Lee, J.; Kang, S.; Lee, D",@"Author",
                    @"IET Software",@"Publication",
                    @"June 2012",@"Date",
                    @"To develop high-quality software, it is essential to use software testing methods and tools (STMTs) effectively and efficiently. The authors conducted a survey with a wide variety of companies and experts that are involved in software testing in order to identify the current practices and opportunities for improvement of STMTs. The survey results revealed five important findings regarding the current practices of STMTs and opportunities for improvement: low usage rate of STMTs, difficulties owing to alack of STMTs, use of testing tools in a limited manner, demand for interoperability support between methods and tools of software development and testing, and need for guidance to evaluate STMTs or to describe the capabilities of STMTs. These findings and other related results from the survey will be useful for improving STMTs practices and developing software testing tools.",@"Abstract",nil];
    

    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listOfArticles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [listOfArticles objectAtIndex:indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ResearchDetail *detailView = [[ResearchDetail alloc] initWithNibName:@"ResearchDetail" bundle:nil];
    if (detailView != nil);
    {
        [self presentViewController:detailView animated:TRUE completion:nil];
        arrayOfDictionaries = [[NSArray alloc] initWithObjects:firstArticle,secondArticle,thirdArticle,fourthArticle,fifthArticle, nil];
        for (int x = 0; x<[arrayOfDictionaries count]; x++)
        {
            if (x == indexPath.row)
            {
                detailView.articleTitle.text = [listOfArticles objectAtIndex:x];
                thisDictionary = [[NSDictionary alloc] initWithDictionary:[arrayOfDictionaries objectAtIndex:x]];
                detailView.articleURL.text = [thisDictionary objectForKey:@"URL"];
                detailView.authorName.text = [thisDictionary objectForKey:@"Author"];
                detailView.publication.text = [thisDictionary objectForKey:@"Publication"];
                detailView.publicationDate.text = [thisDictionary objectForKey:@"Date"];
                detailView.abstract.text = [thisDictionary objectForKey:@"Abstract"];
            }
        }
    }
}

//Set section "titles"
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"List of Articles";
            break;
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

//Create an "invisible" footer to hide blank cells
- (float)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f; 
}

@end
