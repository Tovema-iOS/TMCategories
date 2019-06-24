/* 
 * Copyright (c) 2009 Keith Lazuka
 * License: http://www.opensource.org/licenses/mit-license.html
 */

#import <Foundation/Foundation.h>

@interface NSDate(TMKalAdditions)

// All of the following methods use [NSCalendar currentCalendar] to perform
// their calculations.

- (NSDate *)tm_dateByMovingToBeginningOfDay;
- (NSDate *)tm_dateByMovingToEndOfDay;
- (NSDate *)tm_dateByMovingToFirstDayOfTheMonth;
- (NSDate *)tm_dateByMovingToFirstDayOfThePreviousMonth;
- (NSDate *)tm_dateByMovingToFirstDayOfTheFollowingMonth;
- (NSDateComponents *)tm_componentsForMonthDayAndYear;

@end
