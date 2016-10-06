-- ******************************************
--
-- �绰�ܱ��������ʾ����
--
-- ******************************************

-- ����LoginServer.txt�ļ����ܱ��绰����Ŀ
local MiBaoDhCount = 0
-- ����LoginServer.txt�ļ����ܱ��绰��������Ŀ
local GroupNum = 0

-- ������ʾ���ܱ��绰������Ŀ
local MiBaoPhoneCount = 6
-- ���ڽ�����ʾ�ܱ��绰����Ŀؼ�����
local MiBaoTextCtrl = {};
-- LoginServer.txt�ļ���ȫ���ܱ��绰���������飬��ʵ��ֻ��[0,GroupNum-1]��ѡ��6�飬ÿ��1����
local MiBaoGroupAndIndex = {};
-- ���ڽ�����ʾ��6���ܱ��绰��������
local PasswdProctectTels = {};

--���ڱ����ܱ��绰��������
local MiBaoGroupArea = {};
--���ڱ����ܱ��绰�����Ȩ��
local MiBaoGroupWeight = {};

local g_LastLockTime = 0;

function TelMibaoTishi_PreLoad()
	this:RegisterEvent("OPEN_DIANHUAMIBO_TIPS");
	this:RegisterEvent("OPEN_WINDOW");
	this:RegisterEvent("PLAYER_LEAVE_WORLD");
	this:RegisterEvent("CLEANUP_TIME_TICK");
end

function TelMibaoTishi_OnLoad()
	-- ��ʼ��6���绰�ܱ��ؼ�
	MiBaoTextCtrl = {	TelMibaoTishi_Text2;
										TelMibaoTishi_Text3;
										TelMibaoTishi_Text4;
										TelMibaoTishi_Text5;
										TelMibaoTishi_Text6;
										TelMibaoTishi_Text7;
									}
	
	-- �����ܱ��绰���������͵绰�����ʼֵ
	TelMibaoTishi_ResetIndexAndTel();
end

function TelMibaoTishi_OnEvent( event )
	if ( event == "OPEN_DIANHUAMIBO_TIPS" ) then
		if( this:IsVisible() ) then
			TelMibaoTishi_Close();
		else
			TelMibaoTishi_Open();
		end
	elseif (event == "OPEN_WINDOW") then		
		if( arg0 == "TelMibaoTishi") then
			TelMibaoTishi_Open();
		end
	elseif(event == "PLAYER_LEAVE_WORLD" and this:IsVisible()) then
		TelMibaoTishi_Close();
	elseif (event == "CLEANUP_TIME_TICK") then
		g_LastLockTime = 0;
	end
end

function TelMibaoTishi_Close()
	TelMibaoTishi_ResetIndexAndTel();
	TelMibaoTishi_Watch:SetProperty("Timer",0);
	this:Hide();
end

function TelMibaoTishi_Open() 	
-- ��ȴʱ��
--PushDebugMessage("hhh");
		local nNowTickCount = Exchange:GetTickCount();		
		if(g_LastLockTime >0 and (nNowTickCount - g_LastLockTime) < 120*1000) then
			PushDebugMessage("#{DHMB_90417_7}");
			return;
		end
	TelMibaoTishi_Watch:SetProperty("Timer",3);
	TelMibaoTishi_Verify:Disable();
			
	CloseWindow("ErjimimaShezhi", true)
	CloseWindow("ErjimimaXiugai", true)
	CloseWindow("ErjimimaJiesuo", true)
	CloseWindow("Fangdao", true)
	CloseWindow("SafeTime", true);
	CloseWindow("DianhuaMibao", true)
	
	-- �õ�ȫ���ܱ��绰����Ŀ
	MiBaoDhCount = GameProduceLogin:GetPasswdTelCount();
	
	-- �ж��Ƿ���LoginServer.txt�ﶨ���˵绰�ܱ����롣
	if (MiBaoDhCount > 0) then		
		TelMibaoTishi_InitDlg();
		this:Show();
		TelMibaoTishi_SetRandomTelNum();				-- ���������ʾ�ĵ绰�ܱ�����	
	else		
		OpenWindow("TelMiBaoErrMsg");						-- �򿪵绰�ܱ��Ĵ�����ʾ����
		this:Hide();
	end
end

function TelMibaoTishi_InitDlg()	
	TelMibaoTishi_ResetIndexAndTel();
end

function TelMibaoTishi_Frame_OnHiden()
	TelMibaoTishi_ResetIndexAndTel();
	this:Hide();
end

-- ��֤
function TelMibaoTishi_OnVerify()
	local nNowTickCount = Exchange:GetTickCount();	
	g_LastLockTime = nNowTickCount;	
	AskPhoneMibaoStatus();
	this:Hide();
