--L�u LanNPC....
--Ⱦ��....

--�ű���
x001132_g_scriptId = 001132

--��ӵ��to� � �¼�ID�б�
x001132_g_eventList = { 801011 }

--**********************************
--�¼��������
--**********************************
function x001132_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"#{LLGC_20080324_14}")
		AddNumText( sceneId, x001132_g_scriptId, "Gi�i thi�u thay �i m�u t�c", 11, 1 )
		AddNumText(sceneId,x001132_g_scriptId,"Thay �i m�u t�c",6,2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

function x001132_OnEventRequest( sceneId, selfId, targetId, eventId )

	local NumText = GetNumText()

	if NumText == 1 then

		BeginEvent(sceneId)	
			AddText( sceneId, "#{function_help_060}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 2 then

		-- �޸ķ�ɫ
		CallScriptFunction( 801011, "OnEnumerate",sceneId, selfId, targetId )

	end

end
