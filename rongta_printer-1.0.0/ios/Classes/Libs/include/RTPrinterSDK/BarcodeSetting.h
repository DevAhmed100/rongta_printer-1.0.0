//
//  BarcodeSetting.h
//  RTPrinterSDK
//
//  Created by King on 28/12/2017.
//  Copyright © 2017 Rongta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnumTypeDef.h"
/*!
 条码设置
 Barcode settings
 */
@interface BarcodeSetting : NSObject<NSCopying>
/*!设置对齐方式(仅ESC指令使用)
 Set alignment (for ESC)
 */
@property (nonatomic) Alignment Alignmode;
/*!条码字符的位置 
 The location of barcode characters
 */
@property (nonatomic) BarcodeHRIpos HRIPos;
/*!选择HRI字体类型 Default:ESCFontType_FontA
  Select HRI font type
 */
@property (nonatomic) ESCFontType HRIFonttype;
/*!旋转度数
 Degree of rotation
 */
@property (nonatomic) RotateType Rotate;

/*!
  条码的坐标
  ESC->coord.height   Default:162
  ESC->coord.width <coord.width<=6  Default:3
  ESC->coord.x  0=<coord.x<=255 Default 0
  TSC->QRcode 1=<coord.widh<=10
 */
@property (nonatomic) Coordinate coord;

/*!
 是否显示条码文字 Yes:为启用（Default） fase:禁用
 Display barcode text Yes: Enabled (Default) false:Disable
 */
@property (nonatomic) BOOL IsDispBarHRI;

/*!
 窄条码比例因子(dot) default:2  适用于TSC
 width of narrow element in dot
 */
@property (nonatomic) NSInteger narrow;

/*!
 宽条码比例因子(dot) for TSC default:4
  width of wide element in dot
 */
@property (nonatomic) NSInteger wide;
/*!错误纠正能力等级(for TSC QRcode)
 Error correction level
 */
@property (nonatomic) ECC_level ECClevel;

/*!
 宽条与窄条的比率 1〜30 for Cpcl
 The ratio of wide element to narrow element
 */
@property (nonatomic) NSInteger ratio;

/*!
 二维码放大系数1〜10  for zpl
 Two-dimensional code magnification factor 1 ~ 10
 */
@property (nonatomic) NSInteger qrcodeDotSize;


/*!BarcodeSetting object copy*/
-(void)AssignValue:(BarcodeSetting *) setting;

/*!
 Restore the initial settings
 */
-(void)Clear;
@end