end

-- ȡ��
function TelMibaoTishi_OnCancel()
	TelMibaoTishi_ResetIndexAndTel();
	this:Hide();
end

-- �����ܱ��绰���������͵绰�����ʼֵ
function TelMibaoTishi_ResetIndexAndTel()
	-- �������潫Ҫ�õ����ܱ��绰�ַ����ĳ�ֵ
	for i=1,MiBaoPhoneCount do
		PasswdProctectTels[i] = ""
	end
	
	-- ��ʼ���ܱ��绰���������;�������
	for i=1,MiBaoPhoneCount do
		MiBaoGroupAndIndex[i]={}
		MiBaoGroupAndIndex[i].group = -1
		MiBaoGroupAndIndex[i].index = -1
	end
end

-- ���������ʾ�ĵ绰�ܱ�����
--function TelMibaoTishi_SetRandomTelNum()
	-- �����ܱ��绰���������͵绰�����ʼֵ
--	TelMibaoTishi_ResetIndexAndTel();
--	
	-- �õ��绰���ŷ�������Ŀ
--	GroupNum = GameProduceLogin:GetPasswdTelLDCodeGroupCount();
--
	-- ���LoginServer.txt�ļ����������ܱ��绰�����û�������ܱ����ڵ��øú���ǰ�Ѿ��������жϣ����Բ��ÿ��������������
--	if( MiBaoDhCount > 0 ) then
		-- ���ȫ���ܱ��绰����Ŀ���ڵ���6������Ӳ�ͬ�ķ�����ѡȡ�����������ʾ
--		if( MiBaoDhCount >= MiBaoPhoneCount) then			
			-- ���������Ŀ���ڵ���6�飬�����ȡ6��������ÿ������ȡ����һ���绰��������ʾ
--			if (GroupNum >= MiBaoPhoneCount) then
				-- ��ʼ��ȫ��������û�б�ѡ��
--				local bGroupExist = {};
--				for i = 0, GroupNum-1 do
--					bGroupExist[i] = 0
--				end			
--
--				for i = 1, MiBaoPhoneCount do
					-- ��[0,GroupNum-1]֮��ȡһ�����������Ϊ��ǰ���ܱ��绰�������������ѡ�����Ѿ��ù��ģ�������ѡ��ֱ���ҵ�һ����δ��ѡ�й��ķ�����
--					local iTmpGroupIdx = math.random(0,GroupNum-1);
--					while (1 == bGroupExist[iTmpGroupIdx]) do
--						iTmpGroupIdx = math.random(0,GroupNum-1)
--					end
--					MiBaoGroupAndIndex[i].group = iTmpGroupIdx;
--					bGroupExist[iTmpGroupIdx] = 1;
--
					-- �õ���ǰ�����е绰����������������ڵ绰������ĿΪ0�ķ�����
--					local iGroupSize = GameProduceLogin:GetPasswdTelCountByLDCodeGroupIndex(iTmpGroupIdx);
--							
					-- �ڷ�����ȡһ���������
--					local iTmpIdx = math.random(0, iGroupSize-1);
--					MiBaoGroupAndIndex[i].index = iTmpIdx;
--				end
--  			
			-- ���������Ŀ����6��
--			else
				-- �õ�ÿ�������е绰�������Ŀ
--				local iGroupSize = {};
--				for i = 0, GroupNum-1 do
--					iGroupSize[i] = GameProduceLogin:GetPasswdTelCountByLDCodeGroupIndex(i);
--				end
--				
				-- ��ʼ��ÿ�������Ƿ��е绰�������ȡ�ı��
--				local bGroupFull = {};
--				for i = 0, GroupNum-1 do
--					bGroupFull[i] = 0;				
--				end
--				
				-- ��ʼ��ÿ������ÿ���������Ѿ�ȡ�õĺ�����Ŀ
--				local bGetGroupTel = {};
--				for i = 0, GroupNum-1 do
--					iGetGroupTel[i] = 0;				
--				end
--				
--				local iGetCount = 0
--				local iTmpGroupIdx = -1
				-- ѭ����ÿ��������ȡ������룬���һ������ȡ���ˣ��ٴӵ�1��������ʼȡ���������ơ�
				-- ���ĳ������ֻ��1���绰���룬�´���ѭ�����÷����������������������һ��������ȡ���롣
--				while (iGetCount < MiBaoPhoneCount) do
				--while (iGetCount < 5) do
					-- ȡ��ѭ���е�ǰ�ķ�������						
--					if (iGetCount >= GroupNum) then
--						iTmpGroupIdx = math.mod(iGetCount, GroupNum);
--					else
--						iTmpGroupIdx = iGetCount;
--					end
--					
					-- �����ǰ�ķ������޺������ȡ����ȡ��һ��������ֱ���ҵ�һ������ȡ������ķ�����
