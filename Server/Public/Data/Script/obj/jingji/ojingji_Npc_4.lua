-- 125014
-- ����װ��

--�ű���
x125014_g_scriptId = 125014

--��ӵ��to� � �¼�ID�б�
x125014_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x125014_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Ta c� th� s�a ch�a v�t ph�m c�p 40 tr� l�n m�c k� l� trang b�, v� kh�, ph�ng c�, trang s�c. B�t qu� c�ng �ang l� v� ta n�m �� h�c ngh� th�i �i�m �� c�i g� �u c�m th�y h�ng th�, cho n�n t�o th�nh ta �i th� n�o c�ng l�c c�ng kh�ng t�nh tinh th�ng. Cho n�n ta s�a ch�a th�i �i�m x�c xu�t th�nh c�ng kh�ng ph�i 100#. N�u ng߽i kh�ng c� g� th�c m�c, t�m ta gi�p ng߽i s�a ch�a �i.")
		AddNumText(sceneId,x125014_g_scriptId,"Ta mu�n s�a ch�a trang b�",6,1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x125014_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		UICommand_AddInt( sceneId, -1 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19810313 )	
	end
end

