//
//  LabelCommonSetting.h
//  RTPrinterSDK
//
//  Created by King on 29/12/2017.
//  Copyright © 2017 Rongta. All rights reserved.
//

#import "CommonSetting.h"



/*!
 标签设置 for TSC,Cpcl，Zpl
 Label setting
 */
@interface LabelCommonSetting : CommonSetting

/*!标签间隙
  Label gap
 */
@property (nonatomic) NSInteger labelgap;
/*!标签宽度 for TSC,Cpcl 
 Label width
 */
@property (nonatomic) NSInteger labelWidth;
/*!标签高度
   Lable Height
 */
@property (nonatomic) NSInteger labelHeight;
/*!标签打印出纸方向 for TSC
   Label Driection
 */
@property (nonatomic) LableDirection labelDriection;
/*!打印速度 for TSC,cpcl
   print speed  TSC:speed=2~5  cpcl:speed=0~5;
 */
@property (nonatomic) NSInteger speed;
/*!控制打印时的浓度 for TSC
  density = 0~15
 */
@property (nonatomic) NSInteger Density;

/*!
 打印份数 for cpcl
 Print copies
 */
@property (nonatomic) NSInteger printCopies;
-(void)AssignValue:(LabelCommonSetting *) setting;


@end
