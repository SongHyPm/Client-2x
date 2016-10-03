--ϴɱ��

--�ű���
x800111_g_scriptId = 800111

x800111_g_ModScript = 800112


function x800111_OnDefaultEvent( sceneId, selfId, targetId )

	--  �i�m����ǰɱ��ֵ
	pk_value = LuaFnGetHumanPKValue(sceneId, selfId);
	if pk_value then
	else
		return 0;
	end

	-- �ж���ng����10 �i�mɱ��
	if pk_value < 10 then
		x800111_NotifyFail(sceneId, selfId, "S�t kh� c�a c�c h� kh�ng �� 10 �i�m",targetId)
--		Msg2Player(sceneId, selfId, "S�t kh� c�a c�c h� kh�ng �� 10 �i�m", MSG2PLAYER_PARA);
		return 0;
	end

	-- �����ng�����㹻to� � �ƶ�ֵ�ͽ�Ǯ���۳�10 �i�mɱ��
	if CallScriptFunction( x800111_g_ModScript, "CheckCost", sceneId, selfId, targetId ,10 ) ~= 1 then
		return 0
	end

	-- ����10 �i�mɱ��ֵ���۳��ƶ�ֵ�ͽ��
	CallScriptFunction( x800111_g_ModScript, "PayForClean", sceneId, selfId, 10 )
	
	-- �۳�10 �i�mɱ��ֵ
	LuaFnSetHumanPKValue(sceneId, selfId, pk_value - 10)
	LuaFnAuditGoodbadDecPKValue( sceneId, selfId, 10 ); --��¼���ƶ�ֵ����ɱ��to� � ͳ����Ϣ....

	x800111_NotifyFail( sceneId, selfId,"C�c h� gi�i tr� th�nh c�ng 10 �i�m s�t kh�." ,targetId)
--	x800111_NotifyFailTips(sceneId, selfId, "C�c h� gi�i tr� th�nh c�ng 10 �i�m s�t kh�.");

	-- [ QUFEI 2007-11-09 15:36 UPDATE BugID 27611 ]		
	local LogInfo	= format( "[ChangePKValue]:ClearPKValue sceneId=%d, GUID=%0X, PKValueBgn=%d, PKValueEnd=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),			
			pk_value,
			LuaFnGetHumanPKValue(sceneId, selfId) )
	WriteCheckLog( sceneId, selfId, LogInfo )

	return 1;

end


-- ************************
-- NPC�Ի������е���to� � ����
-- ************************
function x800111_OnEnumerate( sceneId, selfId,targetId )

	AddNumText(sceneId, x800111_g_scriptId, "Tr� 10 �i�m s�t kh�", 6, x800111_g_scriptId)

end


--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x800111_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--�Ի�����ʾ
function x800111_NotifyFail( sceneId, selfId, Tip, targetId)
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchEventList(sceneId,selfId,targetId)
end
