//
//  ViewController.m
//  day4Task1_Animation
//
//  Created by Uef on 22/12/2024.
//

#import "ViewController.h"

@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.orangeBall = [[UIView alloc]initWithFrame:CGRectMake(200.0, 50.0, 50.0, 50.0)];
    self.orangeBall.backgroundColor = [UIColor orangeColor];
    self.orangeBall.layer.cornerRadius = 25.0;
    self.orangeBall.layer.borderColor = [[UIColor blackColor] CGColor];
    self.orangeBall.layer.borderWidth = 0.0;
    
    
    
    [self.view addSubview:self.orangeBall];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    [self demoGravity];
    UICollisionBehavior * collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.orangeBall]];
    //collisionBehavior.collisionMode = UICollisionBehaviorModeBoundaries;
    
    self.animator.delegate = self;
    [collisionBehavior addBoundaryWithIdentifier:@"tabBar" fromPoint:self.tabBarController.tabBar.frame.origin toPoint:CGPointMake(self.tabBarController.tabBar.frame.origin.x + self.tabBarController.tabBar.frame.size.width, self.tabBarController.tabBar.frame.origin.y)];
    collisionBehavior.collisionDelegate = self;
    [self.animator addBehavior:collisionBehavior];
    
    UIDynamicItemBehavior* ballBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.orangeBall]];
    ballBehavior.elasticity = 0.75;
    [self.animator addBehavior:ballBehavior];
    
    
    
}
- (void)demoGravity {
    UIGravityBehavior * gravity = [[UIGravityBehavior alloc] initWithItems:@[self.orangeBall]];
    [self.animator addBehavior:gravity];
}
- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier {
    self.orangeBall.backgroundColor = [UIColor orangeColor];
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {
    self.orangeBall.backgroundColor = [UIColor blueColor];
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 {
    self.orangeBall.backgroundColor = [UIColor greenColor];
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p {
    self.orangeBall.backgroundColor = [UIColor yellowColor];
}

@end
