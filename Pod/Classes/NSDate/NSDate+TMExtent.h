//
//  NSDate+Extent.h
//  PandaHome
//
//  Created by ZZF on 13-9-3.
//
//

#import <Foundation/Foundation.h>

#define D_MINUTE 60
#define D_HOUR 3600
#define D_DAY 86400
#define D_WEEK 604800
#define D_YEAR 31556926

@interface NSDate(Extent)

#pragma mark - Relative dates from the current date

/**
 Generate tomorrow date
 */
+ (NSDate *)tm_tomorrow;

/**
 Generate yesterday date
 */
+ (NSDate *)tm_yesterday;

/**
 Generate date after days since now

 @param days days since now
 */
+ (NSDate *)tm_dateByAddingDaysSinceNow:(NSInteger)days;

/**
 Generate date after hours since now
 
 @param hours hours since now
 */
+ (NSDate *)tm_dateByAddingHoursSinceNow:(NSInteger)hours;

/**
 Generate date after minutes since now
 
 @param minutes minutes since now
 */
+ (NSDate *)tm_dateByAddingMinutesSinceNow:(NSInteger)minutes;

#pragma mark - convert from NSString to NSDate

/**
 Convert NSString to NSDate

 format: @"yyyy-MM-dd"
 
 @param dateString date string
 */
+ (NSDate *)tm_dateFromString:(NSString *)dateString;

/**
 Convert NSString to NSDate

 @param dateString date string
 @param format date format
 */
+ (NSDate *)tm_dateFromString:(NSString *)dateString format:(NSString *)format;


#pragma mark - Comparing dates

/**
 Determine whether self date equals to another date without time of the day.
 */
- (BOOL)tm_isEqualToDateIgnoringTime:(NSDate *)aDate;

/**
 Determine whether self date is today.
 */
- (BOOL)tm_isToday;

/**
 Determine whether self date is tomorrow.
 */
- (BOOL)tm_isTomorrow;

/**
 Determine whether self date is yesterday.
 */
- (BOOL)tm_isYesterday;

/**
 Determine whether self date is in same week with another date.
 */
- (BOOL)tm_isEqualWeekToDate:(NSDate *)aDate;

/**
 Determine whether self date is in same week with current system date.
 */
- (BOOL)tm_isThisWeek;

/**
 Determine whether self date is in next week since current system date.
 */
- (BOOL)tm_isNextWeek;

/**
 Determine whether self date is in previous week since current system date.
 */
- (BOOL)tm_isPreviousWeek;

/**
 Determine whether self date is in same month with another date.
 */
- (BOOL)tm_isEqualMonthToDate:(NSDate *)aDate;

/**
 Determine whether self date is in same month with current system date.
 */
- (BOOL)tm_isThisMonth;

/**
 Determine whether self date is in same year with another date.
 */
- (BOOL)tm_isEqualYearToDate:(NSDate *)aDate;

/**
 Determine whether self date is in same year with current system date.
 */
- (BOOL)tm_isThisYear;

/**
 Determine whether self date is in next year since current system date.
 */
- (BOOL)tm_isNextYear;

/**
 Determine whether self date is in previous year since current system date.
 */
- (BOOL)tm_isPreviousYear;

/**
 Determine whether self date is earlier than another date.
 */
- (BOOL)tm_isEarlierThanDate:(NSDate *)aDate;

/**
 Determine whether self date is later than another date.
 */
- (BOOL)tm_isLaterThanDate:(NSDate *)aDate;

/**
 Determine whether self date is in future.
 */
- (BOOL)tm_isInFuture;

/**
 Determine whether self date is in past.
 */
- (BOOL)tm_isInPast;

#pragma mark - Date roles

/**
 Determine whether self date is word day
 */
- (BOOL)tm_isWorkday;

/**
 Determine whether self date is weekend day
 */
- (BOOL)tm_isWeekend;

#pragma mark - Adjusting dates

/**
 Generate date by adding months since self date.
 */
- (NSDate *)tm_dateByAddingMonths:(NSInteger)months;

/**
 Generate date by adding days since self date.
 */
- (NSDate *)tm_dateByAddingDays:(NSInteger)days;

/**
 Generate date by adding hour since self date.
 */
- (NSDate *)tm_dateByAddingHours:(NSInteger)hours;

/**
 Generate date by adding minutes since self date.
 */
- (NSDate *)tm_dateByAddingMinutes:(NSInteger)minutes;

#pragma mark - Retrieving intervals

/**
 Calculate minutes between self date and another date.
 */
- (NSInteger)tm_minutesAfterDate:(NSDate *)aDate;

/**
 Calculate minutes between self date and another date.
 */
- (NSInteger)tm_minutesBeforeDate:(NSDate *)aDate;

/**
 Calculate hours between self date and another date.
 */
- (NSInteger)tm_hoursAfterDate:(NSDate *)aDate;

/**
 Calculate hours between self date and another date.
 */
- (NSInteger)tm_hoursBeforeDate:(NSDate *)aDate;

/**
 Calculate days between self date and another date.
 */
- (NSInteger)tm_daysAfterDate:(NSDate *)aDate;

/**
 Calculate days between self date and another date.
 */
- (NSInteger)tm_daysBeforeDate:(NSDate *)aDate;

/**
 Calculate days between self date and another date.
 */
- (NSInteger)tm_distanceInDaysToDate:(NSDate *)anotherDate;

#pragma mark - Decomposing dates

@property (nonatomic, readonly) NSInteger tm_nearestHour;
@property (nonatomic, readonly) NSInteger tm_hour;
@property (nonatomic, readonly) NSInteger tm_minute;
@property (nonatomic, readonly) NSInteger tm_seconds;
@property (nonatomic, readonly) NSInteger tm_day;
@property (nonatomic, readonly) NSInteger tm_month;
@property (nonatomic, readonly) NSInteger tm_year;

/**
 week of year
 */
@property (nonatomic, readonly) NSInteger tm_week;

/**
 weekday
 */
@property (nonatomic, readonly) NSInteger tm_weekday;

/**
 week ordinal of month
 e.g. 2nd Tuesday of the month == 2
 */
@property (nonatomic, readonly) NSInteger tm_nthWeekday;

/**
 number of days in month
 */
@property (nonatomic, readonly) NSUInteger tm_numberOfDaysInMonth;

@end
