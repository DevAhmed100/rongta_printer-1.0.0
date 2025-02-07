//
//  PrinterStatusObj.h
//  RTPrinterSDK
//
//  Created by King on 24/02/2018.
//  Copyright © 2018 Rongta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnumTypeDef.h"
@interface PrinterStatusObj : NSObject

/*!
 打印机状态命令
 Print stauts command
 */
@property (nonatomic)  PrintStautsCmd printStautsCmd;

/*!
 机芯错误
 Printer movement error
 */
@property (nonatomic) BOOL blMoveMentErr;
/*!
 卡纸
 Paper jammed error
 */
@property (nonatomic) BOOL blPaperJammed;

/*!
 缺纸
 No Paper
 */
@property (nonatomic) BOOL blNoPaper;

/*!
 碳带用尽
 The ribbon runs out
 */
@property (nonatomic) BOOL blNoRibon;
/*!
 打印机暂停，空闲
 Printer Pause
 */
@property (nonatomic) BOOL blPrinterPause;
/*!
 正在打印
 Printer Busy
 
 */
@property (nonatomic) BOOL blPrinting;

/*!
 开盖状态
 The printer's lid is open
 */
@property (nonatomic) BOOL blLidOpened;
/*!
 头片过热
 The printer is overheated
 */
@property (nonatomic) BOOL blOverHeated;

/*!
 打印准备就绪
 Ready to print
 */
@property (nonatomic) BOOL blPrintReady;
/*!
 已打印里程，单位m
 */
@property (nonatomic) NSInteger PrintedMileage;

/*!
 内存大小
 Memory size
 */
@property (nonatomic) NSInteger MemorySize;
/*!
 打印机型号
 Model Name
 */
@property (nonatomic,strong) NSString * ModelName;

/*!
 系列号
 Serial number
 */
@property (nonatomic,strong) NSString * Serialnumber;

/*!
 打印完成情况 1:打印成功 其他失败，不返回
 Print completion 1: Print succeeded Other failed,Do not return
 */
@property (nonatomic) NSInteger PrintEndStatus;


+(PrinterStatusObj *) ParsePrinterStatus:(NSData *) data;
@end
