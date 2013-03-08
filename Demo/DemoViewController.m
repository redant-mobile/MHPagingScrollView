
#import "DemoViewController.h"
#import "PageView.h"

@implementation DemoViewController
{
	NSUInteger _numPages;
}

- (void)viewDidLoad
{
	[super viewDidLoad];

	_numPages = 20;
    self.pagingScrollView.pageSize = CGSizeMake(100, self.pagingScrollView.bounds.size.height);
    self.pagingScrollView.pagingEnabled = NO;
	[self.pagingScrollView reloadPages];
}

- (void)didReceiveMemoryWarning
{
	[self.pagingScrollView didReceiveMemoryWarning];
}

#pragma mark - View Controller Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation 
{
	return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	[self.pagingScrollView beforeRotation];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	[self.pagingScrollView afterRotation];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)theScrollView
{
	[self.pagingScrollView scrollViewDidScroll];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)theScrollView
{

}

#pragma mark - MHPagingScrollViewDelegate

- (NSUInteger)numberOfPagesInPagingScrollView:(MHPagingScrollView *)pagingScrollView
{
	return _numPages;
}

- (UIView *)pagingScrollView:(MHPagingScrollView *)thePagingScrollView pageForIndex:(NSUInteger)index
{
	PageView *pageView = (PageView *)[thePagingScrollView dequeueReusablePage];
	if (pageView == nil)
		pageView = [[PageView alloc] init];

	[pageView setPageIndex:index];
	return pageView;
}

@end
