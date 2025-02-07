#define RT_FT_DEFAULT                0x00
#define RT_FT_FONTA                  0x00
#define RT_FT_FONTB                  0x01
#define RT_FT_INVSERSE               0x02
#define RT_FT_BOLD                   0x08
#define RT_FT_DHEIGHT                0x10
#define RT_FT_DWIDTH                 0x20
#define RT_FT_UNDERLINE              0x80

#define RT_CCM_DEFAULT               0x00
#define RT_CCM_DWIDTH                0x04
#define RT_CCM_DHEIGHT               0x08
#define RT_CCM_UNDERLINE             0x80


/*!设置是否可用*/
typedef enum {
    /*!不进行设置 Not set*/
    Set_NoSetting = -1,
    /*!禁用 Disabled*/
    Set_DisEnable = 0,
    /*!启用 Enabled*/
    Set_Enabled = 1
} SettingMode;

/*!对齐模式 Alignment mode*/
typedef enum{
    /*!不进行设置 Not set*/
    Align_NoSetting = -1,
    /*!左对齐 Align left*/
    Align_Left = 0,
    /*!居中 Align Center*/
    Align_Center = 1,
    /*!右对齐 Align Right*/
    Align_Right = 2,
    /*!全齐 Align Full*/
    Align_Full=3
} Alignment;

/*!
 编码类型
 encoding type
 - Encoding_GBK: GBK
 - Encoding_UTF8: UTF8
 */
typedef enum{
    Encoding_GBK = 0,
    Encoding_UTF8 = 1
}EncodingType;


/*!切刀模式
  Cutter mode
 */
typedef enum{
    /*!不切 Don't cut*/
    CutterMode_None = 0,
    /*!半切 Half cut*/
    CutterMode_half = 1,
    /*!全切 All cut*/
    CutterMode_Full = 2,
} CutterMode;


/*! 页长单位(for Pin)
  Page length unit
 */
typedef enum{
    /*!以行为单位，*/
    PageUnit_Row=0,
    /*!以英寸为单位，*/
    PageUnit_inch=1
}PageUnit;


/*!
  跳行模式(for Pin)
 Jump mode
*/
typedef enum {
    /*!正向跳行 Forward jump*/
    JumpMode_Forward=0,
    /*!逆向跳行 Reverse jump*/
    JumpMode_Reverse=1
} JumpMode;



/*!
 行距模式(for Pin)
 Row spacing mode
 */
typedef enum {
    /*! 设定 n/60行距  Set n/60 line spacing */
    Row60th = 1,
    /*! 设定 n/180行距 Set n/180 line spacing*/
    Row180th = 2,
    /*!设定 n/360行距  Set n/360 line spacing*/
    Row360th = 3,//
    /*!设定 1/6 行距 Set 1/6 line spacing */
    RowOneSixth = 4,
   /*! 设定 1/8 Set 1/8 line spacing行距*/
    RowOneeighth = 5,
} RowSpacingMode;


/*!
  打印方向(for Pin)
 Print direction
 */
typedef enum {
    /*!为双向打印字符，图象及双重打印作单向打印
     double sided printing characters
     */
    Print_double_sided = 0,
    /*!单向打印 single sided*/
    Print_single_sided = 1,
    /*! 全双向打印(包括图象) Print_Full_sided (Including images)*/
    Print_Full_sided = 2
} PrintDirectionMode;

/*!
  针打的字体风格
  Font style (For pin)
 */

typedef enum{
    /*!正常 Normal*/
    FontStyle836_Normal=0,
    /*!中空 Hollow*/
    FontStyle836_Hollow=1,
    /*!带阴影 shadow*/
    FontStyle836_shadow=2,
    /*!带阴影且中空 shadow And Hollow*/
    FontStyle836_shadowAndHollow=3
}FontStyle836;



/*!
   蓝牙类别 Bluetooth kind
 */
typedef enum {
    /*!ble 蓝牙*/
    BlueToothKind_Ble = 0,
    /*!经典蓝牙*/
    BlueToothKind_Classic = 1,
} BlueToothKind;

/*!
   蓝牙的当前的操作状态
   The current operating status of Bluetooth
 */
typedef enum {
    /*!停止扫描 Stop scanning*/
    BleScanComplete,
    /*正在扫描 Scanning*/
    BleScanDevice,
}BleServiceStatus;

/*!
  ESC字体类型（For ESc）
  ESC font type
 */
