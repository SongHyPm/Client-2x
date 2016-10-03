--����NPC
--����
--��ͨ

--�ű���
x892002_g_ScriptId = 892002

--��ӵ�е��¼�ID�б�
x892002_g_eventList={}


x892002_g_DarkSkillName = { [40] = {name = "N�m �m kh�", id = 274, needmoney = 20000},
                            [70] = {name = "�m kh� �� huy�t", id = 275, needmoney = 100000},
                            [90] = {name = "�m kh� h� th�", id = 276, needmoney = 500000},
                          }                
x892002_g_DarkSkillTips = { [40] = "#{FBSJ_090106_89}",
                            [70] = "#{FBSJ_090106_90}",
                            [90] = "#{FBSJ_090106_91}",
                          }  
x892002_g_DarkBreachPointNeedMoney = 
{
	[39] = 40000,
	[49] = 50000,
	[59] = 60000,
	[69] = 70000,
	[79] = 80000,
	[89] = 90000,
	[99] = 100000,
	[109] = 110000,
	[119] = 120000,
	[129] = 130000,
}  --ͻ��ƿ����Ҫ��Ǯ


--**********************************
--�¼��б�
--**********************************
function x892002_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " C� n߽ng"
	else
		PlayerSex = " Thi�u hi�p"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"S� huynh t�ng c�ng ta ߾c h�n tho�i �n giang h�, �n c� trong n�i v� l��ng. �inh Xu�n Thu �c h�i s� huynh ��a h�n t�i v�ch n�i �en, nay kh�ng bi�t sinh t�...")
		AddText(sceneId,"Xin ch�o"..PlayerSex..", ng߽i nh� th� n�o ki�m gi� Ng� Dao B�n? C� ph�i hay kh�ng s� huynh c�n s�ng? Th�nh b�o cho bi�t, ta s� hi�p tr� ng߽i ph߽ng ph�p c� ���c Ng� Dao B�n.")
		for i, eventId in x892002_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p ��ng c�p V� H�n",6,7)
		AddNumText(sceneId,x892002_g_ScriptId,"M� r�ng k� n�ng V� H�n",6,8)
		AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p V� H�n m� r�ng k� n�ng",6,9)
		AddNumText(sceneId,x892002_g_ScriptId,"M� r�ng thu�c t�nh V� H�n",6,10)
		--AddNumText(sceneId,x892002_g_ScriptId,"Thuy�t minh V� H�n",8,888)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x892002_OnDefaultEvent( sceneId, selfId,targetId )
	x892002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x892002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x892002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
	local NumText = GetNumText();
	if NumText == 6 then  --ȡ����
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

	elseif NumText == 888 then  --˵��
		BeginEvent(sceneId)
			AddNumText(sceneId,x892002_g_ScriptId,"�������",6,666)
			AddNumText(sceneId,x892002_g_ScriptId,"����������",6,667)
			AddNumText(sceneId,x892002_g_ScriptId,"�����������",6,668)
			AddNumText(sceneId,x892002_g_ScriptId,"������������ص���",6,669)
			AddNumText(sceneId,x892002_g_ScriptId,"�����չ���Խ���",6,670)
			AddNumText(sceneId,x892002_g_ScriptId,"����������",6,671)
			AddNumText(sceneId,x892002_g_ScriptId,"�������Ч��",6,672)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 666 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"��֪���˶����꣬��ԭ��������һ���ƽ٣���ǿ������ǰ�棬����������ھ��ѣ��û������Ϊǧǧ���������ػ����������ʿ�ǣ���Ϊ����ͬ�������Ļ�顣��������ҵõ������������ϵı���㽫����������ȫ����չ������������ﵽǰ��δ�е��¾��磡")
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 667 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f����������:#r����#W��#G�ľ�ׯ#W�����д��BOSS����һ�����ʻ��#R��꣺������#W��")
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 668 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f�����������:#r����#Wʹ��#G3#W����Ӧ�ȼ���#G�����#W�ɶ�����������������������#R��������#W��#RЯ���ȼ�#W��#R�����չ����ֵ#W����õ���ߡ�#r#P(ֻ��ע��������������ܽ�������)")
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 669 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f#r������������ص���:#r#Y��������������߾������ľ�ׯ��á�")
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 670 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f�����չ���Խ���:#r����#Wʹ��������൤�����ע���������꽫�Զ����һ����Ӧ�����#G����������#W��չ���ԡ����ȼ�Խ�ߣ�����չ����ֵ��Խ�󡣸������չ���Խ��𲽸��¿��š�")
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 671 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f����������:#r#Y�����������:����#r#Wʹ��#G������൤#W�ɶ�������������̽���ע�����ࡣ���������б��������������֡���ҿ�����ѡ��ע��һ�֣������ע������󣬽����ܸ������ࡣ")
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 672 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#Y�������Ч��:����#r#W������˵�����Ч������һ���̶����ܵ����ȼ���Ӱ�졣#r������ʹA��B������ҷֱ�װ����������꣬A��ҵ�������B��ҵ���ꡣ���A��ҵ����ϳɵȼ�����B��ҵ����ȼ����˺��Ŵ�Ч���������ԣ����A��ҵ����ȼ�����B��ҵ����ȼ����˺��Ŵ�Ч��������������")
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 7 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"C�p b�c V� H�n ��t t�i 3 c�p, m�i c� th� ti�n giai v� h�n c�p b�c. Ph�i h�p s� d�ng H�n B�ng Ch�u c�ng Nhu�n H�n Th�ch �em ng� dao b�n �t ph� t�i c�p 4, V� H�n sau khi �t ph� th�nh c�ng m� ra thu�c t�nh #GTh� hai, th� 3 #Wc�ng #Gm� r�ng k� n�ng#W, h�n n�a m� r�ng thu�c t�nh c�ng m� r�ng k� n�ng hi�u qu� t�y v� h�n c�p b�c m� n�ng cao.")
			AddText(sceneId,"#{WH_NPC_4}")

			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Ng� Dao B�n - B�ng",6,12)
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Ng� Dao B�n - H�a",6,13)
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Ng� Dao B�n - Huy�n",6,14)
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Ng� Dao B�n - еc",6,15)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 8 then  --L�nh ng�����
		BeginEvent(sceneId)
			AddText(sceneId,"V� h�n c�p b�c 4, c� th� th�ng qua t߽ng �ng V� H�n m� r�ng k� n�ng th� h�c t�p k� n�ng m� r�ng th� hai.")
			AddText(sceneId,"V� h�n c�p b�c 5, c� th� th�ng qua t߽ng �ng V� H�n m� r�ng k� n�ng th� h�c t�p k� n�ng m� r�ng th� ba, s� d�ng t߽ng �ng k� n�ng th� th�ng c�p th� hai m� r�ng k� n�ng.")
			AddText(sceneId,"V� h�n th�ng c�p m� r�ng k� n�ng t�y v� h�n c�p b�c m� n�ng cao.")

			AddNumText(sceneId,x892002_g_ScriptId,"H�c t�p k� n�ng m� r�ng V� H�n (C�p 4)",6,16)
			AddNumText(sceneId,x892002_g_ScriptId,"H�c t�p k� n�ng m� r�ng V� H�n (C�p 5)",6,17)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 9 then   --�����չ����
		BeginEvent(sceneId)
			AddText(sceneId,"V� h�n c�p b�c 4, c� th� th�ng qua t߽ng �ng V� H�n m� r�ng k� n�ng th� h�c t�p k� n�ng m� r�ng th� hai.")
			AddText(sceneId,"V� h�n c�p b�c 5, c� th� th�ng qua t߽ng �ng V� H�n m� r�ng k� n�ng th� h�c t�p k� n�ng m� r�ng th� ba, s� d�ng t߽ng �ng k� n�ng th� th�ng c�p th� hai m� r�ng k� n�ng.")
			AddText(sceneId,"V� h�n th�ng c�p m� r�ng k� n�ng t�y v� h�n c�p b�c m� n�ng cao.")
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p k� n�ng C�ng k�ch",6,19)
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p k� n�ng Ph�ng th�",6,20)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 10 then  --��ϴ��������
		BeginEvent(sceneId)
			AddText(sceneId,"C�p b�c V� H�n ��t t�i 3 c�p, m�i c� th� ti�n giai v� h�n c�p b�c. Ph�i h�p s� d�ng H�n B�ng Ch�u c�ng Nhu�n H�n Th�ch �em ng� dao b�n �t ph� t�i c�p 4, V� H�n sau khi �t ph� th�nh c�ng m� ra thu�c t�nh #GTh� hai, th� 3 #Wc�ng #Gm� r�ng k� n�ng#W, h�n n�a m� r�ng thu�c t�nh c�ng m� r�ng k� n�ng hi�u qu� t�y v� h�n c�p b�c m� n�ng cao.")
			AddNumText(sceneId,x892002_g_ScriptId,"H�c t�p k� n�ng m� r�ng V� H�n (C�p 4)",6,21)
			AddNumText(sceneId,x892002_g_ScriptId,"H�c t�p k� n�ng m� r�ng V� H�n (C�p 5)",6,22)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 11 then  --���ð���
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_84}")
			AddNumText(sceneId,x892002_g_ScriptId,"#{FBSJ_090311_03}",6,26)
			AddNumText(sceneId,x892002_g_ScriptId,"#{FBSJ_090311_04}",6,27)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 12 then                   --���� �� �ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"еt ph� c�p b�c V� H�n c�n ph�i h�p s� d�ng #G3 c�i #Wc�p b�c t߽ng �ng #GH�n B�ng Ch�u #Wv� #YNhu�n H�n Th�ch.")
			AddText(sceneId,"T�ng l�n t�i (C�p 4) c�n #G3 c�i H�n B�ng Ch�u (C�p 4) #Wv� #YNhu�n H�n Th�ch - Ng�")
			AddText(sceneId,"T�ng l�n t�i (C�p 5) c�n #G3 c�i H�n B�ng Ch�u (C�p 5) #Wv� #YNhu�n H�n Th�ch - Ph�")
			AddText(sceneId,"#{WH_NPC_4}")

			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Ng� Dao B�n - B�ng (C�p 4)",6,23)
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Ng� Dao B�n - B�ng (C�p 5)",6,24)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 13 then                   --���� �� �ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"еt ph� c�p b�c V� H�n c�n ph�i h�p s� d�ng #G3 c�i #Wc�p b�c t߽ng �ng #GH�n B�ng Ch�u #Wv� #YNhu�n H�n Th�ch.")
			AddText(sceneId,"T�ng l�n t�i (C�p 4) c�n #G3 c�i H�n B�ng Ch�u (C�p 4) #Wv� #YNhu�n H�n Th�ch - Ng�")
			AddText(sceneId,"T�ng l�n t�i (C�p 5) c�n #G3 c�i H�n B�ng Ch�u (C�p 5) #Wv� #YNhu�n H�n Th�ch - Ph�")
			AddText(sceneId,"#{WH_NPC_4}")

			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Ng� Dao B�n - H�a (C�p 4)",6,25)
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Ng� Dao B�n - H�a (C�p 5)",6,26)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 130 then
		x892002_OnDefaultEvent( sceneId, selfId,targetId )
	elseif NumText == 14 then
		BeginEvent(sceneId)
			AddText(sceneId,"еt ph� c�p b�c V� H�n c�n ph�i h�p s� d�ng #G3 c�i #Wc�p b�c t߽ng �ng #GH�n B�ng Ch�u #Wv� #YNhu�n H�n Th�ch.")
			AddText(sceneId,"T�ng l�n t�i (C�p 4) c�n #G3 c�i H�n B�ng Ch�u (C�p 4) #Wv� #YNhu�n H�n Th�ch - Ng�")
			AddText(sceneId,"T�ng l�n t�i (C�p 5) c�n #G3 c�i H�n B�ng Ch�u (C�p 5) #Wv� #YNhu�n H�n Th�ch - Ph�")
			AddText(sceneId,"#{WH_NPC_4}")

			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Ng� Dao B�n - Huy�n (C�p 4)",6,27)
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Ng� Dao B�n - Huy�n (C�p 5)",6,28)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 15 then
		BeginEvent(sceneId)
			AddText(sceneId,"еt ph� c�p b�c V� H�n c�n ph�i h�p s� d�ng #G3 c�i #Wc�p b�c t߽ng �ng #GH�n B�ng Ch�u #Wv� #YNhu�n H�n Th�ch.")
			AddText(sceneId,"T�ng l�n t�i (C�p 4) c�n #G3 c�i H�n B�ng Ch�u (C�p 4) #Wv� #YNhu�n H�n Th�ch - Ng�")
			AddText(sceneId,"T�ng l�n t�i (C�p 5) c�n #G3 c�i H�n B�ng Ch�u (C�p 5) #Wv� #YNhu�n H�n Th�ch - Ph�")
			AddText(sceneId,"#{WH_NPC_4}")

			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Ng� Dao B�n - еc (C�p 4)",6,29)
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Ng� Dao B�n - еc (C�p 5)",6,30)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)


	elseif NumText == 16 then
		BeginEvent(sceneId)
			AddText(sceneId,"V� h�n c�p b�c 4, c� th� th�ng qua t߽ng �ng V� H�n m� r�ng k� n�ng th� h�c t�p k� n�ng m� r�ng th� hai.")
			AddText(sceneId,"V� h�n c�p b�c 5, c� th� th�ng qua t߽ng �ng V� H�n m� r�ng k� n�ng th� h�c t�p k� n�ng m� r�ng th� ba, s� d�ng t߽ng �ng k� n�ng th� th�ng c�p th� hai m� r�ng k� n�ng.")
			AddText(sceneId,"V� h�n th�ng c�p m� r�ng k� n�ng t�y v� h�n c�p b�c m� n�ng cao.")

			AddNumText(sceneId,x892002_g_ScriptId,"H�c t�p Ng� - Thu�n Gi�p (C�p 1)",6,31)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 17 then
		BeginEvent(sceneId)
			AddText(sceneId,"V� h�n c�p b�c 4, c� th� th�ng qua t߽ng �ng V� H�n m� r�ng k� n�ng th� h�c t�p k� n�ng m� r�ng th� hai.")
			AddText(sceneId,"V� h�n c�p b�c 5, c� th� th�ng qua t߽ng �ng V� H�n m� r�ng k� n�ng th� h�c t�p k� n�ng m� r�ng th� ba, s� d�ng t߽ng �ng k� n�ng th� th�ng c�p th� hai m� r�ng k� n�ng.")
			AddText(sceneId,"V� h�n th�ng c�p m� r�ng k� n�ng t�y v� h�n c�p b�c m� n�ng cao.")

			AddNumText(sceneId,x892002_g_ScriptId,"H�c t�p H� - Tr� Ho�n (C�p 1)",6,32)
			AddNumText(sceneId,x892002_g_ScriptId,"H�c t�p H� - M�n L�c (C�p 1)",6,33)
			AddNumText(sceneId,x892002_g_ScriptId,"H�c t�p H� - Ph� Gi�p (C�p 1)",6,34)
			AddNumText(sceneId,x892002_g_ScriptId,"H�c t�p H� - H�a Kh� (C�p 1)",6,35)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 18 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{WH_NPC_8}")
			AddNumText(sceneId,x892002_g_ScriptId,"L�nh ng� B�o - Th�i B�ng",6,43)
			AddNumText(sceneId,x892002_g_ScriptId,"L�nh ng� B�o - L�m H�a",6,44)
			AddNumText(sceneId,x892002_g_ScriptId,"L�nh ng� B�o - Tr�ng Huy�n",6,45)
			AddNumText(sceneId,x892002_g_ScriptId,"L�nh ng� B�o - K�ch еc",6,46)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 19 then
		BeginEvent(sceneId)
			AddText(sceneId,"M�i l�a ch�n th�ng c�p V� H�n k� n�ng!")
			AddText(sceneId,"V� h�n c�p b�c 4, c� th� th�ng qua t߽ng �ng V� H�n m� r�ng k� n�ng th� h�c t�p k� n�ng m� r�ng th� hai.")
			AddText(sceneId,"V� h�n c�p b�c 5, c� th� th�ng qua t߽ng �ng V� H�n m� r�ng k� n�ng th� h�c t�p k� n�ng m� r�ng th� ba, s� d�ng t߽ng �ng k� n�ng th� th�ng c�p th� hai m� r�ng k� n�ng.")
			AddText(sceneId,"V� h�n th�ng c�p m� r�ng k� n�ng t�y v� h�n c�p b�c m� n�ng cao.")

			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p L�c - Ng�ng S߽ng (C�p 4)",6,36)
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p L�c - Nghi�p H�a (C�p 4)",6,37)
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p L�c - S�u L�i (C�p 4)",6,38)
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p L�c - Ph� C�t (C�p 4)",6,39)
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Di�t - L�m S߽ng (C�p 5)",6,40)
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Di�t - иa H�a (C�p 5)",6,41)
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Di�t - Thi�n L�i (C�p 5)",6,42)
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Di�t - Ch�m еc (C�p 5)",6,43)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 20 then
		BeginEvent(sceneId)
			AddText(sceneId,"V� h�n c�p b�c 4, c� th� th�ng qua t߽ng �ng V� H�n m� r�ng k� n�ng th� h�c t�p k� n�ng m� r�ng th� hai.")
			AddText(sceneId,"V� h�n c�p b�c 5, c� th� th�ng qua t߽ng �ng V� H�n m� r�ng k� n�ng th� h�c t�p k� n�ng m� r�ng th� ba, s� d�ng t߽ng �ng k� n�ng th� th�ng c�p th� hai m� r�ng k� n�ng.")
			AddText(sceneId,"V� h�n th�ng c�p m� r�ng k� n�ng t�y v� h�n c�p b�c m� n�ng cao.")
			AddNumText(sceneId,x892002_g_ScriptId,"Th�ng c�p Ng� - V� Gi�p (C�p 2)",6,44)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 21 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�p b�c V� H�n ��t t�i 3 c�p, m�i c� th� ti�n giai v� h�n c�p b�c. Ph�i h�p s� d�ng H�n B�ng Ch�u c�ng Nhu�n H�n Th�ch �em ng� dao b�n �t ph� t�i c�p 4, V� H�n sau khi �t ph� th�nh c�ng m� ra thu�c t�nh #GTh� hai, th� 3 #Wc�ng #Gm� r�ng k� n�ng#W, h�n n�a m� r�ng thu�c t�nh c�ng m� r�ng k� n�ng hi�u qu� t�y v� h�n c�p b�c m� n�ng cao.")
			AddNumText(sceneId,x892002_g_ScriptId,"M� r�ng thu�c t�nh V� H�n c�p 4 (B�ng)",6,45)
			AddNumText(sceneId,x892002_g_ScriptId,"M� r�ng thu�c t�nh V� H�n c�p 4 (H�a)",6,46)
			AddNumText(sceneId,x892002_g_ScriptId,"M� r�ng thu�c t�nh V� H�n c�p 4 (Huy�n)",6,47)
			AddNumText(sceneId,x892002_g_ScriptId,"M� r�ng thu�c t�nh V� H�n c�p 4 (еc)",6,48)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 22 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�p b�c V� H�n ��t t�i 3 c�p, m�i c� th� ti�n giai v� h�n c�p b�c. Ph�i h�p s� d�ng H�n B�ng Ch�u c�ng Nhu�n H�n Th�ch �em ng� dao b�n �t ph� t�i c�p 4, V� H�n sau khi �t ph� th�nh c�ng m� ra thu�c t�nh #GTh� hai, th� 3 #Wc�ng #Gm� r�ng k� n�ng#W, h�n n�a m� r�ng thu�c t�nh c�ng m� r�ng k� n�ng hi�u qu� t�y v� h�n c�p b�c m� n�ng cao.")
			AddNumText(sceneId,x892002_g_ScriptId,"M� r�ng thu�c t�nh V� H�n c�p 5 (B�ng)",6,49)
			AddNumText(sceneId,x892002_g_ScriptId,"M� r�ng thu�c t�nh V� H�n c�p 5 (H�a)",6,50)
			AddNumText(sceneId,x892002_g_ScriptId,"M� r�ng thu�c t�nh V� H�n c�p 5 (Huy�n)",6,51)
			AddNumText(sceneId,x892002_g_ScriptId,"M� r�ng thu�c t�nh V� H�n c�p 5 (еc)",6,52)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 23 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156114)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910015)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910035)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156114,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910015,3)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910035,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156118, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 24 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156118)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910016)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910034)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156118,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910016,3)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910034,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156122, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 25 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156115)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910015)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910035)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156115,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910015,3)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910035,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156119, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 26 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156119)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910016)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910034)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156119,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910016,3)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910034,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156123, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 27 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156116)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910015)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910035)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156116,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910015,3)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910035,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156120, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 28 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156120)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910016)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910034)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156120,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910016,3)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910034,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156124, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 29 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156117)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910015)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910035)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156117,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910015,3)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910035,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156121, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 30 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156121)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910016)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910034)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156121,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910016,3)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910034,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156125, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 31 then
		c0 = GetItemCount(sceneId, selfId, 10156118)
		c1 = GetItemCount(sceneId, selfId, 10156119)
		c2 = GetItemCount(sceneId, selfId, 10156120)
		c3 = GetItemCount(sceneId, selfId, 10156121)
              if c0 >=1 or c1 >=1 or c2 >=1 or c1 >=1 then
		      c4 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910029)
		      if  c4 < 1  then
		          strNotice = "#YNg�i kh�ng V� H�n k� n�ng th�, kh�ng th� h�c t�p!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1720) > 0  then
		          strNotice = "#YNg߽i �� h�c t�p k� n�ng n�y, kh�ng c�n h�c l�i!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      --if  HaveSkill(sceneId, selfId, 1702) > 0  then
			   --DelSkill(sceneId, selfId, 1702)
		      --end
			AddSkill(  sceneId, selfId, 1720)
			LuaFnDelAvailableItem(sceneId,selfId,39910029,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n k� n�ng l�nh ng� th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 32 then
		c0 = GetItemCount(sceneId, selfId, 10156122)
		c1 = GetItemCount(sceneId, selfId, 10156123)
		c2 = GetItemCount(sceneId, selfId, 10156124)
		c3 = GetItemCount(sceneId, selfId, 10156125)
              if c0 >=1 or c1 >=1 or c2 >=1 or c1 >=1 then
		      c4 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910030)
		      if  c4 < 1  then
		          strNotice = "#YNg�i kh�ng V� H�n k� n�ng th�, kh�ng th� h�c t�p!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1722) > 0  then
		          strNotice = "#YNg߽i �� h�c t�p k� n�ng n�y, kh�ng c�n h�c l�i!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      --if  HaveSkill(sceneId, selfId, 1702) > 0  then
			   --DelSkill(sceneId, selfId, 1702)
		      --end
			AddSkill(  sceneId, selfId, 1722)
			LuaFnDelAvailableItem(sceneId,selfId,39910030,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n k� n�ng l�nh ng� th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 33 then
		c0 = GetItemCount(sceneId, selfId, 10156122)
		c1 = GetItemCount(sceneId, selfId, 10156123)
		c2 = GetItemCount(sceneId, selfId, 10156124)
		c3 = GetItemCount(sceneId, selfId, 10156125)
              if c0 >=1 or c1 >=1 or c2 >=1 or c1 >=1 then
		      c4 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910031)
		      if  c4 < 1  then
		          strNotice = "#YNg�i kh�ng V� H�n k� n�ng th�, kh�ng th� h�c t�p!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1723) > 0  then
		          strNotice = "#YNg߽i �� h�c t�p k� n�ng n�y, kh�ng c�n h�c l�i!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      --if  HaveSkill(sceneId, selfId, 1702) > 0  then
			   --DelSkill(sceneId, selfId, 1702)
		      --end
			AddSkill(  sceneId, selfId, 1723)
			LuaFnDelAvailableItem(sceneId,selfId,39910031,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n k� n�ng l�nh ng� th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 34 then
		c0 = GetItemCount(sceneId, selfId, 10156122)
		c1 = GetItemCount(sceneId, selfId, 10156123)
		c2 = GetItemCount(sceneId, selfId, 10156124)
		c3 = GetItemCount(sceneId, selfId, 10156125)
              if c0 >=1 or c1 >=1 or c2 >=1 or c1 >=1 then
		      c4 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910032)
		      if  c4 < 1  then
		          strNotice = "#YNg�i kh�ng V� H�n k� n�ng th�, kh�ng th� h�c t�p!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1724) > 0  then
		          strNotice = "#YNg߽i �� h�c t�p k� n�ng n�y, kh�ng c�n h�c l�i!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      --if  HaveSkill(sceneId, selfId, 1702) > 0  then
			   --DelSkill(sceneId, selfId, 1702)
		      --end
			AddSkill(  sceneId, selfId, 1724)
			LuaFnDelAvailableItem(sceneId,selfId,39910032,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n k� n�ng l�nh ng� th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 35 then
		c0 = GetItemCount(sceneId, selfId, 10156122)
		c1 = GetItemCount(sceneId, selfId, 10156123)
		c2 = GetItemCount(sceneId, selfId, 10156124)
		c3 = GetItemCount(sceneId, selfId, 10156125)
              if c0 >=1 or c1 >=1 or c2 >=1 or c1 >=1 then
		      c4 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910033)
		      if  c4 < 1  then
		          strNotice = "#YNg�i kh�ng V� H�n k� n�ng th�, kh�ng th� h�c t�p!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1725) > 0  then
		          strNotice = "#YNg߽i �� h�c t�p k� n�ng n�y, kh�ng c�n h�c l�i!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      --if  HaveSkill(sceneId, selfId, 1702) > 0  then
			   --DelSkill(sceneId, selfId, 1702)
		      --end
			AddSkill(  sceneId, selfId, 1725)
			LuaFnDelAvailableItem(sceneId,selfId,39910033,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n k� n�ng l�nh ng� th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 36 then
		c0 = GetItemCount(sceneId, selfId, 10156118)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910041)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1712) > 0  then
		          strNotice = "#YNg߽i �� h�c t�p k� n�ng n�y, kh�ng c�n h�c l�i!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1708) > 0  then
			   DelSkill(sceneId, selfId, 1708)
		      end
			AddSkill(  sceneId, selfId, 1712)
			LuaFnDelAvailableItem(sceneId,selfId,39910041,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n k� n�ng l�nh ng� th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 37 then
		c0 = GetItemCount(sceneId, selfId, 10156119)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910042)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1713) > 0  then
		          strNotice = "#YNg߽i �� h�c t�p k� n�ng n�y, kh�ng c�n h�c l�i!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1709) > 0  then
			   DelSkill(sceneId, selfId, 1709)
		      end
			AddSkill(  sceneId, selfId, 1713)
			LuaFnDelAvailableItem(sceneId,selfId,39910042,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n k� n�ng l�nh ng� th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 38 then
		c0 = GetItemCount(sceneId, selfId, 10156120)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910043)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1714) > 0  then
		          strNotice = "#YNg߽i �� h�c t�p k� n�ng n�y, kh�ng c�n h�c l�i!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1710) > 0  then
			   DelSkill(sceneId, selfId, 1710)
		      end
			AddSkill(  sceneId, selfId, 1714)
			LuaFnDelAvailableItem(sceneId,selfId,39910043,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n k� n�ng l�nh ng� th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 39 then
		c0 = GetItemCount(sceneId, selfId, 10156121)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910044)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1715) > 0  then
		          strNotice = "#YNg߽i �� h�c t�p k� n�ng n�y, kh�ng c�n h�c l�i!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1711) > 0  then
			   DelSkill(sceneId, selfId, 1711)
		      end
			AddSkill(  sceneId, selfId, 1715)
			LuaFnDelAvailableItem(sceneId,selfId,39910044,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n k� n�ng l�nh ng� th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 40 then
		c0 = GetItemCount(sceneId, selfId, 10156122)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910045)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1716) > 0  then
		          strNotice = "#YNg߽i �� h�c t�p k� n�ng n�y, kh�ng c�n h�c l�i!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1712) > 0  then
			   DelSkill(sceneId, selfId, 1712)
		      end
			AddSkill(  sceneId, selfId, 1716)
			LuaFnDelAvailableItem(sceneId,selfId,39910045,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n k� n�ng l�nh ng� th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 41 then
		c0 = GetItemCount(sceneId, selfId, 10156123)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910046)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1717) > 0  then
		          strNotice = "#YNg߽i �� h�c t�p k� n�ng n�y, kh�ng c�n h�c l�i!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1713) > 0  then
			   DelSkill(sceneId, selfId, 1713)
		      end
			AddSkill(  sceneId, selfId, 1717)
			LuaFnDelAvailableItem(sceneId,selfId,39910046,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n k� n�ng l�nh ng� th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 42 then
		c0 = GetItemCount(sceneId, selfId, 10156124)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910047)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1718) > 0  then
		          strNotice = "#YNg߽i �� h�c t�p k� n�ng n�y, kh�ng c�n h�c l�i!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1714) > 0  then
			   DelSkill(sceneId, selfId, 1714)
		      end
			AddSkill(  sceneId, selfId, 1718)
			LuaFnDelAvailableItem(sceneId,selfId,39910047,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n k� n�ng l�nh ng� th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 43 then
		c0 = GetItemCount(sceneId, selfId, 10156125)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910048)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1719) > 0  then
		          strNotice = "#YNg߽i �� h�c t�p k� n�ng n�y, kh�ng c�n h�c l�i!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1715) > 0  then
			   DelSkill(sceneId, selfId, 1715)
		      end
			AddSkill(  sceneId, selfId, 1719)
			LuaFnDelAvailableItem(sceneId,selfId,39910048,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n k� n�ng l�nh ng� th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 44 then
		c0 = GetItemCount(sceneId, selfId, 10156122)
		c1 = GetItemCount(sceneId, selfId, 10156123)
		c2 = GetItemCount(sceneId, selfId, 10156124)
		c3 = GetItemCount(sceneId, selfId, 10156125)
              if c0 >=1 or c1 >=1 or c2 >=1 or c1 >=1 then
		      c4 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910040)
		      if  c4 < 1  then
		          strNotice = "#YNg�i kh�ng V� H�n k� n�ng th�, kh�ng th� h�c t�p!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1721) > 0  then
		          strNotice = "#YNg߽i �� h�c t�p k� n�ng n�y, kh�ng c�n h�c l�i!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1720) <= 0  then
		          strNotice = "#Y��������H�c t�p Ng� - Thu�n Gi�p �����������˼��ܣ���"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1720) > 0  then
			   DelSkill(sceneId, selfId, 1720)
		      end
			AddSkill(  sceneId, selfId, 1721)
			LuaFnDelAvailableItem(sceneId,selfId,39910040,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n k� n�ng l�nh ng� th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 45 then
		c0 = GetItemCount(sceneId, selfId, 10156118)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25032, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 46 then
		c0 = GetItemCount(sceneId, selfId, 10156119)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25033, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 47 then
		c0 = GetItemCount(sceneId, selfId, 10156120)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25034, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 48 then
		c0 = GetItemCount(sceneId, selfId, 10156121)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25035, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 49 then
		c0 = GetItemCount(sceneId, selfId, 10156122)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25040, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 50 then
		c0 = GetItemCount(sceneId, selfId, 10156123)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25041, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 51 then
		c0 = GetItemCount(sceneId, selfId, 10156124)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25042, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 52 then
		c0 = GetItemCount(sceneId, selfId, 10156125)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25043, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x892002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892002_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x892002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x892002_g_eventList do
		if missionScriptId == findId then
			x892002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x892002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x892002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x892002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x892002_OnDie( sceneId, selfId, killerId )
end




--**********************************
--�ж��Ƿ��ܹ�ѧϰ
--nSkillIndex��������ֵΪ��40��70��90���ֱ�ѧϰ��Ӧ����ļ���
--**********************************
function x892002_CheckStudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
	if (nSkillIndex ~= 40 and nSkillIndex ~= 70 and nSkillIndex ~= 90) then
		return 0;
	end
	
	--�ж���ҵȼ��Ƿ���
	local strNotice = "";
	local nLevel = GetLevel(sceneId, selfId);
	if ( nLevel < nSkillIndex) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_24}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_27}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_29}";
		end
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж��Ƿ��Ѿ�ѧ���˶�Ӧ����
	if  (HaveSkill(sceneId, selfId, x892002_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж���������Ƿ����㹻��Ǯ
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892002_g_DarkSkillName[nSkillIndex].needmoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	return 1;
	
end

--**********************************
--�����NPCѧϰ����ʹ�ü���
--nSkillIndex��������ֵΪ��40��70��90���ֱ�ѧϰ��Ӧ����ļ���
--**********************************
function x892002_StudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
	if (nSkillIndex ~= 40 and nSkillIndex ~= 70 and nSkillIndex ~= 90) then
		return
	end
	
	--�ж���ҵȼ��Ƿ���
	local strNotice = "";
	local nLevel = GetLevel(sceneId, selfId);
	if ( nLevel < nSkillIndex) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_24}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_27}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_29}";
		end
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж��Ƿ��Ѿ�ѧ���˶�Ӧ����
	if  (HaveSkill(sceneId, selfId, x892002_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж���������Ƿ����㹻��Ǯ
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892002_g_DarkSkillName[nSkillIndex].needmoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return
	end
	
	--�����ж϶�ͨ�������Կ�Ǯ��������
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, x892002_g_DarkSkillName[nSkillIndex].needmoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	AddSkill(  sceneId, selfId, x892002_g_DarkSkillName[nSkillIndex].id)
	x892002_ShowNotice(sceneId, selfId, targetId, x892002_g_DarkSkillTips[nSkillIndex]);
	x892002_NotifyTips( sceneId, selfId, x892002_g_DarkSkillTips[nSkillIndex] )
	
	x892002_StudySkillImpact(sceneId, selfId)
	DarkOperateResult(sceneId, selfId, 5, 1);    --�ü��ܰ�ť��˸
	
end


--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x892002_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
--����Ƿ����㰵��ƿ������
--����ֵ��0����1��1Ϊ���㣬0
--**********************************
function x892002_CheckDarkReachPoint(sceneId, selfId, targetId)
		
		local strInfo = "";
		--�ж���������Ƿ�װ���а���
		local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
		if ( bHaveDarkEquip ~= 1) then
			strInfo = "#{FBSJ_081209_13}";
			x892002_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж�������ϰ����Ƿ�ﵽƿ��
		local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
		if (bNeedNPC ~= 1) then
			strInfo = "#{FBSJ_081209_14}";
			x892002_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж���ҵȼ��Ƿ�Ͱ����ȼ���Ȼ���û�а����ȼ���
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nCharLevel = GetLevel(sceneId, selfId);
		if (nDarkLevel >= nCharLevel) then
			strInfo = "#{FBSJ_081209_15}";
			x892002_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж���������Ƿ����㹻��Ǯ
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nNeedMoney = x892002_g_DarkBreachPointNeedMoney[nDarkLevel];
		if (nNeedMoney == nil or nNeedMoney <= 0) then
			nNeedMoney = 100000;         --�Է���һ����ûʲô��
		end
		local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
		if (nHaveMoney < nNeedMoney) then    --10��
			strNotice = "#{FBSJ_081209_25}";
			x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			return 0;
		end
				
		return 1;
end


function x892002_BreachDarkPoint(sceneId, selfId, targetId)

	local strInfo = "";
	--�ж���������Ƿ�װ���а���
	local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
	if ( bHaveDarkEquip ~= 1) then
		strInfo = "#{FBSJ_081209_13}";
		x892002_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--�ж�������ϰ����Ƿ�ﵽƿ��
	local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
	if (bNeedNPC ~= 1) then
		strInfo = "#{FBSJ_081209_14}";
		x892002_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--�ж���ҵȼ��Ƿ�Ͱ����ȼ���Ȼ���û�а����ȼ���
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nCharLevel = GetLevel(sceneId, selfId);
	if (nDarkLevel >= nCharLevel) then
		strInfo = "#{FBSJ_081209_15}";
		x892002_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
			--�ж���������Ƿ����㹻��Ǯ
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nNeedMoney = x892002_g_DarkBreachPointNeedMoney[nDarkLevel];
	if (nNeedMoney == nil or nNeedMoney <= 0) then
		nNeedMoney = 100000;         --�Է���һ����ûʲô��
	end
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < nNeedMoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�����ж϶�ͨ�������Կ�Ǯͻ����
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--ͻ��ƿ�����ð�������
	local bDarkLevelup = DarkLevelUp(sceneId, selfId);
	if (bDarkLevelup == 1) then
		x892002_ShowNotice(sceneId, selfId, targetId, "#{FBSJ_081209_18}");
		--ͻ�Ƴɹ�����¼ͳ����־
			local guid = LuaFnObjId2Guid(sceneId, selfId);
			local sLog = format("dark level now: %d", nDarkLevel + 1); 
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_ANQITUPO, guid, sLog);
	else
		x892002_ShowNotice(sceneId, selfId, targetId, "еt ph� th�t b�i");
	end
	
	return
end

function x892002_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x892002_StudySkillImpact(sceneId, playerId)
	--��ʾѧϰ���¼��ܵ���Ч Ŀǰʹ��������Ч
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end

