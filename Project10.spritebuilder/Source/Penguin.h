//
//  Penguin.h
//  Project10
//
//  Created by Alexandros Kontogiorgos-Heintz on 4/4/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Penguin : CCSprite <CCPhysicsCollisionDelegate>

@property (nonatomic, assign) BOOL launched;

@end
