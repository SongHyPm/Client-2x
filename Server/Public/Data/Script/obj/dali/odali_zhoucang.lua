--��i L�NPC
--�ܲ�
--��ͨ

x002091_g_ScriptId	= 2091

--������
x002091_g_Key				=
{
		["do"]					= 100,	--X�c nh�n
		["undo"]				= 101,	--Hu� b�
		["del"]					= 103,	--�Ҿ����˳�����
}

--**********************************
--�¼��������
--**********************************
function x002091_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  Ta ��i T�ng H�n Th� ��nh H�u v� th�nh nh�n Quan H�n Th� d߾i t߾ng qu�n Ch�u X߽ng. Thay m�t anh h�ng trong giang h� ch� tr� nghi th�c r�a tay g�c ki�m. N�u nh� mu�n x�a nh�n v�t, r�t lui kh�i giang h� th� c� th� �n t�m ta" )
		AddNumText( sceneId, x002091_g_ScriptId, "Ta mu�n x�a nh�n v�t", -1, x002091_g_Key["do"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x002091_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()

	if key == x002091_g_Key["do"] then
		--1,		//����ɹ�,����ɾ��
		--2,		//T�i �����в�������ɱ
		--3,		//���״̬
		--4,		//��Ʒ��������ɾ��
		--5,		//ӵ������̵�
		--6,		//ӵ�н�� huynh �
		--7,		//ӵ��ʦͽ��ϵ
		BeginEvent(sceneId)
			local result = QueryDeleteCharState(sceneId,selfId)
			if result == 1 then
				AddText(sceneId,"  R�a tay g�c ki�m, r�i b� giang h�")
				AddNumText(sceneId,x002091_g_ScriptId,"Ta quy�t �nh r�i b� giang h�",6,x002091_g_Key["del"])
			end
			if result == 2 then
				AddText(sceneId,"  Kh�ng th� t� s�t trong bang ph�i")
			end
			if result == 3 then
				AddText(sceneId,"  Ng߽i v�n trong tr�ng th�i k�t h�n, kh�ng th� t� s�t")
			end
			if result == 4 then
				AddText(sceneId,"  Ng߽i c� v�t ph�m b� kh�a, kh�ng th� t� s�t")
			end
			if result == 5 then
				AddText(sceneId,"  Ng߽i �ang s� h�u th߽ng ti�m, kh�ng th� t� s�t")
			end
			if result == 6 then
				AddText(sceneId,"  Ng߽i c� huynh � k�t b�i, kh�ng th� t� s�t")
			end
			if result == 7 then
				AddText(sceneId,"  Ng߽i c� quan h� s� �, kh�ng th� t� s�t")
			end
			if result == 8 then
					local lefttime = GetLeftDeleteTime(sceneId,selfId)-7
					if lefttime > 0 then
						AddText(sceneId,"  Th�i gian t� s�t c�a ng߽i ch�a t�i, v�n c�n thi�u" ..lefttime.."Ng�y")
					else
						AddText(sceneId,"  Ng߽i kh�ng ��ng k� xin t� s�t!");
					end
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif key == x002091_g_Key["del"] then
		--ExecuteDeleteChar(sceneId, selfId)
		x002091_OpenClientAcceptUI( sceneId, selfId, targetId, eventId )
	end
end

function x002091_OpenClientAcceptUI( sceneId, selfId, targetId, eventId )    
    BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x002091_g_ScriptId);
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddInt(sceneId,eventId)
		UICommand_AddString(sceneId,"OnMsgAccept");
		local str = format("Ng߽i x�c �nh mu�n x�a nh�n v�t n�y kh�ng?")
		UICommand_AddString(sceneId,str);
	EndUICommand(sceneId)
	
	DispatchUICommand(sceneId,selfId, 24)
end

function x002091_OnMsgAccept( sceneId, selfId, targetId, eventId )
    local result = QueryDeleteCharState(sceneId,selfId)
    
    if( 1 == result ) then        
        ExecuteDeleteChar(sceneId, selfId)
    end
    
end
