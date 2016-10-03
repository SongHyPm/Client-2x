--L�u LanNPC....
--����....

--�ű���
x001133_g_scriptId = 001133

--��ӵ��to� � �¼�ID�б�
x001133_g_eventList = { 805029, 805030 }

--**********************************
--�¼��������
--**********************************
function x001133_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)

		AddText(sceneId,"#{loulan_zhengrong_20080329}")

		AddNumText( sceneId, x001133_g_scriptId, "Gi�i thi�u s�a dung m�o", 11, 1 )
		AddNumText(sceneId,x001133_g_scriptId,"S�a dung m�",6,2)

		AddNumText( sceneId, x001133_g_scriptId, "Gi�i thi�u thay �i h�nh bi�u t��ng nh�n v�t", 11, 3 )
		AddNumText(sceneId,x001133_g_scriptId,"Thay �i h�nh bi�u t��ng nh�n v�t",6,4)

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

function x001133_OnEventRequest( sceneId, selfId, targetId, eventId )

	local NumText = GetNumText()

	if NumText == 1 then

		BeginEvent(sceneId)	
			AddText( sceneId, "#{function_help_088}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 3 then

		BeginEvent(sceneId)	
			AddText( sceneId, "#{INTERHEAD_XML_008}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 2 then
		-- �޸�����
		CallScriptFunction( 805029, "OnEnumerate",sceneId, selfId, targetId )

	elseif NumText == 4 then
		-- Thay �i h�nh bi�u t��ng nh�n v�t
		CallScriptFunction( 805030, "OnEnumerate",sceneId, selfId, targetId )

	end

end
