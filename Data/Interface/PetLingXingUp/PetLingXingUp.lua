local m_UI_NUM = 20090805	--������������

local m_PetIndex = -1
local m_ObjCared = -1
--����1-10�Ľ�Ǯ����
local m_money = { 10000 , 12000 , 14400 ,17280 , 20736,  24883 , 29860 , 35832 ,42998 , 51598}

function PetLingXingUp_PreLoad()
	this : RegisterEvent( "UI_COMMAND" )
	this : RegisterEvent( "REPLY_MISSION_PET" )						-- ��Ҵ��б�ѡ��һֻ����
	this : RegisterEvent( "UPDATE_PET_PAGE" )						-- ������ϵ��������ݷ����仯����������һֻ����
	this : RegisterEvent( "DELETE_PET" )							-- ������ϼ���һֻ����
	this : RegisterEvent("UNIT_MONEY");
	this : RegisterEvent("MONEYJZ_CHANGE")	
end



function PetLingXingUp_OnLoad()


end



function PetLingXingUp_OnEvent(event)

	if event == "UI_COMMAND" and tonumber( arg0 ) == m_UI_NUM then
		
		if this : IsVisible() then
			return
		end
		
		PetLingXingUp_CleanUp()
		PetLingXingUp_BeginCareObj( Get_XParam_INT(0) );
		this:Show()
		Pet : ShowPetList( 1 )
		PetLingXingUp_SelfMoney:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY")));
		PetLingXingUp_SelfJiaozi:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY_JZ")));

	elseif (event == "UNIT_MONEY" and this : IsVisible()) then
		PetLingXingUp_SelfMoney:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY")));
		PetLingXingUp_UICheck()
	elseif (event == "MONEYJZ_CHANGE" and this : IsVisible() ) then
		PetLingXingUp_SelfJiaozi:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY_JZ")));
		PetLingXingUp_UICheck()
	elseif event == "REPLY_MISSION_PET" and this : IsVisible() then
		
		PetLingXingUp_OnSelectPet( tonumber( arg0 ) )
	elseif event == "UPDATE_PET_PAGE"  and this:IsVisible() then
		PetLingXingUp_CleanUp()
	elseif event == "DELETE_PET"  and this:IsVisible() then
		this:Hide()
	end

end


--Close
function PetLingXingUp_Close_Window()
	this:Hide();
end

--OK
function PetLingXingUp_OK_Clicked()
	if m_PetIndex == -1  then
		return
	end
	
	local isExist = IsItemExist(20310116)
	if isExist == 0 then
		isExist = IsItemExist(20310160)
		if isExist == 0 then
			PushDebugMessage("#{RXZS_090804_15}")  --������ȱ�������������ϣ����޾��ǡ�
			return
		end
	end
	local hid,lid = Pet:GetGUID(m_PetIndex);
	Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name( "Pet_LXUP" )
		Set_XSCRIPT_ScriptID( 800124 )
		Set_XSCRIPT_Parameter( 0, hid )
		Set_XSCRIPT_Parameter( 1, lid )
		Set_XSCRIPT_ParamCount( 2 )
	Send_XSCRIPT()
end

--Select Pet
function PetLingXingUp_SelectPet_Clicked()
	Pet : ShowPetList( 0 )
	Pet : ShowPetList( 1 )
end




function PetLingXingUp_Pet_Modle_TurnLeft( start )
	--������ת��ʼ
	if(start == 1) then
		PetLingXingUp_FakeObject:RotateBegin(-0.3);
	--������ת����
	else
		PetLingXingUp_FakeObject:RotateEnd();
	end

end


function PetLingXingUp_Pet_Modle_TurnRight( start )
	--������ת��ʼ
	if(start == 1) then
		PetLingXingUp_FakeObject:RotateBegin(0.3);
	--������ת����
	else
		PetLingXingUp_FakeObject:RotateEnd();
	end
end


function PetLingXingUp_OnHidden()

	Pet:ShowPetList(0);
	PetLingXingUp_CleanUp()
