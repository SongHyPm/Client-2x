--����NPC
--����
--��ͨ

--�ű���
x892000_g_ScriptId = 892000

--��ӵ�е��¼�ID�б�
x892000_g_eventList={}


x892000_g_DarkSkillName = { [40] = {name = "N�m �m kh�", id = 274, needmoney = 20000},
                            [70] = {name = "�m kh� �� huy�t", id = 275, needmoney = 100000},
                            [90] = {name = "�m kh� h� th�", id = 276, needmoney = 500000},
                          }                
x892000_g_DarkSkillTips = { [40] = "#{FBSJ_090106_89}",
                            [70] = "#{FBSJ_090106_90}",
                            [90] = "#{FBSJ_090106_91}",
                          }  
x892000_g_DarkBreachPointNeedMoney = 
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
function x892000_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"Ng�i h�o, thi�u hi�p hay kh�ng c�ng nghe qu�: V� ph� r�ng m�y �� kinh nh�t nguy�t, h�n l�m thi�n v� nhi�p C�n Kh�n. Ta �i v� h�n n�y b�o v�t xem nh� l��c c� nghi�n c�u, n�u ng�i mu�n nghe ���c, ta nh�t �nh tri v� b�t ng�n, ng�n v� b�t t�n.")
		for i, eventId in x892000_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText(sceneId,x892000_g_ScriptId,"Th�ng c�p V� H�n",6,7)
		AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� k� n�ng V� H�n",6,8)
		AddNumText(sceneId,x892000_g_ScriptId,"M� r�ng thu�c t�nh V� H�n",6,9)
		AddNumText(sceneId,x892000_g_ScriptId,"V� h�n thuy�t minh",8,888)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x892000_OnDefaultEvent( sceneId, selfId,targetId )
	x892000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x892000_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x892000_g_eventList do
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
			AddNumText(sceneId,x892000_g_ScriptId,"V� H�n",6,666)
			AddNumText(sceneId,x892000_g_ScriptId,"L�m sao c� V� H�n",6,667)
			AddNumText(sceneId,x892000_g_ScriptId,"L�m sao th�ng c�p V� H�n",6,668)
			AddNumText(sceneId,x892000_g_ScriptId,"L�m th� n�o ��t ���c V� H�n t߽ng quan ��o c�",6,669)
			AddNumText(sceneId,x892000_g_ScriptId,"Gi�i thi�u m� r�ng thu�c t�nh V� H�n",6,670)
			AddNumText(sceneId,x892000_g_ScriptId,"Gi�i thi�u V� H�n c�m tinh",6,671)
			--AddNumText(sceneId,x892000_g_ScriptId,"C�m tinh t߽ng kh�c",6,672)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 666 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"Kh�ng bi�t qua bao nhi�u n�m, Trung Nguy�n v� l�m g�p ���c m�t h�i h�o ki�p, � c߶ng ��i k� th� b�n ngo�i ph�a tr߾c, ch� t�n v� h�n r�t c�c th�c t�nh, bi�n �o ph�n th�n tr� th�nh thi�n thi�n v�n v�n c�i v� h�n th� h� tu�i tr� hi�p s�, tr� th�nh �ng sinh c�ng t�. N�u ng߽i may m�n chi�m ���c b�o v�t, ng߽i s� ��t ���c n�ng l�c to�n di�n m� r�ng c�ng t�ng l�n, cho ng߽i ��t t�i tr߾c nay ch�a c� t�n c�nh gi�i!")
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 667 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8fNh� th� n�o ��t ���c v� h�n:#r #W � #G t� tuy�t trang #W b�n sao trung �� b�i BOSS, c� nh�t �nh t� l� ��t ���c #R v� h�n: Ng� dao b�n #W.")
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 668 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8fTh�ng c�p V� H�n:#r #WS� d�ng #G3 #GH�n B�ng Ch�u #Wc�p b�c t߽ng �ng � ti�n h�nh th�ng c�p. V� H�n sau khi th�ng c�p #RThu�c t�nh#W, #RGi� tr� thu�c t�nh V� H�n m� r�ng.")
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 669 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f#rNh� th� n�o ��t ���c v� h�n t߽ng quan ��o c�:#r#YC� th� � T� Tuy�t Trang � ki�m ��o c� th�ng c�p V� H�n.")
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 670 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8fGi�i thi�u m� r�ng thu�c t�nh V� H�n:#r #WS� d�ng V� H�n D�ch T߽ng �an, V� H�n t� �ng ��t ���c m�t c�i �i �ng c�m tinh m� r�ng thu�c t�nh #GGi�m kh�ng#W. V� h�n c�p b�c c�ng cao, m� r�ng thu�c t�nh gi� tr� c�ng l�n. C�ng nhi�u  m� r�ng thu�c t�nh �em t�ng b߾c �i m�i m� ra.")
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 671 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8fGi�i thi�u V� H�n c�m tinh:#r#Y Nh� th� n�o ��t ���c c�m tinh: #r#WS� d�ng #GV� H�n D�ch T߽ng �an #W� ti�n h�nh c�m tinh. V� H�n c�m tinh c� b�ng, h�a, huy�n, �c 4 lo�i. C� th� t� do l�a ch�n m�t lo�i, nh�ng v� h�n �� c�m tinh, kh�ng th� �i m�i c�m tinh.")
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 672 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#Y�������Ч��:����#r#W������˵�����Ч������һ���̶����ܵ����ȼ���Ӱ�졣#r������ʹA��B������ҷֱ�װ����������꣬A��ҵ�������B��ҵ���ꡣ���A��ҵ����ϳɵȼ�����B��ҵ����ȼ����˺��Ŵ�Ч���������ԣ����A��ҵ����ȼ�����B��ҵ����ȼ����˺��Ŵ�Ч��������������")
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 7 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"Mu�n Th�ng c�p V� H�n, tr߾c h�t �em v� h�n #GCh� nh�p ch�c t߽ng#W, v� nh� th� n�o v� v� h�n Ch� nh�p ch�c t߽ng, ng߽i c� th� t�m ti�u � nhi #GV� аng #Wgi�p ng߽i.")
			AddText(sceneId,"Th�ng c�p V� H�n #Gl�n h�n 3#W, �n L� Th߽ng H�i ch� ti�n h�nh Th�ng c�p V� H�n c�p cao.")
			AddText(sceneId,"#r#c00ffff(Thao t�c Th�ng c�p V� H�n ph�i th�o g� b�o th�ch to�n b� xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")

			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - B�ng",6,12)
			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - H�a",6,13)
			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - Huy�n",6,14)
			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - еc",6,15)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 8 then  --������
		BeginEvent(sceneId)
			AddText(sceneId,"Ch� c� V� H�n #Gc�p 1 h�n #Wm�i c� th� l�nh ng� k� n�ng, v� h�n k� n�ng c�ng chia l�m ba c�p b�c, �u c� ���c t� ch�c t߽ng k� n�ng, c�ng c�n th�ng qua t߽ng �ng #GV� H�n k� n�ng th� #Wc�ng mang theo t߽ng �ng #Rc�p b�c #Wc�ng t߽ng �ng #RCh�c T߽ng #Wv� h�n t�i kh� l�nh ng�.")
			AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� V� H�n k� n�ng (C�p 1)",6,16)
			AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� V� H�n k� n�ng (C�p 2)",6,17)
			AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� V� H�n k� n�ng (C�p 3)",6,18)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 9 then   --�����չ����
		BeginEvent(sceneId)
			AddText(sceneId,"Ch� c� V� H�n #Gc�p 1 h�n #Wm�i c� th� l�nh ng� k� n�ng, v� h�n k� n�ng c�ng chia l�m ba c�p b�c, �u c� ���c t� ch�c t߽ng k� n�ng, c�ng c�n th�ng qua t߽ng �ng #GV� H�n k� n�ng th� #Wc�ng mang theo t߽ng �ng #Rc�p b�c #Wc�ng t߽ng �ng #RCh�c T߽ng #Wv� h�n t�i kh� l�nh ng�.")
			AddNumText(sceneId,x892000_g_ScriptId,"M� r�ng thu�c t�nh V� H�n (C�p 0)",6,19)
			AddNumText(sceneId,x892000_g_ScriptId,"M� r�ng thu�c t�nh V� H�n (C�p 1)",6,20)
			AddNumText(sceneId,x892000_g_ScriptId,"M� r�ng thu�c t�nh V� H�n (C�p 2)",6,21)
			AddNumText(sceneId,x892000_g_ScriptId,"M� r�ng thu�c t�nh V� H�n (C�p 3)",6,22)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
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
			AddNumText(sceneId,x892000_g_ScriptId,"#{FBSJ_090311_03}",6,26)
			AddNumText(sceneId,x892000_g_ScriptId,"#{FBSJ_090311_04}",6,27)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 12 then                   --���� �� �ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#{WH_NPC_3}")
			AddText(sceneId,"#r#c00ffff(Thao t�c Th�ng c�p V� H�n ph�i th�o g� b�o th�ch to�n b� xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")
			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - B�ng (C�p 1)",6,23)
			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - B�ng (C�p 2)",6,24)
			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - B�ng (C�p 3)",6,25)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 13 then                   --���� �� �ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"#{WH_NPC_5}")
			AddText(sceneId,"#r#c00ffff(Thao t�c Th�ng c�p V� H�n ph�i th�o g� b�o th�ch to�n b� xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")
			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - H�a (C�p 1)",6,26)
			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - H�a (C�p 2)",6,27)
			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - H�a (C�p 3)",6,28)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 130 then
		x892000_OnDefaultEvent( sceneId, selfId,targetId )
	elseif NumText == 14 then
		BeginEvent(sceneId)
			AddText(sceneId,"Mu�n th�ng c�p #RNg� Dao B�n - Huy�n#W, c�n s� d�ng #G3#W c�i #GH�n B�ng Ch�u #Wm�i ���c.#r T�ng l�n t�i (C�p 1) c�n #G3 #RH�n B�ng Ch�u (C�p 1)#r#W t�ng l�n t�i (C�p 2) c�n #G3 #RH�n B�ng Ch�u (C�p 2)#r#W t�ng l�n t�i (C�p 3) c�n #G3 #RH�n B�ng Ch�u (C�p 3)")
			AddText(sceneId,"#r#c00ffff(Thao t�c Th�ng c�p V� H�n ph�i th�o g� b�o th�ch to�n b� xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")
			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - Huy�n (C�p 1)",6,29)
			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - Huy�n (C�p 2)",6,30)
			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - Huy�n (C�p 3)",6,31)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 15 then
		BeginEvent(sceneId)
			AddText(sceneId,"Mu�n th�ng c�p #RNg� Dao B�n - еc#W, c�n s� d�ng #G3#W c�i #GH�n B�ng Ch�u #Wm�i ���c.#r T�ng l�n t�i (C�p 1) c�n #G3 #RH�n B�ng Ch�u (C�p 1)#r#W t�ng l�n t�i (C�p 2) c�n #G3 #RH�n B�ng Ch�u (C�p 2)#r#W t�ng l�n t�i (C�p 3) c�n #G3 #RH�n B�ng Ch�u (C�p 3)")
			AddText(sceneId,"#r#c00ffff(Thao t�c Th�ng c�p V� H�n ph�i th�o g� b�o th�ch to�n b� xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")
			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - еc (C�p 1)",6,32)
			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - еc (C�p 2)",6,33)
			AddNumText(sceneId,x892000_g_ScriptId,"T�ng l�n Ng� Dao B�n - еc (C�p 3)",6,34)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 16 then
		BeginEvent(sceneId)
			AddText(sceneId,"Ch� c� V� H�n #Gc�p 1 h�n #Wm�i c� th� l�nh ng� k� n�ng, v� h�n k� n�ng c�ng chia l�m ba c�p b�c, �u c� ���c t� ch�c t߽ng k� n�ng, c�ng c�n th�ng qua t߽ng �ng #GV� H�n k� n�ng th� #Wc�ng mang theo t߽ng �ng #Rc�p b�c #Wc�ng t߽ng �ng #RCh�c T߽ng #Wv� h�n t�i kh� l�nh ng�.")
			AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� k�ch - H�n B�ng",6,35)
			AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� k�ch - S� Di�m",6,36)
			AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� k�ch - Th߽ng Huy�n",6,37)
			AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� k�ch - Sang еc",6,38)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 17 then
		BeginEvent(sceneId)
			AddText(sceneId,"Ch� c� V� H�n #Gc�p 1 h�n #Wm�i c� th� l�nh ng� k� n�ng, v� h�n k� n�ng c�ng chia l�m ba c�p b�c, �u c� ���c t� ch�c t߽ng k� n�ng, c�ng c�n th�ng qua t߽ng �ng #GV� H�n k� n�ng th� #Wc�ng mang theo t߽ng �ng #Rc�p b�c #Wc�ng t߽ng �ng #RCh�c T߽ng #Wv� h�n t�i kh� l�nh ng�.")
			AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� ph� - Ng�ng B�ng",6,39)
			AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� ph� - Li�t Vi�m",6,40)
			AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� ph� - L�c Huy�n",6,41)
			AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� ph� - Th� еc",6,42)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 18 then
		BeginEvent(sceneId)
			AddText(sceneId,"Ch� c� V� H�n #Gc�p 1 h�n #Wm�i c� th� l�nh ng� k� n�ng, v� h�n k� n�ng c�ng chia l�m ba c�p b�c, �u c� ���c t� ch�c t߽ng k� n�ng, c�ng c�n th�ng qua t߽ng �ng #GV� H�n k� n�ng th� #Wc�ng mang theo t߽ng �ng #Rc�p b�c #Wc�ng t߽ng �ng #RCh�c T߽ng #Wv� h�n t�i kh� l�nh ng�.")
			AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� b�o - Th�i B�ng",6,43)
			AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� b�o - L�m H�a",6,44)
			AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� b�o - Tr�ng Huy�n",6,45)
			AddNumText(sceneId,x892000_g_ScriptId,"L�nh ng� b�o - K�ch еc",6,46)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 19 then
		BeginEvent(sceneId)
			AddText(sceneId,"M�i l�a ch�n thu�c t�nh m� r�ng!")
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 0 (B�ng) m� r�ng thu�c t�nh",6,47)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 0 (H�a) m� r�ng thu�c t�nh",6,48)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 0 (Huy�n) m� r�ng thu�c t�nh",6,49)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 0 (еc) m� r�ng thu�c t�nh",6,50)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 20 then
		BeginEvent(sceneId)
			AddText(sceneId,"M�i l�a ch�n thu�c t�nh m� r�ng!")
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 1 (B�ng) m� r�ng thu�c t�nh",6,51)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 1 (H�a) m� r�ng thu�c t�nh",6,52)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 1 (Huy�n) m� r�ng thu�c t�nh",6,53)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 1 (еc) m� r�ng thu�c t�nh",6,54)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 21 then
		BeginEvent(sceneId)
			AddText(sceneId,"M�i l�a ch�n thu�c t�nh m� r�ng!")
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 2 (B�ng) m� r�ng thu�c t�nh",6,55)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 2 (H�a) m� r�ng thu�c t�nh",6,56)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 2 (Huy�n) m� r�ng thu�c t�nh",6,57)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 2 (еc) m� r�ng thu�c t�nh",6,58)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 22 then
		BeginEvent(sceneId)
			AddText(sceneId,"M�i l�a ch�n thu�c t�nh m� r�ng!")
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 3 (B�ng) m� r�ng thu�c t�nh",6,59)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 3 (H�a) m� r�ng thu�c t�nh",6,60)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 3 (Huy�n) m� r�ng thu�c t�nh",6,61)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h�n c�p 3 (еc) m� r�ng thu�c t�nh",6,62)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 23 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156102)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910012)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156102,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910012,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156106, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi�m tra tay n�i xem �� c� V� H�n v� 3 H�n B�ng Ch�u hay kh�ng, n�u thi�u th� s� kh�ng th� th�ng c�p V� H�n!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 24 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156106)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910013)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156106,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910013,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156110, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi�m tra tay n�i xem �� c� V� H�n v� H�n B�ng Ch�u hay kh�ng, n�u thi�u th� s� kh�ng th� th�ng c�p V� H�n!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 25 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156110)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910014)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156110,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910014,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156114, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi�m tra tay n�i xem �� c� V� H�n v� H�n B�ng Ch�u hay kh�ng, n�u thi�u th� s� kh�ng th� th�ng c�p V� H�n!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 26 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156103)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910012)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156103,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910012,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156107, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi�m tra tay n�i xem �� c� V� H�n v� H�n B�ng Ch�u hay kh�ng, n�u thi�u th� s� kh�ng th� th�ng c�p V� H�n!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 27 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156107)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910013)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156107,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910013,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156111, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi�m tra tay n�i xem �� c� V� H�n v� H�n B�ng Ch�u hay kh�ng, n�u thi�u th� s� kh�ng th� th�ng c�p V� H�n!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 28 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156111)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910014)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156111,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910014,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156115, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi�m tra tay n�i xem �� c� V� H�n v� H�n B�ng Ch�u hay kh�ng, n�u thi�u th� s� kh�ng th� th�ng c�p V� H�n!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 29 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156104)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910012)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156104,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910012,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156108, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi�m tra tay n�i xem �� c� V� H�n v� H�n B�ng Ch�u hay kh�ng, n�u thi�u th� s� kh�ng th� th�ng c�p V� H�n!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 30 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156108)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910013)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156108,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910013,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156112, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi�m tra tay n�i xem �� c� V� H�n v� H�n B�ng Ch�u hay kh�ng, n�u thi�u th� s� kh�ng th� th�ng c�p V� H�n!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 31 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156112)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910014)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156112,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910014,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156116, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi�m tra tay n�i xem �� c� V� H�n v� H�n B�ng Ch�u hay kh�ng, n�u thi�u th� s� kh�ng th� th�ng c�p V� H�n!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 32 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156105)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910012)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156105,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910012,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156109, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi�m tra tay n�i xem �� c� V� H�n v� H�n B�ng Ch�u hay kh�ng, n�u thi�u th� s� kh�ng th� th�ng c�p V� H�n!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 33 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156109)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910013)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156109,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910013,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156113, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi�m tra tay n�i xem �� c� V� H�n v� H�n B�ng Ch�u hay kh�ng, n�u thi�u th� s� kh�ng th� th�ng c�p V� H�n!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 34 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156113)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910014)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156113,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910014,3)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156117, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi�m tra tay n�i xem �� c� V� H�n v� H�n B�ng Ch�u hay kh�ng, n�u thi�u th� s� kh�ng th� th�ng c�p V� H�n!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 35 then
		c0 = GetItemCount(sceneId, selfId, 10156106)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910017)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1700) > 0  then
		          strNotice = "#YNg߽i �� h�c k� n�ng n�y r�i!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
			AddSkill(  sceneId, selfId, 1700)
			LuaFnDelAvailableItem(sceneId,selfId,39910017,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, l�nh ng� k� n�ng v� h�n th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� l�nh ng� k� n�ng v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 36 then
		c0 = GetItemCount(sceneId, selfId, 10156107)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910018)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1701) > 0  then
		          strNotice = "#YNg߽i �� h�c k� n�ng n�y r�i!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
			AddSkill(  sceneId, selfId, 1701)
			LuaFnDelAvailableItem(sceneId,selfId,39910018,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, l�nh ng� k� n�ng v� h�n th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� l�nh ng� k� n�ng v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 37 then
		c0 = GetItemCount(sceneId, selfId, 10156108)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910019)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1702) > 0  then
		          strNotice = "#YNg߽i �� h�c k� n�ng n�y r�i!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
			AddSkill(  sceneId, selfId, 1702)
			LuaFnDelAvailableItem(sceneId,selfId,39910019,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, l�nh ng� k� n�ng v� h�n th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� l�nh ng� k� n�ng v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 38 then
		c0 = GetItemCount(sceneId, selfId, 10156109)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910020)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1703) > 0  then
		          strNotice = "#YNg߽i �� h�c k� n�ng n�y r�i!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
			AddSkill(  sceneId, selfId, 1703)
			LuaFnDelAvailableItem(sceneId,selfId,39910020,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, l�nh ng� k� n�ng v� h�n th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� l�nh ng� k� n�ng v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 39 then
		c0 = GetItemCount(sceneId, selfId, 10156110)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910021)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1704) > 0  then
		          strNotice = "#YNg߽i �� h�c k� n�ng n�y r�i!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1700) > 0  then
			   DelSkill(sceneId, selfId, 1700)
		      end
			AddSkill(  sceneId, selfId, 1704)
			LuaFnDelAvailableItem(sceneId,selfId,39910021,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, l�nh ng� k� n�ng v� h�n th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� l�nh ng� k� n�ng v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 40 then
		c0 = GetItemCount(sceneId, selfId, 10156111)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910022)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1705) > 0  then
		          strNotice = "#YNg߽i �� h�c k� n�ng n�y r�i!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1701) > 0  then
			   DelSkill(sceneId, selfId, 1701)
		      end
			AddSkill(  sceneId, selfId, 1705)
			LuaFnDelAvailableItem(sceneId,selfId,39910022,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, l�nh ng� k� n�ng v� h�n th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� l�nh ng� k� n�ng v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 41 then
		c0 = GetItemCount(sceneId, selfId, 10156112)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910023)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1706) > 0  then
		          strNotice = "#YNg߽i �� h�c k� n�ng n�y r�i!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1702) > 0  then
			   DelSkill(sceneId, selfId, 1702)
		      end
			AddSkill(  sceneId, selfId, 1706)
			LuaFnDelAvailableItem(sceneId,selfId,39910023,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, l�nh ng� k� n�ng v� h�n th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� l�nh ng� k� n�ng v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 42 then
		c0 = GetItemCount(sceneId, selfId, 10156113)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910024)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1707) > 0  then
		          strNotice = "#YNg߽i �� h�c k� n�ng n�y r�i!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1703) > 0  then
			   DelSkill(sceneId, selfId, 1703)
		      end
			AddSkill(  sceneId, selfId, 1707)
			LuaFnDelAvailableItem(sceneId,selfId,39910024,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, l�nh ng� k� n�ng v� h�n th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� l�nh ng� k� n�ng v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 43 then
		c0 = GetItemCount(sceneId, selfId, 10156114)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910025)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1708) > 0  then
		          strNotice = "#YNg߽i �� h�c k� n�ng n�y r�i!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1704) > 0  then
			   DelSkill(sceneId, selfId, 1704)
		      end
			AddSkill(  sceneId, selfId, 1708)
			LuaFnDelAvailableItem(sceneId,selfId,39910025,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, l�nh ng� k� n�ng v� h�n th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� l�nh ng� k� n�ng v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 44 then
		c0 = GetItemCount(sceneId, selfId, 10156115)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910026)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1709) > 0  then
		          strNotice = "#YNg߽i �� h�c k� n�ng n�y r�i!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1705) > 0  then
			   DelSkill(sceneId, selfId, 1705)
		      end
			AddSkill(  sceneId, selfId, 1709)
			LuaFnDelAvailableItem(sceneId,selfId,39910026,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, l�nh ng� k� n�ng v� h�n th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� l�nh ng� k� n�ng v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 45 then
		c0 = GetItemCount(sceneId, selfId, 10156116)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910027)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1710) > 0  then
		          strNotice = "#YNg߽i �� h�c k� n�ng n�y r�i!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1706) > 0  then
			   DelSkill(sceneId, selfId, 1706)
		      end
			AddSkill(  sceneId, selfId, 1710)
			LuaFnDelAvailableItem(sceneId,selfId,39910027,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, l�nh ng� k� n�ng v� h�n th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� l�nh ng� k� n�ng v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 46 then
		c0 = GetItemCount(sceneId, selfId, 10156117)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910028)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1711) > 0  then
		          strNotice = "#YNg߽i �� h�c k� n�ng n�y r�i!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1707) > 0  then
			   DelSkill(sceneId, selfId, 1707)
		      end
			AddSkill(  sceneId, selfId, 1711)
			LuaFnDelAvailableItem(sceneId,selfId,39910028,1)--ɾ����Ʒ
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, l�nh ng� k� n�ng v� h�n th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� l�nh ng� k� n�ng v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 47 then
		c0 = GetItemCount(sceneId, selfId, 10156102)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25000, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 48 then
		c0 = GetItemCount(sceneId, selfId, 10156103)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25001, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 49 then
		c0 = GetItemCount(sceneId, selfId, 10156104)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25002, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 50 then
		c0 = GetItemCount(sceneId, selfId, 10156105)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25003, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 51 then
		c0 = GetItemCount(sceneId, selfId, 10156106)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25008, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 52 then
		c0 = GetItemCount(sceneId, selfId, 10156107)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25009, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 53 then
		c0 = GetItemCount(sceneId, selfId, 10156108)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25010, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 54 then
		c0 = GetItemCount(sceneId, selfId, 10156109)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25011, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 55 then
		c0 = GetItemCount(sceneId, selfId, 10156110)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25016, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 56 then
		c0 = GetItemCount(sceneId, selfId, 10156111)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25017, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 57 then
		c0 = GetItemCount(sceneId, selfId, 10156112)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25018, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 58 then
		c0 = GetItemCount(sceneId, selfId, 10156113)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25019, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 59 then
		c0 = GetItemCount(sceneId, selfId, 10156114)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25024, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 60 then
		c0 = GetItemCount(sceneId, selfId, 10156115)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25025, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 61 then
		c0 = GetItemCount(sceneId, selfId, 10156116)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25026, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 62 then
		c0 = GetItemCount(sceneId, selfId, 10156117)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25027, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh�c m�ng ng߽i, v� h�n m� r�ng thu�c t�nh th�nh c�ng!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi�u nguy�n li�u, kh�ng th� m� r�ng thu�c t�nh v� h�n!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x892000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892000_g_eventList do
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
function x892000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x892000_g_eventList do
		if missionScriptId == findId then
			x892000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x892000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x892000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x892000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x892000_OnDie( sceneId, selfId, killerId )
