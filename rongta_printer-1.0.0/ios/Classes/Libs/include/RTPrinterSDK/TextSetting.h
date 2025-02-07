//
//  TextSetting.h
//  RTPrinterSDK
//
//  Created by King 23/11/2017.
//  Copyright © 2017 Rongta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnumTypeDef.h"

/*!
 文本设置
 Text setting
 */
@interface TextSetting : NSObject<NSCopying>
/*!设置粗体(适用于ESC指令)
 Set bold (for ESC)
 */
@property (nonatomic) SettingMode  IsBold;
/*!设置下划线(适用于ESC指令)
  Underline setting (for ESC)
 */
@property (nonatomic) SettingMode  IsUnderline;
/*!设置斜体(适用于ESC指令)
   Set italics (for ESC)
 */
@property (nonatomic) SettingMode  IsItalic;
/*!设置对齐方式(适用于ESC指令)
  Set alignment (for ESC command)
 */
@property (nonatomic) Alignment   Alignmode;//行对齐方式
/*!设置／解除4倍宽 适用于ESC,Pin指令
  Turn quadruple-size mode on/off for Kanji characters(for ESC,Pin)
 */
@property (nonatomic) SettingMode IsTimes4_Wide;
/*!设置／解除倍宽，适用于ESC,Pin指令
  Set / release Double-Width(for ESC,Pin)
 */
@property (nonatomic) SettingMode IsTimes_Wide;
/*!设置／解除倍高，适用于ESC,Pin指令
   Set / release Double-Height(for ESC,Pin)
 */
@property (nonatomic) SettingMode IsTimes_Heigh;
/*!设置字体类型(适用于ESC指令)
  Set font type (for ESC)
 */
@property (nonatomic) ESCFontType EscFonttype;
/*!设置字体类型(适用于TSC指令)
   Set font type (for ESC)
 */
@property (nonatomic) TSCFontType TSCFonttype;
/*!设置字体类型(适用于Cpcl指令)
   Set font type (for Cpcl)
 */
@property (nonatomic) CPCLFontType CpclFonttype;

/*!设置字体类型(适用于ZPL指令)
 Set font type (for ZPL)
 */
@property (nonatomic) ZPLFontType ZplFonttype;

/*!是否反白(适用于ESC指令)
 Set / release Anti-White
 */
@property (nonatomic) SettingMode IsInverse;

/*!
 左上角X坐标，适用TSC,CPCL 
 X coordinate of the upper left corner, for TSC, CPCL
 */
@property (nonatomic) NSInteger  X_start;
/*!
 左上角Y坐标，适用TSC,CPCL
 Y coordinate of the upper left corner, for TSC, CPCL
 */
@property (nonatomic) NSInteger  Y_start;

/*!
  旋转度数，适用TSC,CPCL,ESC(仅Rotate90,Rotate0有效)
  Rotation degree for TSC, CPCL, ESC (Rotate90, Rotate0 only) 
 */
@property (nonatomic) RotateType Rotate;

/*!水平放大值
   TSC:有效系数 1~10
   Cpcl:有效系数 1~16
 
   Zoom in horizontally
   TSC: The effective coefficient is 1 ~ 10
   Cpcl: The effective coefficient is 1 ~ 16
 
 */
@property (nonatomic) NSInteger X_multi;
/*!
  垂直放大值
  TSC:有效系数 1~10
  Cpcl:有效系数 1~16
 
  Vertical magnification
    TSC: The effective coefficient is 1 ~ 10
    Cpcl: The effective coefficient is 1 ~ 16
 */
@property (nonatomic) NSInteger Y_multi;

/*!可缩放(矢量)/位图(点阵)字体的高度设置（for zpl）
 可缩放：10〜32000
 位图:  1-10
 
 Scalable (vector) / Bitmapped (dot matrix) font height settings
 Scalable：10〜32000
 Bitmapped:  1-10

 */
@property (nonatomic) NSInteger ZplHeihtFactor;
/*!可缩放(矢量)/位图(点阵)字体的宽度设置（for zpl）
 可缩放：10〜32000
 位图:  1-10
 
 Scalable (vector) / Bitmapped (dot matrix) font width settings
 Scalable：10〜32000
 Bitmapped:  1-10
 */
@property (nonatomic) NSInteger ZplWidthFactor;
/*!恢复初始设置
 Restore the initial settings
 */
-(void)Clear;
/*TextSetting object copy*/
-(void)AssignValue:(TextSetting *) setting;





@end