end


function PetLingXingUp_OnSelectPet(petIndex)
	
	if( -1 == petIndex ) then
		return;
	end
	
	--�����ѱ���������ѡ��
	if (Pet:GetPetLocation(petIndex) ~= -1) then
		return;
	end

	--δ�û�
	local gen = Pet:GetType(petIndex)
	if gen ~= nil and gen < 100 then	--100����Ϊ�û�����
		PushDebugMessage("#{RXZS_090804_13}")    --��ѡ������޻�δ�û���ֻ�лû�������޲����������ԡ�
		return
	end
	--�ⶥ��
	if gen ~= nil and gen >= 110 then
		PushDebugMessage("#{RXZS_090804_14}")    --��ѡ����������Եȼ��Ѿ��ﵽ��ߣ������ٴ��������ԡ�
		return
	end

	PetLingXingUp_FakeObject:SetFakeObject("");
	Pet:SetSkillStudyModel(petIndex);

	PetLingXingUp_FakeObject:SetFakeObject( "My_PetStudySkill" );
	

	--�л����޵�ʱ���ͷ���һ������
	if(m_PetIndex ~= -1) then
		Pet:SetPetLocation(m_PetIndex,-1);
	end

	m_PetIndex = petIndex;	--�Ѿ�ѡ��������
	Pet:SetPetLocation(m_PetIndex,10);
--	Pet:ClosePetSkillStudyMsgBox()

	PetLingXingUp_UICheck()

end


function PetLingXingUp_CleanUp()
	PetLingXingUp_Money:SetProperty("MoneyNumber", 0 );
	PetLingXingUp_Pet_Text:SetText("")
	PetLingXingUp_OK:Disable()

	PetLingXingUp_FakeObject:SetFakeObject("");

	PetLingXingUp_Probability_Percent:SetText("")
	PetLingXingUp_Wuxing_Percent:SetText("")

	if(m_PetIndex ~= -1) then
		Pet:SetPetLocation(m_PetIndex,-1);
	end
	m_PetIndex = -1
end


function PetLingXingUp_UICheck()
	
	PetLingXingUp_Money:SetProperty("MoneyNumber", 0 );
	PetLingXingUp_Pet_Text:SetText("")
	PetLingXingUp_OK:Disable()
	if  m_PetIndex ~= -1 then
		local szPetName,szOn = Pet:GetPetList_Appoint(m_PetIndex);
		if  szOn ~= "on_packa"  then 
			Pet:SetPetLocation(m_PetIndex,-1);
			m_PetIndex = -1;
			PetLingXingUp_FakeObject:SetFakeObject("");
			PetLingXingUp_Probability_Percent:SetText("")
			PetLingXingUp_Wuxing_Percent:SetText("")
			return
		end
		
		local strName , strName2 = Pet:GetName(m_PetIndex)
		PetLingXingUp_Pet_Text:SetText(strName)	
		
		local gen = Pet:GetType(m_PetIndex)
		if gen >= 100 and gen < 110 then				 --100����Ϊ�û�����
			PetLingXingUp_Money:SetProperty("MoneyNumber", m_money[gen - 99] );	
			local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ") 

			if selfMoney >=  m_money[gen - 99]  then
				PetLingXingUp_OK:Enable()
			end
			local upRate = Pet:GetRate_LxUp(m_PetIndex)
			PetLingXingUp_Probability_Percent:SetText(upRate.."%")
			local upPercent = Pet:GetPercent_LxUp(m_PetIndex)
			local perStr = string.format("%0.1f" , upPercent / 10.0)
			PetLingXingUp_Wuxing_Percent:SetText(perStr.."%")
		else
			PetLingXingUp_Probability_Percent:SetText("")
			PetLingXingUp_Wuxing_Percent:SetText("")
		end
	end
end


--Care Obj
function PetLingXingUp_BeginCareObj(obj_id)
	
	m_ObjCared = DataPool : GetNPCIDByServerID(obj_id);
	this:CareObject(m_ObjCared, 1);
end