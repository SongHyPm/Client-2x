--ע��: 

--��Ʒ����to� � �߼�ֻ��ʹ�û������ܺͽű���ʵ��


--�ű�:

--������ng�ű�����:


--4918.lua
------------------------------------------------------------------------------------------
--m�t ����Ʒto� � Ĭ�Ͻű�

--�ű���
x334918_g_scriptId = 334918 --��ʱдC�i n�y ,������to� � ʱ��m�t ��Ҫ��.

--C�n to� � ��c�p
x334918_g_levelRequire = 1
--AE��Χ�뾶
x334918_g_radiusAE = 3.0
--AEto� � Ŀ���ϵ���
x334918_g_standFlag = 1 -- 2:����, 1: �Ѿ�, -1: �о�
--AEӰ����Ŀ����
x334918_g_effectCount = 4 -- -1:������
--Ч��to� � ID
x334918_g_Impact1 = 4918 --��ʱдC�i n�y 
x334918_g_Impact2 = -1 --����

--**********************************
--�¼��������
--**********************************
function x334918_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ��C�n C�i n�y �ӿ�,��Ҫ�����պ���
end

--**********************************
--C�i n�y ��Ʒto� � ʹ�ù�����ng�������ڼ���: 
--H� th�ng��T�i ִ�п�ʼʱ���C�i n�y ����to� � Tr� v�ֵ,���Tr� v�th�t b�i����Ժ���to� � ���Ƽ���to� � ִ��.
--Tr� v�1: ��������to� � ��Ʒ,���Լ������Ƽ���to� � ִ�У�Tr� v�0: ���Ժ���to� � ����.
--**********************************
function x334918_IsSkillLikeScript( sceneId, selfId)
	return 1; --C�i n�y �ű�C�n ����֧��
end

--**********************************
--ֱ��Hu� b�Ч��: 
--H� th�ng��ֱ�ӵ���C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: �Ѿ�Hu� b���ӦЧ��,����ִ�к���������Tr� v�0: û�м�⵽���Ч��,����ִ��.
--**********************************
function x334918_CancelImpacts( sceneId, selfId )
	return 0; --��C�n C�i n�y �ӿ�,��Ҫ�����պ���,����ʼ��Tr� v�0.
end

--**********************************
--����������: 
--H� th�ng��T�i ���ܼ��to� � ʱ�� �i�m����C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: �������ͨ��,���Լ���ִ�У�Tr� v�0: �������th�t b�i,�жϺ���ִ��.
--**********************************
function x334918_OnConditionCheck( sceneId, selfId )
	--У��ʹ��to� � ��Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if(0<=targetId) then
		-- Ŀ�������ng�Ѿ�to� � ���
		if LuaFnIsFriend(sceneId, targetId, selfId) ~= 1 then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0;
		end
		
		if LuaFnIsFriend(sceneId, selfId, targetId ) ~= 1 then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0;
		end
		
    local SelfSex = LuaFnGetSex(sceneId, selfId)
    local TargetSex = LuaFnGetSex(sceneId, targetId)                
    if( SelfSex == TargetSex ) then
      LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
      
      return 0;                                            
    end 
       
		-- Ŀ�������ng�о�to� � ���
--		if(1~=LuaFnUnitIsEnemy(sceneId, selfId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end
		-- Ŀ�������ng����to� � ���
--		if(1~=LuaFnUnitIsPartner(sceneId, selfId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end
		-- Ŀ��c�p��to� � ���
--		if(g_LevelRequire<=LuaFnGetLevel(sceneId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end
--		if(g_LevelRequire>=LuaFnGetLevel(sceneId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end

	end
	
	return 1; --��C�n �κ�����,����ʼ��Tr� v�1.
end

--**********************************
--���ļ�⼰�������: 
--H� th�ng��T�i ��������to� � ʱ�� �i�m����C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: ���Ĵ���ͨ��,���Լ���ִ�У�Tr� v�0: ���ļ��th�t b�i,�жϺ���ִ��.
--ע��: �ⲻ�⸺������to� � ���Ҳ��������to� � ִ��.
--**********************************
function x334918_OnDeplete( sceneId, selfId )
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
--		x334918_MsgBox( sceneId, selfId, "��û���㹻to� � �����ռ�" )
--		return 0
	end

	if LuaFnGetPropertyBagSpace( sceneId, targetId ) < 1 then
		x334918_MsgBox( sceneId, selfId, "�Է�û���㹻to� � �����ռ�" )
		return 0
	end
	
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 30509011);
	local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex);

	
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	local szNameSelf = GetName( sceneId, selfId );
	local szNameTarget = GetName( sceneId, targetId );
	
	local randMessage = random(3);
	local message;

	if randMessage == 1 then
		message = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_00}#{_INFOMSG%s}#{GiveRose_01}#{_INFOUSR%s}#{GiveRose_02}", szNameSelf, szTransfer, szNameTarget );
	elseif randMessage == 2 then		
		message = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_03}#{_INFOMSG%s}#{GiveRose_04}#{_INFOUSR%s}#{GiveRose_05}", szNameSelf, szTransfer, szNameTarget );
	else		
		message = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_03}#{_INFOMSG%s}#{GiveRose_06}#{_INFOUSR%s}#{GiveRose_07}", szNameSelf, szTransfer, szNameTarget );
	end
	
	AddGlobalCountNews( sceneId, message )
			
	if(LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end

--**********************************
--ֻ��ִ��m�t �����: 
--������˲�����ܻ�T�i ������ɺ����C�i n�y �ӿ�(�����������Ҹ���������Th�a m�nto� � ʱ��),������
--����Ҳ��T�i ������ɺ����C�i n�y �ӿ�(����to� � m�t ��ʼ,���ĳɹ�ִ��֮��).
--Tr� v�1: ����ɹ���Tr� v�0: ����th�t b�i.
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x334918_OnActivateOnce( sceneId, selfId )
	if(-1~=x334918_g_Impact1) then
		--���Լ���Ч��
--		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x334918_g_Impact1, 0);
		--��Ŀ���Ч��
		local targetId = LuaFnGetTargetObjID(sceneId, selfId)
		if(0<=targetId) then
			if LuaFnIsFriend(sceneId, targetId, selfId) > 0 then
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, x334918_g_Impact1, 0);
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, 66, 0);
				
				local nFriendPoint = LuaFnGetFriendPoint( sceneId, selfId, targetId );
				if nFriendPoint >= 9999 then
			
					BeginEvent(sceneId)
						AddText(sceneId, "����Է�to� � ���Ѷ��Ѿ���������.");
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)	
				
				else
				
					BeginEvent(sceneId)
					AddText(sceneId, "����Է�to� � �Ѻö�������5000");
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					
				end
			  
			  local	namSelf		= GetName( sceneId, selfId )
			  local	namTarget	= GetName( sceneId, targetId )
			

			--���Է��ù�Ч
			LuaFnSendSpecificImpactToUnit(sceneId, targetId, targetId, targetId, 18, 0);			

					  
			  --����
				local	lstBounty	=
				{
					[0]	= { 10124021,	228, "õ������" },		--Ůװ
					[1]	= { 10124020,	227, "��ʥ" },				--��װ
				}
			  local	untBounty
			  if GetSex( sceneId, selfId ) == 0 then
			  	untBounty	= lstBounty[0]
			  else
			  	untBounty	= lstBounty[1]
			  end
			  if TryRecieveItem( sceneId, selfId, untBounty[1], 1 ) >= 0 then
			  	x334918_MsgBox( sceneId, selfId, "�� �i�m����m�t ��"..GetItemName( sceneId, untBounty[1] ) )
			  end
				AwardTitle( sceneId, selfId, 8, untBounty[2] )
				LuaFnDispatchAllTitle( sceneId, selfId )		--�������гƺŵ�CLIENT
			  x334918_MsgBox( sceneId, selfId, "�� �i�m����["..untBounty[3].."]�ƺ�." )

			  if GetSex( sceneId, targetId ) == 0 then
			  	untBounty	= lstBounty[0]
			  else
			  	untBounty	= lstBounty[1]
			  end
			  if TryRecieveItem( sceneId, targetId, untBounty[1], 1 ) >= 0 then
			  	x334918_MsgBox( sceneId, targetId, "�� �i�m����m�t ��"..GetItemName( sceneId, untBounty[1] ) )
			  end
			  AwardTitle( sceneId, targetId, 8, untBounty[2] )
			  LuaFnDispatchAllTitle( sceneId, targetId )	--�������гƺŵ�CLIENT
			  x334918_MsgBox( sceneId, targetId, "�� �i�m����["..untBounty[3].."]�ƺ�." )

			end
		end
		--�Լ���ΧAE
--		local posX,posZ = LuaFnGetUnitPosition(sceneId, selfId)
--		LuaFnSendImpactAroundPosition(sceneId, selfID, posX, posZ, x334918_g_radiusAE, x334918_g_standFlag, x334918_g_levelRequire, x334918_g_effectCount, x334918_g_Impact1, 0)
		--ָ���� �i�m��ΧAE
--		local posX,posZ = LuaFnGetTargetPosition(sceneId, selfId)
--		LuaFnSendImpactAroundPosition(sceneId, selfID, posX, posZ, x334918_g_radiusAE, x334918_g_standFlag, x334918_g_levelRequire, x334918_g_effectCount, x334918_g_Impact1, 0)
		--Ŀ��c�i����ΧAE
--		local targetId = LuaFnGetTargetObjID(sceneId, selfId)
--		if(0<=targetId) then
--			local posX,posZ = LuaFnGetUnitPosition(sceneId, targetId)
--			LuaFnSendImpactAroundPosition(sceneId, selfID, posX, posZ, x334918_g_radiusAE, x334918_g_standFlag, x334918_g_levelRequire, x334918_g_effectCount, x334918_g_Impact1, 0)
--		end

	end
	return 1;
end

--**********************************
--���������������: 
--�������ܻ�T�i ÿ����������ʱ����C�i n�y �ӿ�.
--Tr� v�: 1�����´�������0: �ж�����.
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x334918_OnActivateEachTick( sceneId, selfId)
	return 1; --����ng�����Խű�, ֻ�����պ���.
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x334918_MsgBox( sceneId, selfId, Msg )
	if Msg == nil then
		return
	end
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
