
--ÿ�δ򿪱ض� ��t ���cto� � ��Ʒ
x715031_g_MainItemId = 20103008
--���� �i�m��to� � ��Ʒ
x715031_g_SubItemId = 50112003
--��ɫ���ϱ�����to� � ��Ʒ
x715031_g_MustHaveItemId = 20309009

function 	x715031_OnCreate(sceneId,growPointType,x,y)
	local targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x715031_g_MainItemId)
	
	--80%����,���������1c�i��Ʒ,����to� � ��Ʒto� � �ж����� ��o b�u v�t to� � ʱ�������Ʒto� � �ж�.
	if random(100) <= 80 then
		local ItemSn, ItemName, bBroadCast = GetItemSnByDropRateOfItemTable()
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,ItemSn)
	end	
	
end


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x715031_OnOpen(sceneId,selfId,targetId)
--Tr� v�����
-- 0 ��ʾ�򿪳ɹ�
	--PrintStr("OnOpen...")
	if HaveItem(sceneId,selfId, x715031_g_MustHaveItemId) > 0 then
		local Bagpos = GetBagPosByItemSn(sceneId,selfId,x715031_g_MustHaveItemId)
		if LuaFnIsItemAvailable(sceneId,selfId,Bagpos) == 1 then
			return OR_OK
		else
			Msg2Player(  sceneId, selfId,"��������to� � Կ����T�i �ƺ�������." ,MSG2PLAYER_PARA )	
			BeginEvent(sceneId)
				AddText(sceneId, "��������to� � Կ����T�i �ƺ�������.")
			EndEvent()
			DispatchMissionTips(sceneId,selfId)
			return OR_ERROR	
		end
	else
		BeginEvent(sceneId)
			AddText(sceneId, "C�n ��������to� � Կ�ײ��ܴ�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return OR_STUFF_LACK	
	end
end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


function	x715031_OnProcOver(sceneId,selfId,targetId)
	--PrintStr("OnProcOver...")
	--�򿪱����100% ��t ���cǮ,ֱ�Ӽ�T�i ������ϼ���.
	--Ǯ��=114��(boss��c�p��30)��16 -->bosslevel == playerlevel
	if 1 == LuaFnDelAvailableItem(sceneId,selfId, x715031_g_MustHaveItemId, 1) then
		local BonusMoney = 114 + (GetLevel(sceneId, selfId)-20) * 16
		AddMoney(sceneId, selfId, BonusMoney)
		Msg2Player(  sceneId, selfId,"�� �i�m����#{_MONEY" .. tostring(BonusMoney) .. "}" ,MSG2PLAYER_PARA )	
	else
		Msg2Player(  sceneId, selfId,"��������to� � Կ����T�i �ƺ�������." ,MSG2PLAYER_PARA )	
		return OR_ERROR
	end
	return OR_OK
end

--���պ�����ʼ########################################################################
function	 x715031_OnRecycle(sceneId,selfId,targetId)
		return OR_OK
end
--���պ�������########################################################################

function x715031_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
