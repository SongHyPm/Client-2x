--����NPC
--����
--��ͨ

--�ű���
x892005_g_ScriptId = 892005

--��ӵ�е��¼�ID�б�
x892005_g_eventList={}


x892005_g_DarkSkillName = { [40] = {name = "N�m �m kh�", id = 274, needmoney = 20000},
                            [70] = {name = "�m kh� �� huy�t", id = 275, needmoney = 100000},
                            [90] = {name = "�m kh� h� th�", id = 276, needmoney = 500000},
                          }                
x892005_g_DarkSkillTips = { [40] = "#{FBSJ_090106_89}",
                            [70] = "#{FBSJ_090106_90}",
                            [90] = "#{FBSJ_090106_91}",
                          }  
x892005_g_DarkBreachPointNeedMoney = 
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
function x892005_UpdateEventList( sceneId, selfId,targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"  Long V�n H�i t߽ng truy�n ng�n n�m, duy c� b� t�c n�y ch�n l�......#r ta t�ng c� h�nh ch�u qu� c� s�o b� t�c h�u du� long th� tam huynh � ch� �i�m, �i v�i Long V�n c� nghi�n c�u......")
		for i, eventId in x892005_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n",6,7)
		AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n",6,8)
		--AddNumText(sceneId,x892005_g_ScriptId,"M� r�ng thu�c t�nh Long V�n",6,9)
		--AddNumText(sceneId,x892005_g_ScriptId,"Gi�i thi�u Long V�n",8,888)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x892005_OnDefaultEvent( sceneId, selfId,targetId )
	x892005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x892005_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x892005_g_eventList do
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
			AddNumText(sceneId,x892005_g_ScriptId,"��������",6,666)
			AddNumText(sceneId,x892005_g_ScriptId,"�����������",6,667)
			AddNumText(sceneId,x892005_g_ScriptId,"������������",6,668)
			AddNumText(sceneId,x892005_g_ScriptId,"�������������ص���",6,669)
			AddNumText(sceneId,x892005_g_ScriptId,"������չ���Խ���",6,670)
			AddNumText(sceneId,x892005_g_ScriptId,"����ѧϰ���Խ���",6,671)
			--AddNumText(sceneId,x892005_g_ScriptId,"�������Ч��",6,672)
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 666 then  --�������Ƶȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"�г�������ǧ�괫�У��ؾ��б�������ǧ���������ϡ֮���Ѻ������������������������ศ������δ������������һ������Ҫ֮��ȴ�ѵ������ࡣ��ʱ��������ӿ���г��ؾ����ٵ��г�����������֮����ȴ�����������ϵ�ϡ�٣�����Ω���书�߾��ҵ�λ��Ⱥ֮�˷���ȡ�ô����ƣ���Ϊ�Լ�Ц����������֤��")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 667 then  --�������Ƶȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f�����������:#r����#W��#G��ʥ����#W�����д��BOSS����һ�����ʻ��#R���ƣ���������#W��")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 668 then  --�������Ƶȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f������������:#r����#Wʹ��#G3#W����Ӧ�ȼ���#G������#W�ɶ����ƽ��������������������#R��������#W��#RЯ���ȼ�#W��#R������չ����ֵ#W����õ���ߡ�#r#P(ֻ��ѧϰ����������Ʋ��ܽ�������)")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 669 then  --�������Ƶȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f#r�������������ص���:#r#Y���������������߾����ڱ�ʥ�����л�á�")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 670 then  --�������Ƶȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f������չ���Խ���:#r����#Wʹ��׺��ʯ������ѧϰ��������ƽ��Զ����һ����Ӧ�����#G������#W��չ���ԡ�һ�����������Կ���ѧϰ��")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 671 then  --�������Ƶȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f������������:#r#Y�����������:����#r#Wʹ��#G׺��ʯ#W�ɶ�����������ƽ���ѧϰ���ࡣ���Ƶ����������֡�����ע������󣬿���ʹ��������͹����������")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 672 then  --�������Ƶȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#Y�������Ч��:����#r#W������˵�����Ч������һ���̶����ܵ����Ƶȼ���Ӱ�졣#r������ʹA��B������ҷֱ�װ�����������ƣ�A��ҵ����ƿ���B��ҵ����ơ����A��ҵ����ƺϳɵȼ�����B��ҵ����Ƶȼ����˺��Ŵ�Ч���������ԣ����A��ҵ����Ƶȼ�����B��ҵ����Ƶȼ����˺��Ŵ�Ч��������������")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 7 then  --�������Ƶȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"Mu�n th�ng c�p Long V�n, tr߾c h�t �em Long V�n #GC�m tinh#W, v� nh� th� n�o l� Long V�n c�m tinh, ng߽i c� th� t�m ng߶i huynh � #GLong Vi�n #Wgi�p ng߽i.")
			AddText(sceneId,"#cfff263Th�ng c�p Long V�n th�p h�n 5, ng߽i c� th� ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y#W. Th�ng c�p Long V�n  t� 5 �n 6 c�n ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y #Wv� #YS� c�p C�u Thi�n Th�i#W.")
			AddText(sceneId,"Th�ng c�p Long V�n c�p 7 �n 8, c�n ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y #Wv� #YTrung c�p C�u Thi�n Th�i#W. Long v�n th�ng c�p l�n 9 c�n ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y #Wv� #YCao c�p C�u Thi�n Th�i#W.")
			AddText(sceneId,"#r#c00ffff(Thao t�c n�y c�n �em Long V�n ���c kh�m b�o th�ch to�n b� th�o xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")

			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n (B�ng)",6,12)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n (H�a)",6,13)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n (Huy�n)",6,14)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n (еc)",6,15)
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 8 then  --������
		BeginEvent(sceneId)
			AddText(sceneId,"    #cfff263T�y thu�c t�nh Long V�n c�n ti�u hao nh�t �nh s� l��ng #GT�nh V�n Th�y#cfff263.#r Long V�n sau khi t�y thu�c t�nh, kh� n�ng xu�t hi�n thu�c t�nh ng�u nhi�n, ch� c�n ng߽i nh�n ph�m t�t, c� th� ra 16 thu�c t�nh c�c ph�m.")
			AddText(sceneId,"#r#c00ffff(Thao t�c n�y c�n �em Long V�n ���c kh�m b�o th�ch to�n b� th�o xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")

			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n (B�ng) ����",6,16)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n (H�a)",6,17)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n (Huy�n)",6,18)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n (еc)",6,19)
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 10 then  --��ϴ��������
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 6 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)

	elseif NumText == 11 then  --���ð���
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_84}")
			AddNumText(sceneId,x892005_g_ScriptId,"#{FBSJ_090311_03}",6,26)
			AddNumText(sceneId,x892005_g_ScriptId,"#{FBSJ_090311_04}",6,27)
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 12 then                   --���� �� �ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfff263Th�ng c�p Long V�n th�p h�n 5, ng߽i c� th� ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y#W. Th�ng c�p Long V�n  t� 5 �n 6 c�n ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y #Wv� #YS� c�p C�u Thi�n Th�i#W.")
			AddText(sceneId,"Th�ng c�p Long V�n c�p 7 �n 8, c�n ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y #Wv� #YTrung c�p C�u Thi�n Th�i#W. Long v�n th�ng c�p l�n 9 c�n ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y #Wv� #YCao c�p C�u Thi�n Th�i#W.")
			AddText(sceneId,"#r#c00ffff(Thao t�c n�y c�n �em Long V�n ���c kh�m b�o th�ch to�n b� th�o xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - B�ng (C�p 1)",6,23)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - B�ng (C�p 2)",6,24)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - B�ng (C�p 3)",6,25)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - B�ng (C�p 4)",6,70)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - B�ng (C�p 5)",6,71)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - B�ng (C�p 6)",6,72)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - B�ng (C�p 7)",6,73)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - B�ng (C�p 8)",6,74)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - B�ng (C�p 9)",6,75)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - B�ng (C�p 10)",6,76)
			AddNumText(sceneId,x892005_g_ScriptId,"Long V�n t�i li�u thuy�t minh",6,800)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 13 then                   --���� �� �ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfff263Th�ng c�p Long V�n th�p h�n 5, ng߽i c� th� ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y#W. Th�ng c�p Long V�n  t� 5 �n 6 c�n ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y #Wv� #YS� c�p C�u Thi�n Th�i#W.")
			AddText(sceneId,"Th�ng c�p Long V�n c�p 7 �n 8, c�n ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y #Wv� #YTrung c�p C�u Thi�n Th�i#W. Long v�n th�ng c�p l�n 9 c�n ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y #Wv� #YCao c�p C�u Thi�n Th�i#W.")
			AddText(sceneId,"#r#c00ffff(Thao t�c n�y c�n �em Long V�n ���c kh�m b�o th�ch to�n b� th�o xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - H�a (C�p 1)",6,26)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - H�a (C�p 2)",6,27)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - H�a (C�p 3)",6,28)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - H�a (C�p 4)",6,77)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - H�a (C�p 5)",6,78)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - H�a (C�p 6)",6,79)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - H�a (C�p 7)",6,80)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - H�a (C�p 8)",6,81)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - H�a (C�p 9)",6,82)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - H�a (C�p 10)",6,83)
			AddNumText(sceneId,x892005_g_ScriptId,"Long V�n t�i li�u thuy�t minh",6,800)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 130 then
		x892005_OnDefaultEvent( sceneId, selfId,targetId )
	elseif NumText == 14 then
		BeginEvent(sceneId)
			AddText(sceneId,"#cfff263Th�ng c�p Long V�n th�p h�n 5, ng߽i c� th� ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y#W. Th�ng c�p Long V�n  t� 5 �n 6 c�n ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y #Wv� #YS� c�p C�u Thi�n Th�i#W.")
			AddText(sceneId,"Th�ng c�p Long V�n c�p 7 �n 8, c�n ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y #Wv� #YTrung c�p C�u Thi�n Th�i#W. Long v�n th�ng c�p l�n 9 c�n ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y #Wv� #YCao c�p C�u Thi�n Th�i#W.")
			AddText(sceneId,"#r#c00ffff(Thao t�c n�y c�n �em Long V�n ���c kh�m b�o th�ch to�n b� th�o xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - Huy�n (C�p 1)",6,29)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - Huy�n (C�p 2)",6,30)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - Huy�n (C�p 3)",6,31)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - Huy�n (C�p 4)",6,84)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - Huy�n (C�p 5)",6,85)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - Huy�n (C�p 6)",6,86)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - Huy�n (C�p 7)",6,87)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - Huy�n (C�p 8)",6,88)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - Huy�n (C�p 9)",6,89)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - Huy�n (C�p 10)",6,90)
			AddNumText(sceneId,x892005_g_ScriptId,"Long V�n t�i li�u thuy�t minh",6,800)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 15 then
		BeginEvent(sceneId)
			AddText(sceneId,"#cfff263Th�ng c�p Long V�n th�p h�n 5, ng߽i c� th� ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y#W. Th�ng c�p Long V�n  t� 5 �n 6 c�n ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y #Wv� #YS� c�p C�u Thi�n Th�i#W.")
			AddText(sceneId,"Th�ng c�p Long V�n c�p 7 �n 8, c�n ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y #Wv� #YTrung c�p C�u Thi�n Th�i#W. Long v�n th�ng c�p l�n 9 c�n ti�u hao nh�t �nh s� l��ng #YNg�c Long Th�y #Wv� #YCao c�p C�u Thi�n Th�i#W.")
			AddText(sceneId,"#r#c00ffff(Thao t�c n�y c�n �em Long V�n ���c kh�m b�o th�ch to�n b� th�o xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - еc (C�p 1)",6,32)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - еc (C�p 2)",6,33)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - еc (C�p 3)",6,34)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - еc (C�p 4)",6,91)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - еc (C�p 5)",6,92)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - еc (C�p 6)",6,93)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - еc (C�p 7)",6,94)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - еc (C�p 8)",6,95)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - еc (C�p 9)",6,96)
			AddNumText(sceneId,x892005_g_ScriptId,"Th�ng c�p Long V�n - еc (C�p 10)",6,97)
			AddNumText(sceneId,x892005_g_ScriptId,"Long V�n t�i li�u thuy�t minh",6,800)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 16 then
		BeginEvent(sceneId)
			AddText(sceneId,"    #cfff263T�y thu�c t�nh Long V�n c�n ti�u hao nh�t �nh s� l��ng #GT�nh V�n Th�y#cfff263.#r Long V�n sau khi t�y thu�c t�nh, kh� n�ng xu�t hi�n thu�c t�nh ng�u nhi�n, ch� c�n ng߽i nh�n ph�m t�t, c� th� ra 16 thu�c t�nh c�c ph�m.")
			AddText(sceneId,"#r#c00ffff(Thao t�c n�y c�n �em Long V�n ���c kh�m b�o th�ch to�n b� th�o xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n B�ng (C�p 1)",6,35)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n B�ng (C�p 2)",6,36)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n B�ng (C�p 3)",6,37)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n B�ng (C�p 4)",6,38)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n B�ng (C�p 5)",6,98)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n B�ng (C�p 6)",6,99)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n B�ng (C�p 7)",6,100)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n B�ng (C�p 8)",6,101)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n B�ng (C�p 9)",6,102)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n B�ng (C�p 10)",6,103)
			AddNumText(sceneId,x892005_g_ScriptId,"Gi�i thi�u t�y thu�c t�nh Long V�n",6,999)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 17 then
		BeginEvent(sceneId)
			AddText(sceneId,"    #cfff263T�y thu�c t�nh Long V�n c�n ti�u hao nh�t �nh s� l��ng #GT�nh V�n Th�y#cfff263.#r Long V�n sau khi t�y thu�c t�nh, kh� n�ng xu�t hi�n thu�c t�nh ng�u nhi�n, ch� c�n ng߽i nh�n ph�m t�t, c� th� ra 16 thu�c t�nh c�c ph�m.")
			AddText(sceneId,"#r#c00ffff(Thao t�c n�y c�n �em Long V�n ���c kh�m b�o th�ch to�n b� th�o xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n H�a (C�p 1)",6,39)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n H�a (C�p 2)",6,40)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n H�a (C�p 3)",6,41)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n H�a (C�p 4)",6,42)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n H�a (C�p 5)",6,104)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n H�a (C�p 6)",6,105)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n H�a (C�p 7)",6,106)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n H�a (C�p 8)",6,107)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n H�a (C�p 9)",6,108)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n H�a (C�p 10)",6,109)
			AddNumText(sceneId,x892005_g_ScriptId,"Gi�i thi�u t�y thu�c t�nh Long V�n",6,999)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 18 then
		BeginEvent(sceneId)
			AddText(sceneId,"    #cfff263T�y thu�c t�nh Long V�n c�n ti�u hao nh�t �nh s� l��ng #GT�nh V�n Th�y#cfff263.#r Long V�n sau khi t�y thu�c t�nh, kh� n�ng xu�t hi�n thu�c t�nh ng�u nhi�n, ch� c�n ng߽i nh�n ph�m t�t, c� th� ra 16 thu�c t�nh c�c ph�m.")
			AddText(sceneId,"#r#c00ffff(Thao t�c n�y c�n �em Long V�n ���c kh�m b�o th�ch to�n b� th�o xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n Huy�n (C�p 1)",6,43)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n Huy�n (C�p 2)",6,44)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n Huy�n (C�p 3)",6,45)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n Huy�n (C�p 4)",6,46)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n Huy�n (C�p 5)",6,110)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n Huy�n (C�p 6)",6,111)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n Huy�n (C�p 7)",6,112)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n Huy�n (C�p 8)",6,113)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n Huy�n (C�p 9)",6,114)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n Huy�n (C�p 10)",6,115)
			AddNumText(sceneId,x892005_g_ScriptId,"Gi�i thi�u t�y thu�c t�nh Long V�n",6,999)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 19 then
		BeginEvent(sceneId)
			AddText(sceneId,"    #cfff263T�y thu�c t�nh Long V�n c�n ti�u hao nh�t �nh s� l��ng #GT�nh V�n Th�y#cfff263.#r Long V�n sau khi t�y thu�c t�nh, kh� n�ng xu�t hi�n thu�c t�nh ng�u nhi�n, ch� c�n ng߽i nh�n ph�m t�t, c� th� ra 16 thu�c t�nh c�c ph�m.")
			AddText(sceneId,"#r#c00ffff(Thao t�c n�y c�n �em Long V�n ���c kh�m b�o th�ch to�n b� th�o xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n еc (C�p 1)",6,47)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n еc (C�p 2)",6,48)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n еc (C�p 3)",6,49)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n еc (C�p 4)",6,50)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n еc (C�p 5)",6,116)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n еc (C�p 6)",6,117)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n еc (C�p 7)",6,118)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n еc (C�p 8)",6,119)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n еc (C�p 9)",6,120)
			AddNumText(sceneId,x892005_g_ScriptId,"T�y thu�c t�nh Long V�n еc (C�p 10)",6,121)
			AddNumText(sceneId,x892005_g_ScriptId,"Gi�i thi�u t�y thu�c t�nh Long V�n",6,999)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 20 then
		BeginEvent(sceneId)
			AddText(sceneId,"M�i l�a ch�n thu�c t�nh m� r�ng!")
			AddNumText(sceneId,x892005_g_ScriptId,"M� r�ng thu�c t�nh Long V�n c�p 1 (B�ng)",6,51)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r�ng thu�c t�nh Long V�n c�p 1 (H�a)",6,52)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r�ng thu�c t�nh Long V�n c�p 1 (Huy�n)",6,53)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r�ng thu�c t�nh Long V�n c�p 1 (еc)",6,54)
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 21 then
		BeginEvent(sceneId)
			AddText(sceneId,"M�i l�a ch�n thu�c t�nh m� r�ng!")
			AddNumText(sceneId,x892005_g_ScriptId,"M� r�ng thu�c t�nh Long V�n c�p 2 (B�ng)",6,55)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r�ng thu�c t�nh Long V�n c�p 2 (H�a)",6,56)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r�ng thu�c t�nh Long V�n c�p 2 (Huy�n)",6,57)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r�ng thu�c t�nh Long V�n c�p 2 (еc)",6,58)
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 22 then
		BeginEvent(sceneId)
			AddText(sceneId,"M�i l�a ch�n thu�c t�nh m� r�ng!")
			AddNumText(sceneId,x892005_g_ScriptId,"M� r�ng thu�c t�nh Long V�n c�p 3 (B�ng)",6,59)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r�ng thu�c t�nh Long V�n c�p 3 (H�a)",6,60)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r�ng thu�c t�nh Long V�n c�p 3 (Huy�n)",6,61)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r�ng thu�c t�nh Long V�n c�p 3 (еc)",6,62)
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 23 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157004)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157004,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157005, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y20 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 24 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157005)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157005,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157009, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )

		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y20 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 25 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157009)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=40 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157009,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,40)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157013, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y40 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 70 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157013)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=80 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157013,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,80)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157017, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y80 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 71 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157017)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=160 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157017,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,160)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157021, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y160 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GS� c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 72 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157021)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=240 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157021,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,240)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157025, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y240 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GS� c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 73 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157025)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=300 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157025,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,300)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157029, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y300 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GTrung c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 74 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157029)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=400 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157029,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,400)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157033, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y400 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GTrung c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 75 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157033)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=450 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157033,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,450)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157037, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y450 c�i #GNg�c Long Th�y c�ng #Y30c�i #GCao c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 76 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157037)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=500 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157037,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,500)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157041, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y500 c�i #GNg�c Long Th�y c�ng #Y30c�i #GCao c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 26 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157004)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157004,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157006, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y20 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 27 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157006)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157006,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157010, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )

		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y20 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 28 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157010)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=40 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157010,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,40)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157014, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y40 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 77 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157014)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=80 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157014,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,80)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157018, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y80 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 78 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157018)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=160 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157018,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,160)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157022, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y160 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GS� c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 79 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157022)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=240 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157022,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,240)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157026, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y240 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GS� c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 80 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157026)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=300 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157026,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,300)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157030, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y300 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GTrung c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 81 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157030)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=400 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157030,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,400)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157034, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y400 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GTrung c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 82 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157034)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=450 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157034,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,450)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157038, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y450 c�i #GNg�c Long Th�y c�ng #Y30c�i #GCao c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 83 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157038)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=500 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157038,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,500)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157042, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y500 c�i #GNg�c Long Th�y c�ng #Y30c�i #GCao c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 29 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157004)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157004,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157007, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y20 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 30 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157007)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157007,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157011, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )

		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y20 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 31 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157011)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=40 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157011,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,40)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157015, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y40 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 84 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157015)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=80 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157015,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,80)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157019, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y80 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 85 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157019)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=160 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157019,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,160)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157023, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y160 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GS� c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 86 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157023)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=240 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157023,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,240)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157027, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y240 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GS� c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 87 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157027)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=300 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157027,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,300)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157031, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y300 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GTrung c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 88 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157031)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=400 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157031,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,400)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157035, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y400 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GTrung c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 89 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157035)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=450 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157035,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,450)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157039, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y450 c�i #GNg�c Long Th�y c�ng #Y30c�i #GCao c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 90 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157039)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=500 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157039,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,500)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157043, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y500 c�i #GNg�c Long Th�y c�ng #Y30c�i #GCao c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 32 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157004)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157004,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157008, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y20 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 33 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157008)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157008,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157012, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )

		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y20 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 34 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157012)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=40 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157012,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,40)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157016, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y40 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 91 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157016)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=80 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157016,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,80)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157020, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n c�ng #Y80 c�i #GNg�c Long Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 92 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157020)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=160 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157020,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,160)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157024, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y160 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GS� c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 93 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157024)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=240 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157024,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,240)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157028, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y240 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GS� c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 94 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157028)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=300 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157028,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,300)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157032, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y300 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GTrung c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 95 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157032)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=400 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157032,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,400)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157036, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y400 c�i #GNg�c Long Th�y c�ng #Y30 c�i #GTrung c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 96 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157036)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=450 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157036,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,450)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157040, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y450 c�i #GNg�c Long Th�y c�ng #Y30c�i #GCao c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 97 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157040)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=500 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157040,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310176,500)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157044, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th�ng c�p! Thu�n nhi�n gian t�n th�nh L�c D߽ng n�i thi�n h�n �a �m, ch� th�y m�i ng߶i �u th�m nh� d�i, t� nay v� sau l�i c� m�t th�n binh l�i kh� r�i xu�ng nh�n gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y500 c�i #GNg�c Long Th�y c�ng #Y30c�i #GCao c�p C�u Thi�n Th�i!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 35 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157005)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157005,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157005, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y1 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 36 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157009)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=2 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157009,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,2)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157009, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y2 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 37 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157013)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157013,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157013, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y3 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 38 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157017)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=4 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157017,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,4)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157017, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y4 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 98 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157021)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157021,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,5)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157021, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y5 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 99 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157025)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=6 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157025,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,6)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157025, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y6 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 100 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157029)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=7 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157029,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,7)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157029, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y7 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 101 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157033)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=8 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157033,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,8)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157033, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y8 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 102 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157037)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=9 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157037,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,9)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157037, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y9 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 103 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157041)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157041,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157041, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y10 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end



	elseif NumText == 39 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157006)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157006,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157006, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y1 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 40 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157010)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=2 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157010,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,2)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157010, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y2 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 41 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157014)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157014,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157014, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y3 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 42 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157018)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=4 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157018,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,4)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157018, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y4 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 104 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157022)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157022,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,5)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157022, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y5 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 105 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157026)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=6 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157026,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,6)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157026, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y6 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 106 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157030)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=7 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157030,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,7)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157030, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y7 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 107 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157034)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=8 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157034,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,8)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157034, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y8 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 108 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157038)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=9 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157038,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,9)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157038, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y9 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 109 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157042)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157042,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157042, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y10 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 43 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157007)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157007,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157007, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y1 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 44 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157011)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=2 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157011,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,2)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157011, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y2 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 45 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157015)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157015,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157015, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y3 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 46 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157019)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=4 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157019,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,4)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157019, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y4 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 110 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157023)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157023,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,5)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157023, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y5 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 111 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157027)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=6 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157027,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,6)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157027, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y6 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 112 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157031)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=7 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157031,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,7)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157031, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y7 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 113 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157035)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=8 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157035,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,8)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157035, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y8 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 114 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157039)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=9 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157039,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,9)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157039, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y9 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 115 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157043)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157043,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157043, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y10 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 47 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157008)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157008,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157008, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y1 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 48 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157012)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=2 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157012,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,2)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157012, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y2 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 49 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157016)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157016,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157016, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y3 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 50 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157020)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=4 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157020,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,4)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157020, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y4 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 116 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157024)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157024,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,5)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157024, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y5 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 117 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157028)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=6 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157028,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,6)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157028, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y6 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 118 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157032)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=7 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157032,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,7)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157032, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y7 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 119 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157036)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=8 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157036,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,8)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157036, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y8 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 120 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157040)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=9 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157040,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,9)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157040, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y9 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 121 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157044)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157044,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310180,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157044, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th�t c�n th�n h߾ng long v�n th��ng g�n m�t phen t�nh v�n th�y, m�t c�i m�i tinh #W#{_INFOMSG%s}#W xu�t hi�n � tr߾c m�t!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n tr�ng t�y thu�c t�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u. C�n Long V�n v� #Y10 c�i #GT�nh V�n Th�y!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 800 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�p t�: #G1~2#cfff263 c�n:#G20 c�i #cfff263Ng�c Long Th�y #r c�p #G3#cfff263 c�n :#G40 c�i #cfff263Ng�c Long Th�y #r c�p #G4#cfff263 c�n #G80 c�i #cfff263Ng�c Long Th�y")
			AddText(sceneId,"    #G5#cfff263 C�p: #G160 c�i #cfff263Ng�c Long Th�y, #G30 c�i #cfff263S� c�p C�u Thi�n Th�i#r    #G6#cfff263 C�p: #G240 c�i #cfff263Ng�c Long Th�y, #G30 c�i #cfff263S� c�p C�u Thi�n Th�i#r    #G7#cfff263 C�p: #G300 c�i #cfff263Ng�c Long Th�y, #G30 c�i #cfff263Trung c�p C�u Thi�n Th�i")
			AddText(sceneId,"    #G8#cfff263 C�p: #G400 c�i #cfff263Ng�c Long Th�y, #G30 c�i #cfff263Trung c�p C�u Thi�n Th�i#r    #G9#cfff263 C�p: #G450 c�i #cfff263Ng�c Long Th�y, #G30 c�i #cfff263Cao c�p C�u Thi�n Th�i#r    #G10#cfff263 C�p: #G500 c�i #cfff263Ng�c Long Th�y, #G30 c�i #cfff263Cao c�p C�u Thi�n Th�i")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 999 then
		BeginEvent(sceneId)
			AddText(sceneId,"#G1#cfff263 C�p: #G1 c�i #cfff263T�nh V�n Th�y#r    #G2#cfff263 C�p: #G2 c�i #cfff263T�nh V�n Th�y#r    #G3#cfff263 C�p: #G3 c�i #cfff263T�nh V�n Th�y#r    #G4#cfff263 C�p: #G4 c�i #cfff263T�nh V�n Th�y")
			AddText(sceneId,"    #G5#cfff263 C�p: #G5 c�i #cfff263T�nh V�n Th�y#r    #G5#cfff263 C�p: #G5 c�i #cfff263T�nh V�n Th�y#r    #G7#cfff263 C�p: #G7 c�i #cfff263T�nh V�n Th�y#r    #G8#cfff263 C�p: #G8 c�i #cfff263T�nh V�n Th�y")
			AddText(sceneId,"    #G9#cfff263 C�p: #G9 c�i #cfff263T�nh V�n Th�y#r    #G10#cfff263 C�p: #G10 c�i #cfff263T�nh V�n Th�y")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 53 then
		c0 = GetItemCount(sceneId, selfId, 10156108)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25010, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, long v�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 54 then
		c0 = GetItemCount(sceneId, selfId, 10156109)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25011, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, long v�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 55 then
		c0 = GetItemCount(sceneId, selfId, 10156110)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25016, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, long v�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 56 then
		c0 = GetItemCount(sceneId, selfId, 10156111)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25017, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, long v�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 57 then
		c0 = GetItemCount(sceneId, selfId, 10156112)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25018, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, long v�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 58 then
		c0 = GetItemCount(sceneId, selfId, 10156113)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25019, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, long v�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 59 then
		c0 = GetItemCount(sceneId, selfId, 10156114)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25024, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, long v�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 60 then
		c0 = GetItemCount(sceneId, selfId, 10156115)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25025, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, long v�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 61 then
		c0 = GetItemCount(sceneId, selfId, 10156116)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25026, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, long v�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 62 then
		c0 = GetItemCount(sceneId, selfId, 10156117)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25027, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, long v�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u Nguy�n li�u!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x892005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892005_g_eventList do
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
function x892005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x892005_g_eventList do
		if missionScriptId == findId then
			x892005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x892005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x892005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x892005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x892005_OnDie( sceneId, selfId, killerId )
