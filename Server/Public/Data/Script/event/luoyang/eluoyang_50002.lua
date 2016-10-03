--׽��������
--׽����
--MisDescBegin
--�ű���
x250002_g_ScriptId = 250002

--�����
x250002_g_MissionId = 720

--M�c ti�u nhi�m v�npc
x250002_g_Name	="V�n H�m Nhi"

--�������
x250002_g_MissionKind = 11

--��ng c�p nhi�m v� 
x250002_g_MissionLevel = 10

--��ng����ngTinhӢ����
x250002_g_IfMissionElite = 0

--���漸����ng��̬��ʾto� � ����,����T�i �����б��ж�̬��ʾ�������**********************
--������ng���Ѿ����
x250002_g_IsMissionOkFail = 0		--����to� � ��0λ

x250002_g_PetDataID=3010	--��������to� � ���
--������ng��̬**************************************************************

--���������m�t λ�����洢��� �i�m��to� � �ű���

--�����ı�����
x250002_g_MissionName="B�t tr�n th�"
x250002_g_MissionInfo="Ti�u th� nh� t�i mu�n 1 con Th�. "  --��������
x250002_g_MissionTarget="Bang V�n H�n Nhi t�m ���c 1 con Th�. "		--M�c ti�u nhi�m v�
x250002_g_ContinueInfo="C�c h� b�t ���c Th� ch�a?"		--δHo�n t�t nhi�m v�to� � npc�Ի�
x250002_g_MissionComplete="L�m t�t l�m. "					--Ho�n t�t nhi�m v�npc˵��to� � ��

--������
x250002_g_MoneyBonus = 180

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x250002_OnDefaultEvent( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x250002_g_MissionId) > 0 then
		--������������to� � ��Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x250002_g_MissionName)
			AddText(sceneId,x250002_g_ContinueInfo)
		EndEvent( )
		bDone = x250002_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x250002_g_ScriptId,x250002_g_MissionId,bDone)
	--Th�a m�n�����������
	elseif x250002_CheckAccept(sceneId,selfId) > 0 then
		--��������Ti�p th�ʱ��ʾto� � ��Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x250002_g_MissionName)
			AddText(sceneId,x250002_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x250002_g_MissionTarget)
			--AddMoneyBonus( sceneId, x250002_g_MoneyBonus )
			--for i, item in g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x250002_g_ScriptId,x250002_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x250002_OnEnumerate( sceneId, selfId, targetId )
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x250002_g_MissionId) > 0 then
		AddNumText(sceneId,x250002_g_ScriptId,x250002_g_MissionName,3,-1);
    --Th�a m�n�����������
    elseif x250002_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x250002_g_ScriptId,x250002_g_MissionName,4,-1);
    end
end

--**********************************
--���Ti�p th�����
--**********************************
function x250002_CheckAccept( sceneId, selfId )
	--C�n 1c�p���ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--�����ng�����������15 ph�t,���δ����,�򲻿���Ti�p th�����.ԭ����ngΪ�˷�ֹ�������ˢ����,��ˢ���Լ���ץto� � ����.
--**********************************
function x250002_GetTimePass( sceneId, selfId )        --create by Steven.Han
   
  --���׽�����������ʱ����ng�񳬹�15 ph�t,�������,Tr� v�1,����,Tr� v�0

  local iDayCount=GetMissionData( sceneId, selfId, MD_CAPTUREPETABANDON_TIME )
  
  if( 0 == iDayCount ) then
      return 1                   --�����ng0,��ʾ��δ������������,��ng����Ti�p th�to� � .
  end
  
  local CurTime = GetHourTime()		--��ǰʱ��
	local CurDaytime = floor(CurTime/100)	--��ǰʱ��(��)
	local CurQuarterTime = mod(CurTime,100)	--��ǰʱ��(��)

	local OldDaytime = floor(iDayCount/100)	--�ϴη���to� � ʱ��(��)
	local OldQuarterTime = mod(iDayCount,100)	--�ϴη���to� � ʱ��(��)  	
  
  if( CurDaytime > OldDaytime ) then
      return 1               --����Ѿ�����m�t ����,����Ϊ������15 ph�t.
  end
  
  if( OldQuarterTime == CurQuarterTime ) then
      return 0
  end	
	
	return 1

end

