--Th�p nh� S�t Tinh
--Kh� Vinh ��i S�, Monster talk
--Author: Ho�ng Steven

--************************--
x910114_g_ScriptId=910114												
x910114_g_Event_ScriptId=910112															--Script event
--************************--
x910114_g_Introduce="Kh�ng bi�t t� ��u ra c� #G12 t�n#W t� x�ng #GTh�p nh� S�t Tinh#W ho�nh h�nh ngang ng��c, uy hi�p b� t�nh. Thi�n h� anh h�ng, ph�m l� ng߶i h�nh hi�p tr��ng ngh�a, c�c h� kh�ng th� b� qua cho ch�ng!"
x910114_g_Monster_Talk="Thi�n �߶ng r�ng b߾c ng߽i kh�ng �i. иa ng�c v� m�n ng߽i l�i �n. Ng߽i mu�n khi�u chi�n ta nh�ng c�n b�n l� ta kh�ng c� h�ng. ��i m�t l�t n�a xem sao..."
--************************--
x910114_g_Monk_Name="Kh� Vinh ��i S�"													--T�n c�a Kh� Vinh ��i S�
--******************--
x910114_g_Back_Scene_Index=2															--ID c�nh quay tr� l�i
x910114_g_Back_Pos_X=129																--Pos X c�nh quay tr� l�i
x910114_g_Back_Pos_Y=76																--Pos Y c�nh quay tr� l�i
--************************--

--*****************************--
--*     On Default Event      *--
--*****************************--
function x910114_OnDefaultEvent(sceneId,selfId,targetId)

	--************************--
	BeginEvent(sceneId)
		if GetName(sceneId,targetId)==x910114_g_Monk_Name then
			AddText(sceneId,x910114_g_Introduce)
			AddNumText(sceneId,x910114_g_ScriptId,"R�i kh�i n�i n�y",9,0)			--R�i ph� b�n
			AddNumText(sceneId,x910114_g_ScriptId,"B� qua",-1,1)					--B� qua
		else
			AddText(sceneId,x910114_g_Monster_Talk)
		end
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	--************************--
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x910114_OnEventRequest(sceneId,selfId,targetId,eventId)
local key=GetNumText()

	--************************--
	if key==1 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,1000)
	end
	--************************--
	if key==0 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� s� kh�ng th� quay l�i n�i n�y n�a. H�y ch�c ch�n r�ng c�c h� �� ho�n th�nh nhi�m v� tr߾c ti�n. C�c h� x�c nh�n r�i b� n�i n�y?")
			AddNumText(sceneId,x910114_g_ScriptId,"X�c nh�n",-1,2)					--X�c nh�n
			AddNumText(sceneId,x910114_g_ScriptId,"H�y b�",-1,1)					--B� qua
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	--************************--
	if key==2 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,x910114_g_Back_Scene_Index,x910114_g_Back_Pos_X,x910114_g_Back_Pos_Y)
	end
	--************************--
	
end