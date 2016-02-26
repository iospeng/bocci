//
//  UIImage+Base64Str.m
//  
//
//  Created by bocweb on 15/12/7.
//
//

#import "UIImage+Base64Str.h"

@implementation UIImage (Base64Str)
-(NSString *)base64Str
{
    NSData *data = UIImageJPEGRepresentation(self, 0.8f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}
@end