typedef enum{
    /*!A Font（12*24）*/
    ESCFontType_FontA = 0,
    /*!B Font（9*17）*/
    ESCFontType_FontB = 1,
} ESCFontType;

/*!
 TSC字体类型（For TSC）
 TSC 字体类型
 */
typedef enum{
    /*!8x12 英数字体 fixed pitch dot font*/
    TSCFontType_Font1 = 1,
    /*!12X20 英数字体 fixed pitch dot font*/
    TSCFontType_Font2 = 2,
    /*!16X24 英数字体 fixed pitch dot font*/
    TSCFontType_Font3 = 3,
    /*!24X32 英数字体 fixed pitch dot font*/
    TSCFontType_Font4 = 4,
    /*!32X48 英数字体 fixed pitch dot font*/
    TSCFontType_Font5 = 5,
    /*!14X19 英数字体 OCR-B fixed pitch dot font*/
    TSCFontType_Font6 = 6,
    /*!14x25英数字体 OCR-A fixed pitch dot font*/
    TSCFontType_Font7 = 7,
    /*!21X27英数字体 OCR-B fixed pitch dot font*/
    TSCFontType_Font8 = 8,
    /*!繁体中文 24x24 字体(大五码) TST24.BF2 Traditional Chinese 24 x 24 font*/
    TSCFontType_TST24 = 9,
    /*!简体中文 24x24 字体(GB 码) TSS24.BF2 Simplified Chinese 24 x 24 font (GB)*/
    TSCFontType_TSS24 = 10,
    /*!韩文 24x24 字体(KS 码) K  Korean 24 x 24 font (KS)*/
    TSCFontType_K=11,
} TSCFontType;


/*!
 CPCL字体类型（for CPCL）
 CPCL type
 */
typedef enum{
    CPCLFontType_Font1 = 1,
    CPCLFontType_Font2 = 2,
    CPCLFontType_Font3 = 3,
    CPCLFontType_Font4 = 4,
    CPCLFontType_Font5 = 5,
    CPCLFontType_Font6 = 6,
    CPCLFontType_Font7 = 7,
} CPCLFontType;

/*!
 ZPL字体类型（for ZPL）
 ZPL type
 */

typedef enum {
    ZplFontType_Vector = 0,//矢量字体 Vector font
    ZplFontType_Font1 = 1,
    ZplFontType_Font2 = 2,
    ZplFontType_Font3 = 3,
    ZplFontType_Font4 = 4,
    ZplFontType_Font5 = 5,
    ZplFontType_Font6 = 6,
    ZplFontType_Font7 = 7,
    ZplFontType_Font8 = 8,
    ZplFontType_Font9 = 9,
    ZplFontType_FontA = 10, //A
    ZplFontType_FontB = 11, //B
    ZplFontType_FontC = 12, //C
    ZplFontType_FontD = 13, //D
    ZplFontType_FontE = 14, //E
    ZplFontType_FontF = 15, //F
    ZplFontType_FontG = 16, //G
} ZPLFontType;

/*!
 条码类别 barcode type
 - BarcodeTypeUPC_A: UPC_A
 - BarcodeTypeEAN13:  EAN13
 - BarcodeTypeEAN8:  EAN8
 - BarcodeTypeCODE39: CODE39
 - BarcodeTypeITF:  ITF
 - BarcodeTypeCODABAR:  CODABAR
 - BarcodeTypeQrcode: Qrcode
 */

typedef enum{
    BarcodeTypeUPC_A=0,
    BarcodeTypeUPC_E=1,
    BarcodeTypeEAN13=2,
    BarcodeTypeEAN8=3,
    BarcodeTypeCODE39=4,
    BarcodeTypeITF =5,
    BarcodeTypeCODABAR=6,
    BarcodeTypeCODE128=7,
    BarcodeTypeQrcode=8,
    BarcodeTypeCODE93=9,//not support
}BarcodeType;


/*!
  打印条码返回的值 Print the value returned by the bar code
 - PrinterCodeOK: 条码正确 The bar code is correct
 - PrinterCodeTooLong: 条码太长 Bar code is too long
 - PrinterCodeFormatError: 条码格式有误 Barcode format is wrong
 - PrinterCodeUnknowType: 未知条码类型 Unknown barcode type
 - PrinterCodeTooShort: 条码太短 Barcode is too short
 */
typedef enum {
    PrinterCodeOK = 0,
    PrinterCodeTooLong = -1,
    PrinterCodeFormatError = -2,
    PrinterCodeUnknowType = -3,
    PrinterCodeTooShort = -4,
    
}PrinterCodeError;

