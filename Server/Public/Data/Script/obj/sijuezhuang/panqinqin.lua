-- �콱NPC

x893080_g_scriptId = 893080
x893080_g_FuBenScriptId = 893063

--**********************************
--�¼��������
--**********************************
function x893080_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"H� v� trong T� Tuy�t Trang phi th߶ng l�i h�i, nh�ng ta c� th� khi�n m�n ph�i c�n chi�n trong �i ng� c�a c�c ng߽i �n th�n, nh� v�y l� c� th� tho�i m�i l�n v�o T� Tuy�t �i�n ��nh chu�ng. Sau khi nghe ti�ng chu�ng, c�c h� v� c�ng gi�o �u s� r�i �i, l�c �� c� th� t� do x�ng v�o r�i.#r#G Ch� �: Tr�n th� s� kh�ng �nh h߷ng b�i hi�u qu� �n th�n, � ngh� �em thu h�i tr�n th� r�i h�y nh�n hi�u qu� n�y.")
		AddNumText( sceneId, x893080_g_scriptId, "#c00ff00Ta mu�n �n th�n", 6, 200)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x893080_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 200 then

		if GetMenPai(sceneId,selfId) ~= MP_SHAOLIN and GetMenPai(sceneId,selfId) ~= MP_MINGJIAO and GetMenPai(sceneId,selfId) ~= MP_GAIBANG and GetMenPai(sceneId,selfId) ~= MP_TIANSHAN then
			BeginEvent(sceneId)
	   			AddText( sceneId,"Hi�u qu� �n th�n ch� th�c s� c� t�c d�ng v�i m�n ph�i c�n chi�n, ng߽i kh�ng ph�i m�n ph�i c�n chi�n n�n kh� c� th� ��t ���c hi�u qu�.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 22211, 0 )
			BeginEvent(sceneId)
	   			AddText( sceneId, "Ng߽i �� nh�n ���c tr�ng th�i �n th�n. Ch� � thu h�i tr�n th� n�u kh�ng hi�u qu� s� m�t t�c d�ng ngay khi ng߽i ti�n v�o." )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end

	end
end
