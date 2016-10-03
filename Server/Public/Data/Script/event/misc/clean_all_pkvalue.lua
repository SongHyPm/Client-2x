--ϴɱ��

--�ű��� 
x800112_g_scriptId = 800112

-- *****************************
-- �����ng�����㹻to� � �ƶ�ֵ�ͽ�Ǯ
-- ******************************
-- nValue : ��ǰɱ��ֵ
function x800112_CheckCost( sceneId, selfId, targetId ,nValue )

	-- �ƶ�ֵ�۳�ǰto� � �ж�
	local gb_value = LuaFnGetHumanGoodBadValue( sceneId, selfId )
	if not gb_value or gb_value < nValue * 2000 then
		x800112_NotifyFail( sceneId, selfId, "C�c h� kh�ng c� s�t kh� " .. nValue * 2000 .. "" ,targetId)
--		Msg2Player( sceneId, selfId, "C�a ng߽i �ƶ�ֵ����" .. nValue * 1000 .. ".", MSG2PLAYER_PARA )
--		x800112_NotifyFailTips(sceneId, selfId, "C�c h� kh�ng c� s�t kh� " .. nValue * 2000 .. " �i�m�ƶ�ֵ,Ŀǰ������to� � �ƶ� �i�m������.");
		return 0
	end

	-- ��Ǯ�۳�ǰto� � �ж�
	local money = GetMoney( sceneId, selfId )
	if not money or money < nValue * 50000 then
		x800112_NotifyFail( sceneId, selfId, "Ti�n c�a c�c h� kh�ng �� #{_MONEY" .. nValue * 50000 .. "}", targetId )
--		Msg2Player( sceneId, selfId, "C�a ng߽i Kh�ng �� ng�n l��ng.#{_MONEY" .. nValue * 50000 .. "}.", MSG2PLAYER_PARA )
--		x800112_NotifyFailTips(sceneId, selfId, "Ti�n c�a c�c h� kh�ng �� #{_MONEY" .. nValue * 20000 .. "},��to� � Kh�ng �� ng�n l��ng..");
		return 0
	end

	return 1

end

-- *****************
-- �۳��ƶ�ֵ�ͽ��
-- *****************
-- nValue : ��ǰɱ��ֵ
function x800112_PayForClean( sceneId, selfId, nValue )
	local gb_value = LuaFnGetHumanGoodBadValue( sceneId, selfId )

	-- ÿm�t  �i�mɱ���۳�2000 �i�m�ƶ�ֵ
	LuaFnSetHumanGoodBadValue( sceneId, selfId, gb_value - ( nValue * 2000 ) )
	
	-- ÿm�t  �i�mɱ���۳�5c�i���
	CostMoney( sceneId, selfId, nValue * 50000 )
end

-- *************
-- �¼�������
-- *************
function x800112_OnDefaultEvent( sceneId, selfId, targetId )

	--  �i�m����ǰɱ��ֵ
	local pk_value = LuaFnGetHumanPKValue(sceneId, selfId);
	if pk_value then
	else
		return 0;
	end

	-- �ж���ng����ɱ��
	if pk_value < 1 then
		x800112_NotifyFail( sceneId, selfId,"C�c h� kh�ng c� s�t kh�",targetId)
--		Msg2Player(sceneId, selfId, "C�c h� kh�ng c� s�t kh�", MSG2PLAYER_PARA);
		return 0;
	end

	-- �����ng�����㹻to� � �ƶ�ֵ�ͽ�Ǯ���۳�����ɱ��
	if x800112_CheckCost( sceneId, selfId, targetId, pk_value ) ~= 1 then
		return 0
	end

	-- ���ݵ�ǰɱ��ֵ���۳��ƶ�ֵ�ͽ��
	x800112_PayForClean( sceneId, selfId, pk_value )

	-- ����������ҵ�ǰto� � ɱ��ֵΪ0
	LuaFnSetHumanPKValue(sceneId, selfId, 0)
	LuaFnAuditGoodbadDecPKValue( sceneId, selfId, 0 ); --��¼���ƶ�ֵ����ɱ��to� � ͳ����Ϣ....(0�����������ɱ��)
	
	x800112_NotifyFail( sceneId, selfId,"C�c h� gi�i tr� th�nh c�ng t�t c� s�t kh�.",targetId)
--	x800112_NotifyFailTips(sceneId, selfId, "C�c h� gi�i tr� th�nh c�ng t�t c� s�t kh�.");
	
	-- [ QUFEI 2007-11-09 15:36 UPDATE BugID 27611 ]		
	local LogInfo	= format( "[ChangePKValue]:ClearPKValue sceneId=%d, GUID=%0X, PKValueBgn=%d, PKValueEnd=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),			
			pk_value,
			LuaFnGetHumanPKValue(sceneId, selfId) )
	WriteCheckLog( sceneId, selfId, LogInfo )

end

-- ************************
-- NPC�Ի������е���to� � ����
-- ************************
function x800112_OnEnumerate( sceneId, selfId,targetId )

	AddNumText(sceneId, x800112_g_scriptId, "Tr� t�t c� s�t kh�", 6, x800112_g_scriptId)

end


--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x800112_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--�Ի�����ʾ
function x800112_NotifyFail( sceneId, selfId, Tip ,targetId)
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchEventList(sceneId,selfId,targetId)
end
