//
//  ChangePassWordViewController.m
//  
//
//  Created by bocweb on 15/12/8.
//
//

#import "ChangePassWordViewController.h"
#import "SSKeychain.h"
@interface ChangePassWordViewController ()
@property (weak, nonatomic) IBOutlet UIView *oldPasswordBGView;
@property (weak, nonatomic) IBOutlet UITextField *oldTF;

@property (weak, nonatomic) IBOutlet UIView *inputPassWordBGView;
@property (weak, nonatomic) IBOutlet UITextField *inputPassWordTF;

@property (weak, nonatomic) IBOutlet UIView *maekSureBGView;
@property (weak, nonatomic) IBOutlet UITextField *makeSureTF;

@property (weak, nonatomic) IBOutlet UIButton *markSureChange;

@end

@implementation ChangePassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    [self configureTF];
}
- (void)configureTF {
    [self configureTexFiled:self.oldTF imageNage:@"register_lockSure" bgView:self.oldPasswordBGView];
    [self configureTexFiled:self.inputPassWordTF imageNage:@"register_lock" bgView:self.inputPassWordBGView];
    [self configureTexFiled:self.makeSureTF imageNage:@"register_lock" bgView:self.maekSureBGView];
    self.markSureChange.layer.cornerRadius = 5;
    self.markSureChange.layer.masksToBounds = YES;
}
- (void)configureTexFiled:(UITextField *)tf
                imageNage:(NSString *)imageName
                   bgView:(UIView *)bgVIew {
    [KeyboardToolBar registerKeyboardToolBar:tf];
    bgVIew.layer.cornerRadius = 5;
    //左侧图标
    UIImageView *iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    iconImageView.frame = CGRectMake(0, 0, 40, 40);
    iconImageView.contentMode = UIViewContentModeCenter;
    tf.leftView = iconImageView;
    tf.leftViewMode = UITextFieldViewModeAlways;
}
#pragma mark - 点击修改密码
- (IBAction)handleChange:(UIButton *)sender {
    MyLog(@"点击了");
//    [self changePassWord];
}
- (void)changePassWord {
    if (![self checkOut])return;
    //网络请求
    NSString *netPath = @"";
    NSMutableDictionary *allParameters = [NSMutableDictionary dictionary];
    [allParameters setObject:@"" forKey:@""];
//    [allParameters setObject:self.oldTF.text.md5String forKey:@"ordpwd"];
//    [allParameters setObject:self.makeSureTF.text.md5String forKey:@"newpwd"];
    [HttpTool postWithPath:netPath params:allParameters success:^(id responseObj) {
        if ([responseObj[@"returnNo"] integerValue] == 0 ) {
            [TSMessage showNotificationInViewController:self title:@"温馨提示" subtitle:@"修改成功" type:TSMessageNotificationTypeSuccess duration:2];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
        } else {
            [TSMessage showNotificationInViewController:self title:@"温馨提示" subtitle:responseObj[@"returnInfo"] type:TSMessageNotificationTypeSuccess duration:2];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (NSInteger)checkOut {
    NSArray *array = @[self.oldTF, self.inputPassWordTF, self.makeSureTF];
    for (int i = 0; i < array.count; i++) {
        if (![self checkUserInputWithTF:array[i]]) {
            return 0;
        }
    }  if (![self.inputPassWordTF.text isEqualToString:self.makeSureTF.text]) {
           [TSMessage showNotificationInViewController:self title:@"温馨提示" subtitle:@"两次输入的密码不一致" type:TSMessageNotificationTypeWarning duration:2];
        return 0;
    } else if ([self.oldTF.text isEqualToString:self.makeSureTF.text]) {
        [TSMessage showNotificationInViewController:self title:@"温馨提示" subtitle:@"新旧密码一样" type:TSMessageNotificationTypeWarning duration:2];
        return 0;
    }
    return 1;
}
- (NSInteger)checkUserInputWithTF:(UITextField *)tf {
    NSInteger ident = 1;
    NSString *str = tf.placeholder;
    if (!tf.text.length) {
        [TSMessage showNotificationInViewController:self title:@"温馨提示" subtitle:str type:TSMessageNotificationTypeError duration:2];
        ident = 0;
    }
    return ident;
}

@end
