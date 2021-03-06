//
//  ZZUIButton.m
//  ZZUIHelper
//
//  Created by 李伯坤 on 2017/2/19.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "ZZUIButton.h"

@implementation ZZUIButton
@synthesize events = _events;
@synthesize properties = _properties;

- (NSMutableArray *)properties
{
    if (!_properties) {
        _properties = [super properties];

        ZZProperty *title = [[ZZProperty alloc] initWithPropertyName:@"title" type:ZZPropertyTypeString defaultValue:@""];
        [title setPropertyCodeByValue:^NSString *(id value) {
            return [NSString stringWithFormat:@"setTitle:%@ forState:UIControlStateNormal", value];
        }];
        ZZProperty *titleColor = [[ZZProperty alloc] initWithPropertyName:@"titleColor" selectionData:[ZZUIHelperConfig sharedInstance].colors defaultValue:@"blackColor" editable:YES];
        [titleColor setPropertyCodeByValue:^NSString *(id value) {
            return [NSString stringWithFormat:@"setTitleColor:[UIColor %@] forState:UIControlStateNormal", value];
        }];
        ZZProperty *imageName = [[ZZProperty alloc] initWithPropertyName:@"imageName" type:ZZPropertyTypeObject defaultValue:@""];
        [imageName setPropertyCodeByValue:^NSString *(id value) {
            return [NSString stringWithFormat:@"setImage:[UIImage imageNamed:@\"%@\"] forState:UIControlStateNormal", value];
        }];
        ZZProperty *backgroundImage = [[ZZProperty alloc] initWithPropertyName:@"backgroundImage" type:ZZPropertyTypeObject defaultValue:@""];
        [backgroundImage setPropertyCodeByValue:^NSString *(id value) {
            return [NSString stringWithFormat:@"setBackgroundImage:[UIImage imageNamed:@\"%@\"] forState:UIControlStateNormal", value];
        }];
        ZZPropertyGroup *group = [[ZZPropertyGroup alloc] initWithGroupName:@"UIButton" properties:@[title, titleColor, imageName, backgroundImage]];
        [_properties addObject:group];
    }
    return _properties;
}

- (NSArray *)events
{
    if (!_events) {
        ZZEvent *touchDown = [[ZZEvent alloc] initWithEventType:@"UIControlEventTouchDown" selected:NO];
        ZZEvent *touchDownRepeat = [[ZZEvent alloc] initWithEventType:@"UIControlEventTouchDownRepeat" selected:NO];
        ZZEvent *touchUpInside = [[ZZEvent alloc] initWithEventType:@"UIControlEventTouchUpInside" selected:YES];
        ZZEvent *touchUpOutside = [[ZZEvent alloc] initWithEventType:@"UIControlEventTouchUpOutside" selected:NO];
        ZZEvent *touchCancel = [[ZZEvent alloc] initWithEventType:@"UIControlEventTouchCancel" selected:NO];
        _events = @[touchDown, touchDownRepeat, touchUpInside, touchUpOutside, touchCancel];
    }
    return _events;
}


@end
