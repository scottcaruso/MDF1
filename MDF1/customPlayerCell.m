//
//  customPlayerCell.m
//  MDF1
//
//  Created by Scott Caruso on 2/6/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "customPlayerCell.h"

@implementation customPlayerCell

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

@end