/*!
 条码文字显示位置 Bar code text display position
 for ESC
 - BarcodeHRIpos_noprint: 不打印 not printer
 - BarcodeHRIpos_above: 在条码上方 Above the bar code
 - BarcodeHRIpos_Below:  在条码下方 Under the bar code
 - BarcodeHRIpos_both: 在条码的上方及下方 Above and below the bar code

 */
typedef enum{
    BarcodeHRIpos_noprint=0,
    BarcodeHRIpos_above=1,
    BarcodeHRIpos_Below=2,
    BarcodeHRIpos_both=3,
}BarcodeHRIpos;

/*!条码顺时间旋转  Bar code clockwise rotation
  ESC 只能旋转90度 ESC Can only rotate 90 degrees
 */
typedef enum{
    /*!不旋转 Do not rotate */
   Rotate0=0,
   /*!顺时间旋转90度 Rotate 90 degrees*/
   Rotate90=1,
   /*!顺时间旋转180度 Rotate 180 degrees*/
   Rotate180=2,
  /*!顺时间旋转270度 Rotate 270 degrees*/
   Rotate270=3,
} RotateType;

/*!
   标签打印方向(for TSC,CPCL,zpl)
   Label printing direction
 */
typedef enum{
   Direction_Forward=0,
   Direction_Reverse=1,
}LableDirection;


/*!
  坐标 coordinate
 */
struct Coordinate {
    NSInteger x;
    NSInteger y;
    /*!TSC Qrcode width=1~10*/
    NSInteger width;
    NSInteger height;
};
typedef struct Coordinate Coordinate;

/*!错误纠正能力等级  Error correction level
  适用于TSC的二维码 Two-dimensional code for TSC
 */
typedef enum{
    /*!%7*/
    ECC_level_L,
    /*!%15*/
    ECC_level_M,
     /*!%25*/
    ECC_level_Q,
    /*!30%*/
    ECC_level_H
}ECC_level;

/*!连接端口类型
  Connection port type
 */
typedef enum {
    PrinterPortWifi=0,
    PrinterPortBle=1,
    PrinterPortMFI=2,
}PrinterPortType;

/*!
  指令类型
  Instruction type
 */
typedef enum {
    PrinterCmdESC = 0,
    PrinterCmdTSC = 1,
    PrinterCmdCPCL = 2,
    PrinterCmdPIN = 3,
    PrinterCmdZPL = 4
}PrinterCmdType;

/*!
 打印机状态询问命令 
 printer Stauts enquiry
 */
typedef enum {
    /*!
     未定义
     unknown
     */
    PrnStautsCmd_unknown = 0,
    /*!
     410询问打印机当前状态 for RP410, ZPL
     Printer status, such as paper jam, out of paper, open cover, etc.
     */
    PrnStautsCmd_HQPRNSTA410 = 1,
    /*!
     for Rpp806 TSC, for Rpp80 ESC
     打印机的状态，如卡纸，缺纸，开盖等
     Printer status, such as paper jam, out of paper, open cover, etc.
     */
    PrnStautsCmd_Normal = 2,
    /*!
     for Rpp806 TSC
     已打印的里程单位：m
     Mileage printed: m
     */
    PrnStautsCmd_Mileage = 3,
    /*!
     for Rpp806 TSC
     打印机模块名，及系列号
     Printer module name, and serial number
     */
    PrnStautsCmd_ModelName = 4,
    /*!
     for Rpp806 TSC
     打印机内存大小:单位：Byte
     Printer memory size: unit: Byte
     */
    PrnStautsCmd_MemorySize = 5,
    /*!
     for Rpp806 TSC
     打印成功,打印机自动返回
     The print is successful and the printer automatically returns
     */
    PrnStautsCmd_PrintEnd=6,
}PrintStautsCmd;

/*!
   设置页长命令 for pin
   Setting the page Length

 */
typedef enum {
    pglen_INCH_3=0, //3 inch
    pglen_INCH_11_divided_by_3=1, //11/3 inch
    pglen_INCH_3_5=2,//3.5 inch
    pglen_INCH_4=3,//3 inch
    pglen_INCH_5=4,
    pglen_INCH_5_5=5,//5.5
    pglen_INCH_6=6,
    pglen_INCH_7=7,
    pglen_INCH_11=8,
    pglen_INCH_A4_11_6=9,//11.6
    pglen_INCH_12=10,//10
    pglen_INCH_14=11,
}PageLengthType;




