
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.yasin.ChangeWXMoney.plist"

%hook WCPayBalanceInfo
-(long)m_uiAvailableBalance{

    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:PLIST_PATH];
    if(dic&&dic[@"MoneySwitch"]){
        BOOL MoneySwitch = [dic[@"MoneySwitch"] boolValue];

        CGFloat money = [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:@"money"] floatValue];

        if(MoneySwitch){
            return %orig+100*money;
        }
    }
    return %orig;
}
%end
