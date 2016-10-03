-- 001090
-- ��̫�� ��կ������

--�ű���
x001090_g_scriptId = 001090

--��ӵ�е��¼�ID�б�
x001090_g_eventList={893063}

--**********************************
--�¼��б�
--**********************************
function x001090_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"Ngh�a ph� Phan X� c�a ta v�n l� k� ngh� th� gia � t�, trong nh� c�ng c� tuy�t th� k� ngh� b� b�o. Nh�ng l�y c�m k� th� h�a n�i ti�ng giang h�  t� tuy�t trang l�i d�ng c�c lo�i hi�m �c th� �o�n �em b� b�o c߾p �i, c�n ngh� phan gia di�t m�n. Ta ngh�a ph� nh�n r�i xu�ng v�ch n�i �en c� th� ��o tho�t, nh�ng r�i v�o hai ch�n t�n t�t. Nay, ta ngh�a ph� �em kh�ng l�u cho nh�n th�, ta v�n �nh �em b� b�o �o�t l�i  n�y t�m nguy�n, b�t �c d� l�c b�t t�ng t�m, l�c n�y kh�n c�u ch� v� ��i hi�p tr� ta �o�t l�i b� b�o, l�m cho ti�u n� t� c� th� t�n ph�n hi�u t�m.")
	AddText(sceneId,"#BЫ ngh� t� �i n�n c� Thi�n S�n. B�n trong gi�o �u c� s�c m�nh phi th߶ng l�i h�i, c�n s� d�ng k� n�ng Qu�n th� t�ng h�nh Th�p Di�n Mai Ph�c t�ng h�nh m�i c� th� qua.")

	AddNumText( sceneId, x001090_g_scriptId, "Ъn T� Tuy�t Trang",0 ,2  )
	
	for i, eventId in x001090_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001090_OnDefaultEvent( sceneId, selfId,targetId )
	x001090_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001090_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 2 then
	BeginEvent(sceneId)
	    AddText(sceneId,"T� Tuy�t Trang ph� b�n ch� y�u r�i xu�ng nguy�n li�u Th�ng C�p V� H�n. M�i ng�y 3 l��t, sau khi gi�t ch�t Boss � m�n cu�i s� th�y m�t c�i T� Tuy�t Trang B�o S߽ng.#r#YCh� �: K� n�ng c�a Boss c�c k� l�i h�i. C�n th�n nha. Ы ngh� �n c�p b�c th�ch h�p m�i tham gia ph� b�n.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
		return
	end

	for i, findId in x001090_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001090_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001090_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x001090_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001090_g_eventList do
		if missionScriptId == findId then
			x001090_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001090_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001090_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001090_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001090_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001090_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x001090_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