--					while (1 == bGroupFull[iTmpGroupIdx])	do
--						iTmpGroupIdx = iTmpGroupIdx + 1
--						
--						if (iTmpGroupIdx >= GroupNum) then
--							iTmpGroupIdx = math.mod(iTmpGroupIdx, GroupNum)
--						end					
--					end
--          
					-- �ڷ�����ȡһ��û��ʹ�ù����������
--					local iTmpIdx = math.random(0,iGroupSize[iTmpGroupIdx]-1);
--					local bExitIdx = 0;
--					for j = 1, iGetCount do
--						if (MiBaoGroupAndIndex[j].group == iTmpGroupIdx) and (MiBaoGroupAndIndex[j].index == iTmpIdx) then
--							bExitIdx = 1
--							break
--						end
--					end
--    	    
--					if ( 1 ~= bExitIdx ) then
--						iGetCount = iGetCount + 1
						-- ��¼����ȡ�õķ��������������еĺ�������
--						MiBaoGroupAndIndex[iGetCount].group = iTmpGroupIdx
--						MiBaoGroupAndIndex[iGetCount].index = iTmpIdx
--						
						-- ��¼�ִӵ�ǰ������ȡ����һ������
--						iGetGroupTel[iTmpGroupIdx] = iGetGroupTel[iTmpGroupIdx] + 1
--						
						-- ��¼��ǰ�����Ƿ��Ѿ�û�к������ȡ��
--						if (iGetGroupTel[iTmpGroupIdx] == iGroupSize[iTmpGroupIdx]) then
--							bGroupFull[iTmpGroupIdx] = 1
--						end
--					end
--				end
--			end
--			
			--for i = 1,MiBaoPhoneCount do
			--	PushDebugMessage ("group["..i.."] = "..MiBaoGroupAndIndex[i].group..", index["..i.."] = "..MiBaoGroupAndIndex[i].index);
			--end
--			
			-- ����������ȫ���ܱ��绰�еõ�����ĺ��벢��ʾ
--			local strTel = ""
--			for num = 1,MiBaoPhoneCount do				
--				strTel = GameProduceLogin:GetPasswdTelByGroupIndexAndIndex(MiBaoGroupAndIndex[num].group, MiBaoGroupAndIndex[num].index);
--				PasswdProctectTels[num] = strTel;
--				MiBaoTextCtrl[num] : SetText(PasswdProctectTels[num])
--			end
--
		-- ȫ���ܱ��绰����Ŀ����6����˳����ʾȫ���ܱ��绰����	
--		else
			-- ����������ȫ���ܱ��绰�еõ�����ĺ��벢��ʾ
--			for i=1, MiBaoDhCount do
--				local strTel = GameProduceLogin:GetPasswdTelByIndex(i-1);
--				PasswdProctectTels[i] = strTel
--				MiBaoTextCtrl[i] : SetText(PasswdProctectTels[i])	
--			end
--		end
--	end
--	
--	return
--end