end




--**********************************
--�ж��Ƿ��ܹ�ѧϰ
--nSkillIndex��������ֵΪ��40��70��90���ֱ�ѧϰ��Ӧ����ļ���
--**********************************
function x892005_CheckStudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж��Ƿ��Ѿ�ѧ���˶�Ӧ����
	if  (HaveSkill(sceneId, selfId, x892005_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж���������Ƿ����㹻��Ǯ
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892005_g_DarkSkillName[nSkillIndex].needmoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	return 1;
	
end

--**********************************
--�����NPCѧϰ����ʹ�ü���
--nSkillIndex��������ֵΪ��40��70��90���ֱ�ѧϰ��Ӧ����ļ���
--**********************************
function x892005_StudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж��Ƿ��Ѿ�ѧ���˶�Ӧ����
	if  (HaveSkill(sceneId, selfId, x892005_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж���������Ƿ����㹻��Ǯ
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892005_g_DarkSkillName[nSkillIndex].needmoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return
	end
	
	--�����ж϶�ͨ�������Կ�Ǯ��������
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, x892005_g_DarkSkillName[nSkillIndex].needmoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	AddSkill(  sceneId, selfId, x892005_g_DarkSkillName[nSkillIndex].id)
	x892005_ShowNotice(sceneId, selfId, targetId, x892005_g_DarkSkillTips[nSkillIndex]);
	x892005_NotifyTips( sceneId, selfId, x892005_g_DarkSkillTips[nSkillIndex] )
	
	x892005_StudySkillImpact(sceneId, selfId)
	DarkOperateResult(sceneId, selfId, 5, 1);    --�ü��ܰ�ť��˸
	
end


--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x892005_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
--����Ƿ����㰵��ƿ������
--����ֵ��0����1��1Ϊ���㣬0
--**********************************
function x892005_CheckDarkReachPoint(sceneId, selfId, targetId)
		
		local strInfo = "";
		--�ж���������Ƿ�װ���а���
		local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
		if ( bHaveDarkEquip ~= 1) then
			strInfo = "#{FBSJ_081209_13}";
			x892005_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж�������ϰ����Ƿ�ﵽƿ��
		local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
		if (bNeedNPC ~= 1) then
			strInfo = "#{FBSJ_081209_14}";
			x892005_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж���ҵȼ��Ƿ�Ͱ����ȼ���Ȼ���û�а����ȼ���
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nCharLevel = GetLevel(sceneId, selfId);
		if (nDarkLevel >= nCharLevel) then
			strInfo = "#{FBSJ_081209_15}";
			x892005_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж���������Ƿ����㹻��Ǯ
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nNeedMoney = x892005_g_DarkBreachPointNeedMoney[nDarkLevel];
		if (nNeedMoney == nil or nNeedMoney <= 0) then
			nNeedMoney = 100000;         --�Է���һ����ûʲô��
		end
		local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
		if (nHaveMoney < nNeedMoney) then    --10��
			strNotice = "#{FBSJ_081209_25}";
			x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
			return 0;
		end
				
		return 1;
end


function x892005_BreachDarkPoint(sceneId, selfId, targetId)

	local strInfo = "";
	--�ж���������Ƿ�װ���а���
	local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
	if ( bHaveDarkEquip ~= 1) then
		strInfo = "#{FBSJ_081209_13}";
		x892005_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--�ж�������ϰ����Ƿ�ﵽƿ��
	local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
	if (bNeedNPC ~= 1) then
		strInfo = "#{FBSJ_081209_14}";
		x892005_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--�ж���ҵȼ��Ƿ�Ͱ����ȼ���Ȼ���û�а����ȼ���
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nCharLevel = GetLevel(sceneId, selfId);
	if (nDarkLevel >= nCharLevel) then
		strInfo = "#{FBSJ_081209_15}";
		x892005_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
			--�ж���������Ƿ����㹻��Ǯ
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nNeedMoney = x892005_g_DarkBreachPointNeedMoney[nDarkLevel];
	if (nNeedMoney == nil or nNeedMoney <= 0) then
		nNeedMoney = 100000;         --�Է���һ����ûʲô��
	end
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < nNeedMoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�����ж϶�ͨ�������Կ�Ǯͻ����
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--ͻ��ƿ�����ð�������
	local bDarkLevelup = DarkLevelUp(sceneId, selfId);
	if (bDarkLevelup == 1) then
		x892005_ShowNotice(sceneId, selfId, targetId, "#{FBSJ_081209_18}");
		--ͻ�Ƴɹ�����¼ͳ����־
			local guid = LuaFnObjId2Guid(sceneId, selfId);
			local sLog = format("dark level now: %d", nDarkLevel + 1); 
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_ANQITUPO, guid, sLog);
	else
		x892005_ShowNotice(sceneId, selfId, targetId, "еt ph� th�t b�i");
	end
	
	return
end

function x892005_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x892005_StudySkillImpact(sceneId, playerId)
	--��ʾѧϰ���¼��ܵ���Ч Ŀǰʹ��������Ч
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end