end




--**********************************
--�ж��Ƿ��ܹ�ѧϰ
--nSkillIndex��������ֵΪ��40��70��90���ֱ�ѧϰ��Ӧ����ļ���
--**********************************
function x892000_CheckStudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж��Ƿ��Ѿ�ѧ���˶�Ӧ����
	if  (HaveSkill(sceneId, selfId, x892000_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж���������Ƿ����㹻��Ǯ
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892000_g_DarkSkillName[nSkillIndex].needmoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	return 1;
	
end

--**********************************
--�����NPCѧϰ����ʹ�ü���
--nSkillIndex��������ֵΪ��40��70��90���ֱ�ѧϰ��Ӧ����ļ���
--**********************************
function x892000_StudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж��Ƿ��Ѿ�ѧ���˶�Ӧ����
	if  (HaveSkill(sceneId, selfId, x892000_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж���������Ƿ����㹻��Ǯ
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892000_g_DarkSkillName[nSkillIndex].needmoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return
	end
	
	--�����ж϶�ͨ�������Կ�Ǯ��������
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, x892000_g_DarkSkillName[nSkillIndex].needmoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	AddSkill(  sceneId, selfId, x892000_g_DarkSkillName[nSkillIndex].id)
	x892000_ShowNotice(sceneId, selfId, targetId, x892000_g_DarkSkillTips[nSkillIndex]);
	x892000_NotifyTips( sceneId, selfId, x892000_g_DarkSkillTips[nSkillIndex] )
	
	x892000_StudySkillImpact(sceneId, selfId)
	DarkOperateResult(sceneId, selfId, 5, 1);    --�ü��ܰ�ť��˸
	
end


--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x892000_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
--����Ƿ����㰵��ƿ������
--����ֵ��0����1��1Ϊ���㣬0
--**********************************
function x892000_CheckDarkReachPoint(sceneId, selfId, targetId)
		
		local strInfo = "";
		--�ж���������Ƿ�װ���а���
		local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
		if ( bHaveDarkEquip ~= 1) then
			strInfo = "#{FBSJ_081209_13}";
			x892000_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж�������ϰ����Ƿ�ﵽƿ��
		local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
		if (bNeedNPC ~= 1) then
			strInfo = "#{FBSJ_081209_14}";
			x892000_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж���ҵȼ��Ƿ�Ͱ����ȼ���Ȼ���û�а����ȼ���
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nCharLevel = GetLevel(sceneId, selfId);
		if (nDarkLevel >= nCharLevel) then
			strInfo = "#{FBSJ_081209_15}";
			x892000_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж���������Ƿ����㹻��Ǯ
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nNeedMoney = x892000_g_DarkBreachPointNeedMoney[nDarkLevel];
		if (nNeedMoney == nil or nNeedMoney <= 0) then
			nNeedMoney = 100000;         --�Է���һ����ûʲô��
		end
		local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
		if (nHaveMoney < nNeedMoney) then    --10��
			strNotice = "#{FBSJ_081209_25}";
			x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			return 0;
		end
				
		return 1;
end


function x892000_BreachDarkPoint(sceneId, selfId, targetId)

	local strInfo = "";
	--�ж���������Ƿ�װ���а���
	local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
	if ( bHaveDarkEquip ~= 1) then
		strInfo = "#{FBSJ_081209_13}";
		x892000_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--�ж�������ϰ����Ƿ�ﵽƿ��
	local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
	if (bNeedNPC ~= 1) then
		strInfo = "#{FBSJ_081209_14}";
		x892000_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--�ж���ҵȼ��Ƿ�Ͱ����ȼ���Ȼ���û�а����ȼ���
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nCharLevel = GetLevel(sceneId, selfId);
	if (nDarkLevel >= nCharLevel) then
		strInfo = "#{FBSJ_081209_15}";
		x892000_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
			--�ж���������Ƿ����㹻��Ǯ
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nNeedMoney = x892000_g_DarkBreachPointNeedMoney[nDarkLevel];
	if (nNeedMoney == nil or nNeedMoney <= 0) then
		nNeedMoney = 100000;         --�Է���һ����ûʲô��
	end
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < nNeedMoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�����ж϶�ͨ�������Կ�Ǯͻ����
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--ͻ��ƿ�����ð�������
	local bDarkLevelup = DarkLevelUp(sceneId, selfId);
	if (bDarkLevelup == 1) then
		x892000_ShowNotice(sceneId, selfId, targetId, "#{FBSJ_081209_18}");
		--ͻ�Ƴɹ�����¼ͳ����־
			local guid = LuaFnObjId2Guid(sceneId, selfId);
			local sLog = format("dark level now: %d", nDarkLevel + 1); 
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_ANQITUPO, guid, sLog);
	else
		x892000_ShowNotice(sceneId, selfId, targetId, "еt ph� th�t b�i");
	end
	
	return
end

function x892000_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x892000_StudySkillImpact(sceneId, playerId)
	--��ʾѧϰ���¼��ܵ���Ч Ŀǰʹ��������Ч
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end