--**********************************
--Ti�p th�
--**********************************
function x250002_OnAccept( sceneId, selfId )

  if( 0 == x250002_GetTimePass( sceneId, selfId ) ) then      
      --Msg2Player(  sceneId, selfId,"#Y�������������15 ph�t,�޷��ٴ�Ti�p th�",MSG2PLAYER_PARA )	--���촰����ʾ
      
		  BeginEvent(sceneId)
			  strText = format("Th�i gian b� nhi�m v� kh�ng �� 15 ph�t, kh�ng th� ti�p nh�n ti�p")
			  AddText(sceneId,strText)
 		  EndEvent(sceneId)

 		  DispatchMissionTips(sceneId,selfId)
 		      
      return
  end	
  
	--������������б�
	AddMission( sceneId,selfId, x250002_g_MissionId, x250002_g_ScriptId,0,0,0 )	SetMissionEvent(sceneId, selfId, x250002_g_MissionId, 3)
	misIndex = GetMissionIndexByID(sceneId,selfId,x250002_g_MissionId)			-- �i�m������to� � ���к�
	SetMissionEvent(sceneId, selfId, x250002_g_MissionId, 3)
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ��������to� � ��0λ��0 (����������)
	SetMissionByIndex(sceneId,selfId,misIndex,1,x250002_g_ScriptId)						--�������кŰ��������to� � ��1λ��Ϊ����ű���
	--����������to� � ������ng���Ѿ�Th�a m�n�������,����Ѿ�Th�a m�n,���Ho�n t�t nhi�m v�to� � ������Ϊ1
	if x250002_CheckSubmit( sceneId, selfId ) == 2 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--��������ɱ�־��Ϊ1
	end
	--��ʾ���ݸ�������Ѿ�Ti�p th�������
--	BeginEvent(sceneId)
--		AddText(sceneId,x250002_g_MissionInfo)
--	EndEvent(sceneId)
--	DispatchEventList(sceneId,selfId,targetId)	--�Ի�����ʾMissionInfo
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�: b�t Tr�n th�",MSG2PLAYER_PARA )	--���촰����ʾ
end

--**********************************
--����
--**********************************
function x250002_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧto� � ����
    DelMission( sceneId, selfId, x250002_g_MissionId )
    
    local CurTime = GetHourTime()		--��ǰʱ��	
	  SetMissionData(sceneId,selfId,MD_CAPTUREPETABANDON_TIME,CurTime )     --�ѵ�ǰʱ������Ϊ����ʱ��  Steven.Han
    --Msg2Player(  sceneId, selfId,"#Y������˲�׽��������,15 ph�t֮���㽫�޷��ٴ�Ti�p th�������",MSG2PLAYER_PARA )	--���촰����ʾ
    
end

--**********************************
--����
--**********************************
function x250002_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱto� � � �i�m���Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x250002_g_MissionName)
    AddText(sceneId,x250002_g_MissionComplete)
    --AddMoneyBonus( sceneId, x250002_g_MoneyBonus )
    --for i, item in g_ItemBonus do
	--	AddItemBonus( sceneId, item.id, item.num )
	--end
    --for i, item in g_RadioItemBonus do
	--	AddRadioItemBonus( sceneId, item.id, item.num )
	--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x250002_g_ScriptId,x250002_g_MissionId)
end

--**********************************
--�����ng������ύ
--**********************************
function x250002_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x250002_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	-- �i�m��Я����������
	PetNum = LuaFnGetPetCount(sceneId,selfId)
	if PetNum ~= 0 then
		for i = 1,PetNum,1 do
			PetIndex = i - 1		--����index��0��ʼ
			if LuaFnGetPet_DataID(sceneId, selfId, PetIndex) == x250002_g_PetDataID then
				return 2
			end
		end
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x250002_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x250002_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼: �����š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x250002_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x250002_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--����ύto� � ��Ʒ������
--**********************************
function x250002_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	if indexpet == 255 then --����ֵTr� v�255��ʾ��,û�ύ����
		BeginEvent(sceneId)
			strText = "H�y �em tr�n th� v�o trong c�a s�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		-- �i�m�����봰����to� � ���ޱ��
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, indexpet )
		if petdataid == x250002_g_PetDataID then
			--������Ǯ����ʾ
			
				BeginEvent(sceneId)
					AddText(sceneId,"Ch�c m�ng �� Ho�n t�t nhi�m v�, t�ng cho c�c h� #{_MONEY"..x250002_g_MoneyBonus.."}")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,npcid)
			ret0 = DelMission( sceneId, selfId, x250002_g_MissionId ) --ɾ������
			ret1 = LuaFnDeletePet(sceneId, selfId, indexpet ) --ɾ������
			if ret0>0 and ret1>0 then
				Msg2Player(  sceneId, selfId,"Ho�n t�t nhi�m v�: b�t tr�n th�",MSG2PLAYER_PARA )
				AddMoney(sceneId, selfId, x250002_g_MoneyBonus )
			end
			
			BeginEvent(sceneId)
				strText = "Ho�n t�t nhi�m v�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		else
			BeginEvent(sceneId)
				strText = "�i�u ki�n tr�n th� kh�ng ph� h�p"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--���޸ı�
--**********************************
function x250002_OnPetChanged( sceneId, selfId, petDataId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x250002_g_MissionId)			-- �i�m������to� � ���к�
	--����������to� � ������ng���Ѿ�Th�a m�n�������,����Ѿ�Th�a m�n,���Ho�n t�t nhi�m v�to� � ������Ϊ1
	if x250002_CheckSubmit( sceneId, selfId )  == 2 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--��������ɱ�־��Ϊ1
	else
		SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--��������ɱ�־��Ϊ0
	end
end
