//
//  Md5.h
//  RandomPasswordKey
//
//  Created by michael he on 1/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Md5 : NSObject {

}

+(NSString *)md5:(NSString*) str;
+(NSString *)file_md5:(NSString*) path;
@end
