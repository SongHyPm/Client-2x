
--最多显示的效果数量
function BankLockFast_PreLoad()
	this:RegisterEvent("BANK_LOCKFAST_UPDATE");
end

function BankLockFast_OnLoad()
end

function BankLockFast_OnEvent(event)
	if ( event == "BANK_LOCKFAST_UPDATE" ) then
		local careobjid = Target:GetServerId2ClientId(tonumber(arg0));
		this:CareObject(careobjid, 1, "BankLockFast");
		BankLockFast_update();
		this:Show();
	end
end

function BankLockFast_tiqu_Clicked()
	SafeBox("getmoney");
end

function BankLockFast_cunru_Clicked()
	SafeBox("savemoney");
end

function BankLockFast_kaiqi_Clicked()
	SafeBox("unlock");
end

function BankLockFast_suoding_Clicked()
	SafeBox("lock");
end

function BankLockFast_update()
	local boxstatus = SafeBox("getstatus");
	local statusmsg;
	local finalmsg;
	if(boxstatus == "locked") then
		BankLockFast_Save:Enable();
		BankLockFast_Lock:Disable();
		BankLockFast_Get:Disable();
		BankLockFast_Unlock:Enable();
		statusmsg = "Tr課g th醝 b鋙 hi琺 s呓ng: #GKh骯 懈nh#W#r"
		finalmsg = statusmsg.."#{YHBXX_20071220_14}";
	elseif(boxstatus == "freezed") then
		BankLockFast_Save:Enable();
		BankLockFast_Lock:Enable();
		BankLockFast_Get:Disable();
		BankLockFast_Unlock:Disable();
		local leftday  = SafeBox("getleftday");
		local lefthour = SafeBox("getlefthour");
        statusmsg = string.format("Tr課g th醝 b鋙 hi琺 s呓ng: #GTrong th秈 gian Gi鋓 kh骯#W (c騨 #G%d#W ng鄖 #G%d#W gi�) #r",leftday,lefthour);
		finalmsg = statusmsg.."#{YHBXX_20071220_15}";
	elseif(boxstatus == "unfreezed") then
		BankLockFast_Save:Enable();
		BankLockFast_Lock:Enable();
		BankLockFast_Get:Enable();
		BankLockFast_Unlock:Disable();
		statusmsg = "Tr課g th醝 b鋙 hi琺 s呓ng: #GGi鋓 Kh骯#W#r"
		finalmsg = statusmsg.."#{YHBXX_20071220_16}";
	end
	BankLockFast_WarningText:SetText(finalmsg);
	
	local safeboxmoney = SafeBox("getsafeboxmoney");
	BankLockFast_Money:SetProperty("MoneyNumber", safeboxmoney);	

end

function BankLockFast_Close()
	SafeBox("onclose");
end