//
//  Penguin.m
//  Project10
//
//  Created by Alexandros Kontogiorgos-Heintz on 4/4/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Penguin.h"

@implementation Penguin

- (void)didLoadFromCCB {
    self.physicsBody.collisionType = @"penguin";
}

@end