-- ���������ʾ�ĵ绰�ܱ�����(�¹���)
function TelMibaoTishi_SetRandomTelNum()
	-- �����ܱ��绰���������͵绰�����ʼֵ
	TelMibaoTishi_ResetIndexAndTel();
	
	-- �õ��绰������������Ŀ
	GroupNum = GameProduceLogin:GetPasswdTelLDCodeGroupCount();
	
	--�ܱ��绰����Ȩ���ܺ�
	local iWeightSum = 0;
	--���ڱ�������Ȩ�ز�Ϊ�����Ч����
	local MiBaoValidArea = {};
	--��Ч���������
	local ValidGroupNum = 0;
	
	-- �õ�ÿ��������Ȩ��
	for i = 0, GroupNum-1 do
		MiBaoGroupArea[i] = GameProduceLogin:GetPasswdTelAreaByGroupIndex(i);
		MiBaoGroupWeight[i] = GameProduceLogin:GetPasswdTelWeightByArea(MiBaoGroupArea[i])*100;    --����100
		if (MiBaoGroupWeight[i] >0) then
			MiBaoValidArea[ValidGroupNum] = i;
			ValidGroupNum = ValidGroupNum+1;
		end
		--�õ����е���Ȩ���ܺ�
		iWeightSum = iWeightSum + MiBaoGroupWeight[i];
	end
	
	--���Ȩ���ܺ�Ϊ0
	if ( iWeightSum == 0) then
		this:Hide();			
		OpenWindow("TelMiBaoErrMsg");						-- �򿪵绰�ܱ��Ĵ�����ʾ����
		return;
	end
	
	--��Ч�ܱ��绰��������
	local ValidTelNum = 0;   
	-- �õ�ÿ����Ч�����绰�������Ŀ
	local ValidGroupSize = {};
	for i = 0, ValidGroupNum-1 do
		ValidGroupSize[i] = GameProduceLogin:GetPasswdTelCountByLDCodeGroupIndex(MiBaoValidArea[i]);
		for j = 0,ValidGroupSize[i]-1 do
			ValidTelNum = ValidTelNum + 1;
			MiBaoGroupAndIndex[ValidTelNum].group = MiBaoValidArea[i];
			MiBaoGroupAndIndex[ValidTelNum].index = j;
		end
	end
	
	-- ���LoginServer.txt�ļ����������ܱ��绰�����û�������ܱ����ڵ��øú���ǰ�Ѿ��������жϣ����Բ��ÿ��������������
	if( MiBaoDhCount > 0 ) then
		-- �����Ч�ܱ��绰����Ŀ���ڵ���6��
		if( ValidTelNum >= MiBaoPhoneCount) then
			-- �õ�ÿ�������绰�������Ŀ
			local iGroupSize = {};
			for i = 0, GroupNum-1 do
				iGroupSize[i] = GameProduceLogin:GetPasswdTelCountByLDCodeGroupIndex(i);
			end
			
			local iGetCount = 0;     --��ú�����Ŀ
			while (iGetCount < MiBaoPhoneCount) do
				--ȡ��6������ʱ������ǰ5�����붼��ͬһ����������Ȩ�ش�����ĵ�������>=2������ѡ��ͬ�����ܱ��绰
				local bChangeArea = 0;
				if (iGetCount == MiBaoPhoneCount-1 and ValidGroupNum >= 2) then
					local index = 1;
					while (index < MiBaoPhoneCount) and ( MiBaoGroupAndIndex[index].group == MiBaoGroupAndIndex[1].group) do
						index = index + 1;
					end
					--���ǰ5������ȫ��ͬһ����
					if (index == MiBaoPhoneCount) then
						bChangeArea = 1;
					end
				end		
			
				--��[1,g_WeightSum]֮��ȡһ�������
				local num = math.random(1,iWeightSum);
				for j = 0,GroupNum-1 do
					if( num > TelMibaoTishi_AddWeight(j) and num <= TelMibaoTishi_AddWeight(j+1)) then
						iTmpGroupIdx = j;
					end
				end
				
				--ȡ�ĵ�6������ʱ�������ͬһ�������򷵻�����ȡ�����
				if (bChangeArea == 1 and iTmpGroupIdx == MiBaoGroupAndIndex[1].group) then
					continue;
				end
			
				-- �ڷ�����ȡһ��û��ʹ�ù����������
				local iTmpIdx = math.random(0,iGroupSize[iTmpGroupIdx]-1);
				local bExitIdx = 0;
				for j = 1, iGetCount do
					if (MiBaoGroupAndIndex[j].group == iTmpGroupIdx) and (MiBaoGroupAndIndex[j].index == iTmpIdx) then
						bExitIdx = 1
						break
					end
				end
				
				if ( 1 ~= bExitIdx ) then
					iGetCount = iGetCount + 1
					-- ��¼����ȡ�õķ��������������еĺ�������
					MiBaoGroupAndIndex[iGetCount].group = iTmpGroupIdx;
					MiBaoGroupAndIndex[iGetCount].index = iTmpIdx;
				end
			end
			
			-- ����������ȫ���ܱ��绰�еõ�����ĺ��벢��ʾ
			local strTel = ""
			for num = 1,MiBaoPhoneCount do				
				strTel = GameProduceLogin:GetPasswdTelByGroupIndexAndIndex(MiBaoGroupAndIndex[num].group, MiBaoGroupAndIndex[num].index);
				PasswdProctectTels[num] = strTel;
				MiBaoTextCtrl[num] : SetText(PasswdProctectTels[num])
			end
		else
			-- ����������ȫ����Ч�ܱ��绰�еõ�����ĺ��벢��ʾ
			for i =1, ValidTelNum do
				local strTel = GameProduceLogin:GetPasswdTelByGroupIndexAndIndex(MiBaoGroupAndIndex[i].group, MiBaoGroupAndIndex[i].index);
				PasswdProctectTels[i] = strTel
				MiBaoTextCtrl[i] : SetText(PasswdProctectTels[i])	
			end
		end
	end
	
	return
end

function TelMibaoTishi_AddWeight( index )
	local sum = 0;
	for i = 1,index do
		sum = sum + MiBaoGroupWeight[i-1];
	end
	return sum;
end


function TelMibaoTishi_TimeReach()
	TelMibaoTishi_Verify:Enable();
end