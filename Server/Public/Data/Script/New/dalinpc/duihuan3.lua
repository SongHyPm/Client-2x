-- 990004 ��װ�һ�NPC


--�ű���
x990004_g_ScriptId = 990004

--��ӵ�е��¼�ID�б�
x990004_g_eventList={}

x990004_g_EquipList={	
-- ��¥��
{n=110,id=10422016},

-- ��¥��
{n=120,id=10423024},

-- �ֻ�
{n=130,id=40004431},

-- �������
{n=410,id=10433411},{n=411,id=10433412},{n=412,id=10433413},{n=413,id=10433414},{n=414,id=10433415},
{n=415,id=10433416},{n=416,id=10433417},{n=417,id=10433418},{n=418,id=10433419},{n=419,id=10433420},

-- 85���ػ���
{n=510,id=10400075},{n=511,id=10402075},{n=512,id=10404072},{n=513,id=10405071},{n=514,id=10412081},
{n=515,id=10412083},{n=516,id=10413084},{n=517,id=10413086},{n=518,id=10422122},{n=519,id=10422124},
{n=520,id=10423047},{n=521,id=10423049},

--ɱ����
{n=610,id=10433421},{n=620,id=10433422},{n=630,id=10433423},{n=640,id=10433424},{n=650,id=10433425},
{n=660,id=10433426},{n=670,id=10433427},{n=680,id=10433428},{n=690,id=10433429},{n=699,id=10433430},

--�������
{n=711,id=10433306},{n=712,id=10433321},{n=713,id=10433336},{n=714,id=10433345},{n=715,id=10433327},
{n=721,id=10433307},{n=722,id=10433322},{n=723,id=10433337},{n=724,id=10433328},{n=725,id=10433346}, 
{n=731,id=10433309},{n=732,id=10433324},{n=733,id=10433339},{n=734,id=10433348},{n=735,id=10433330},
{n=741,id=10433308},{n=742,id=10433323},{n=743,id=10433338},{n=744,id=10433347},{n=745,id=10433329},
{n=751,id=10433305},{n=752,id=10433320},{n=753,id=10433335},{n=754,id=10433344},{n=755,id=10433326},
{n=761,id=10433304},{n=762,id=10433319},{n=763,id=10433334},{n=764,id=10433343},{n=765,id=10433325},

}

x990004_g_StoneList={
-- ��¥֮��
{n=1,id=30505157,num=50,str="��¥֮��"},
-- ��¥֮â
{n=2,id=30505158,num=50,str="��¥֮â"},
-- �����
{n=3,id=20310020,num=20,str="�����"},
-- �����
{n=4,id=20310020,num=100,str="�����"},
-- �ػ���
{n=5,id=20310004,num=150,str="�ػ���"},
-- ������Ƭ
{n=6,id=30505090,num=50,str="������Ƭ"},
-- �˻�
{n=7,id=30505085,num=50,str="�˻�"},
-- ��
{n=8,id=30505086,num=50,str="��"},
-- ��ӧ
{n=9,id=30505087,num=100,str="��ӧ"},
-- ����
{n=10,id=30505088,num=50,str="����"},
-- ����
{n=11,id=30505089,num=50,str="����"},
-- ħ��
{n=12,id=30505091,num=50,str="ħ��"},
--������
{n=13,id=10433411,num=5,str="����#Yͷ��"},
{n=14,id=10433412,num=5,str="����#Yսѥ"},
{n=15,id=10433413,num=5,str="����#Yս��"},
{n=16,id=10433414,num=5,str="����#Yս��"},
{n=17,id=10433415,num=5,str="����#Y�ػ�"},
{n=18,id=10433416,num=5,str="����#Y֮��"},
{n=19,id=10433417,num=5,str="����#Y����"},
{n=20,id=10433418,num=5,str="����#Y֮��"},
{n=21,id=10433419,num=5,str="����#Y����"},
{n=22,id=10433420,num=5,str="����#Yս��"},
}

--**********************************
--�¼��б�
--**********************************
function x990004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  #gFF3E96����װ���ϳ�ϵͳ")
		for i, eventId in x990004_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		--AddNumText( sceneId, x990004_g_ScriptId, "�������˵��", 6, 99 )
		--AddNumText( sceneId, x990004_g_ScriptId, "#gFF8C00�һ���¥", 3, 100 )
		--AddNumText( sceneId, x990004_g_ScriptId, "#gFF8C00��¥��Ч", 3, 200 )
		--AddNumText( sceneId, x990004_g_ScriptId, "#gFF8C00��Ա��װ", 3, 300 )
		AddNumText( sceneId, x990004_g_ScriptId, "�����׺ϳ�ɱ����", 1, 600 )
		--AddNumText( sceneId, x990004_g_ScriptId, "�����������", 1, 700 )
		--AddNumText( sceneId, x990004_g_ScriptId, "#gFF6A6A��ȡ��������", 3, 800 )
		AddNumText( sceneId, x990004_g_ScriptId, "�뿪����", 13, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x990004_OnDefaultEvent( sceneId, selfId,targetId )
	x990004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x990004_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	if nNumText == 0  then
		-- �رմ���
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	if nNumText == 99 then
		BeginEvent(sceneId)
			AddText(sceneId, "  �������˵�������Ǹ��󸱱���BOSS��������總�ӱ��乥������總�ӻ��乥����ħ�總�����乥�������總��ʧ�����ܣ��ɽ總�����������������Ч�����˽總��ʯ�����ܣ�ʯ���󲻿ɱ������������乥����������20%��ʧ����ʯ������2%���뿴�����ú�ѡ���������������ֻ�ں�����1Сʱ�ڿ��Ŷһ�")		
	end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	if nNumText == 100 or nNumText == 200 or nNumText == 300 or nNumText == 400 or nNumText == 500 or nNumText == 600 or nNumText == 700 or nNumText == 710 or nNumText == 720 or nNumText == 730 or nNumText == 740 or nNumText == 750 or nNumText == 760 then
		BeginEvent(sceneId)
			AddText(sceneId, "  ��ѡ��һ����Ҫ�ҵľ��岿λ")
			if nNumText == 100 then
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF3E96�һ���¥��", 1, nNumText+10)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF3E96�һ���¥��", 1, nNumText+20)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF3E96�һ��ֻ����", 1, nNumText+30)
			end
			if nNumText == 200 then
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF3E96��¥��״̬", 4, nNumText+10)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF3E96��¥��״̬", 4, nNumText+11)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF3E96�����״̬", 4, nNumText+12)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF3E96��֮��״̬", 4, nNumText+13)
                    AddNumText(sceneId, x990004_g_ScriptId, "#gFF3E96����¥��״̬", 4, nNumText+14)
                    AddNumText(sceneId, x990004_g_ScriptId, "#gFF3E96�¡���¥�䡷״̬", 4, nNumText+15)
                    AddNumText(sceneId, x990004_g_ScriptId, "#gFF3E96�¡���¥��״̬", 4, nNumText+16)
			end
			if nNumText == 300 then
   			AddNumText( sceneId, x990004_g_ScriptId, "#gFF3E96�һ��������", 1, 400)
			--AddNumText( sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ��ػ���װ��85����", 1, 500)
			end
			if nNumText == 400 then
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ�#ccc33cc����#Yͷ��", 1, nNumText+10)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ�#ccc33cc����#Yսѥ", 1, nNumText+11)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ�#ccc33cc����#Yս��", 1, nNumText+12)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ�#ccc33cc����#Yս��", 1, nNumText+13)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ�#ccc33cc����#Y�ػ�", 1, nNumText+14)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ�#ccc33cc����#Y֮��", 1, nNumText+15)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ�#ccc33cc����#Y����", 1, nNumText+16)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ�#ccc33cc����#Y֮��", 1, nNumText+17)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ�#ccc33cc����#Y����", 1, nNumText+18)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ�#ccc33cc����#Yս��", 1, nNumText+19)
			end
			if nNumText == 500 then
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ��ػꡤĩ�ա�������", 1, nNumText+10)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ��ػꡤѪҹ�����̡�", 1, nNumText+11)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ��ػꡤ�ݺ᡾�ȡ�", 1, nNumText+12)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ��ػꡤ��ޡ�����", 1, nNumText+13)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ��ػꡤ�������ס�", 1, nNumText+14)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ��ػꡤ�ơ����ס�", 1, nNumText+15)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ��ػꡤ�ա��·���", 1, nNumText+16)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ��ػꡤ�䡾�·���", 1, nNumText+17)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ��ػꡤ�á���ָ��", 1, nNumText+18)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ��ػꡤ�롾��ָ��", 1, nNumText+19)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ��ػꡤİ��������", 1, nNumText+20)
			AddNumText(sceneId, x990004_g_ScriptId, "#gFF6A6A#G�һ��ػꡤ�С�������", 1, nNumText+21)
			end				
			if nNumText == 600 then
   		AddNumText( sceneId, x990004_g_ScriptId, "����ͷ���ϳ�ɱ��ͷ��", 1, nNumText+10)
			AddNumText( sceneId, x990004_g_ScriptId, "����սѥ�ϳ�ɱ��սѥ", 1, nNumText+20)
			AddNumText( sceneId, x990004_g_ScriptId, "����ս�ֺϳ�ɱ��ս��", 1, nNumText+30)
			AddNumText( sceneId, x990004_g_ScriptId, "����ս�׺ϳ�ɱ��ս��", 1, nNumText+40)
			AddNumText( sceneId, x990004_g_ScriptId, "�����ػ��ϳ�ɱ���ػ�", 1, nNumText+50)
			AddNumText( sceneId, x990004_g_ScriptId, "����֮���ϳ�ɱ��֮��", 1, nNumText+60)
      AddNumText( sceneId, x990004_g_ScriptId, "���������ϳ�ɱ������", 1, nNumText+70)
			AddNumText( sceneId, x990004_g_ScriptId, "����֮��ϳ�ɱ��֮��", 1, nNumText+80)
			AddNumText( sceneId, x990004_g_ScriptId, "���ƻ����ϳ�ɱ�񻢷�", 1, nNumText+90)
			AddNumText( sceneId, x990004_g_ScriptId, "����ս��ϳ�ɱ��ս��", 1, nNumText+99)
			end
			if nNumText == 700 then
   			AddNumText( sceneId, x990004_g_ScriptId, "����������˽����", 1, 710)
			AddNumText( sceneId, x990004_g_ScriptId, "���������������", 1, 720)
			AddNumText( sceneId, x990004_g_ScriptId, "����������������", 1, 730)
			AddNumText( sceneId, x990004_g_ScriptId, "����������ɽ����", 1, 740)
			AddNumText( sceneId, x990004_g_ScriptId, "���������������", 1, 750)
			AddNumText( sceneId, x990004_g_ScriptId, "���������ħ�����", 1, 760)
			end	
			if nNumText == 710 then      -- �˽� 
   			AddNumText( sceneId, x990004_g_ScriptId, "�����������а������", 1, nNumText+1)
			AddNumText( sceneId, x990004_g_ScriptId, "���������̫�顾����", 1, nNumText+2)
			AddNumText( sceneId, x990004_g_ScriptId, "�����������ũ������", 1, nNumText+3)
			AddNumText( sceneId, x990004_g_ScriptId, "���������ִ�����", 1, nNumText+4)
			AddNumText( sceneId, x990004_g_ScriptId, "����������̹š�����", 1, nNumText+5)
			end	
			if nNumText == 720 then      -- ��� 
      		AddNumText( sceneId, x990004_g_ScriptId, "�����������Ӱ����", 1, nNumText+1)
			AddNumText( sceneId, x990004_g_ScriptId, "������������졾��", 1, nNumText+2)
			AddNumText( sceneId, x990004_g_ScriptId, "����������η衾��", 1, nNumText+3)
			AddNumText( sceneId, x990004_g_ScriptId, "�����������������", 1, nNumText+4)
			AddNumText( sceneId, x990004_g_ScriptId, "������������ޡ���", 1, nNumText+5)
			end	
			if nNumText == 730 then      -- �ɽ� 
      		AddNumText( sceneId, x990004_g_ScriptId, "������������졾ʥ��", 1, nNumText+1)
			AddNumText( sceneId, x990004_g_ScriptId, "�����������Ԫ��ʥ��", 1, nNumText+2)
			AddNumText( sceneId, x990004_g_ScriptId, "����������ϵ硾ʥ��", 1, nNumText+3)
			AddNumText( sceneId, x990004_g_ScriptId, "���������Ǭ����ʥ��", 1, nNumText+4)
			AddNumText( sceneId, x990004_g_ScriptId, "���������̫����ʥ��", 1, nNumText+5)
			end	
			if nNumText == 740 then      -- ���� 
      		AddNumText( sceneId, x990004_g_ScriptId, "����������ɻ꡾�硿", 1, nNumText+1)
			AddNumText( sceneId, x990004_g_ScriptId, "�����������ˡ��硿", 1, nNumText+2)
			AddNumText( sceneId, x990004_g_ScriptId, "����������ۺޡ��硿", 1, nNumText+3)
			AddNumText( sceneId, x990004_g_ScriptId, "������������񡾷硿", 1, nNumText+4)
			AddNumText( sceneId, x990004_g_ScriptId, "������������𡾷硿", 1, nNumText+5)
			end	
			if nNumText == 750 then      -- ��� 
      		AddNumText( sceneId, x990004_g_ScriptId, "����������쾧��ˮ��", 1, nNumText+1)
			AddNumText( sceneId, x990004_g_ScriptId, "������������ˮ��", 1, nNumText+2)
			AddNumText( sceneId, x990004_g_ScriptId, "������������¡�ˮ��", 1, nNumText+3)
			AddNumText( sceneId, x990004_g_ScriptId, "������������衾ˮ��", 1, nNumText+4)
			AddNumText( sceneId, x990004_g_ScriptId, "�����������緡�ˮ��", 1, nNumText+5)
			end	
			if nNumText == 760 then      -- ħ�� 
      		AddNumText( sceneId, x990004_g_ScriptId, "������������ǡ��ס�", 1, nNumText+1)
			AddNumText( sceneId, x990004_g_ScriptId, "����������������ס�", 1, nNumText+2)
			AddNumText( sceneId, x990004_g_ScriptId, "����������Ƶء��ס�", 1, nNumText+3)
			AddNumText( sceneId, x990004_g_ScriptId, "�����������ŭ���ס�", 1, nNumText+4)
			AddNumText( sceneId, x990004_g_ScriptId, "������������ޡ��ס�", 1, nNumText+5)
			end																			
			AddNumText( sceneId, x990004_g_ScriptId, "�뿪����", 0, 0 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText == 210 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10422016) >= 1  then
			bStoneOk = 1
		end
		
		if  bStoneOk == 0 then
			BeginEvent(sceneId)
				strText = "��û�д˵��ߣ�������ȡ״̬��"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else 
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5953, 0 )	
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText == 211 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10423024) >= 1  then
			bStoneOk = 1
		end
		
		if  bStoneOk == 0 then
			BeginEvent(sceneId)
				strText = "��û�д˵��ߣ�������ȡ״̬��"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else 
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5954, 0 )	
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText == 212 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10433325) >= 1  then
			bStoneOk = 1
		end
		
		if  bStoneOk == 0 then
			BeginEvent(sceneId)
				strText = "��û�д˵��ߣ�������ȡ״̬��"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else 
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5962, 0 )	
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end		

	if nNumText == 213 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10422098) >= 1  then
			bStoneOk = 1
		end
		
		if  bStoneOk == 0 then
			BeginEvent(sceneId)
				strText = "��û�д˵��ߣ�������ȡ״̬��"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else 
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5963, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 74, 0 )	
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
      
       if nNumText == 214 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10423025) >= 1  then
			bStoneOk = 1
		end
		
		if  bStoneOk == 0 then
			BeginEvent(sceneId)
				strText = "��û�д˵��ߣ�������ȡ״̬��"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else 
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5965, 0 )	
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

       if nNumText == 215 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10553099) >= 1  then
			bStoneOk = 1
		end
		
		if  bStoneOk == 0 then
			BeginEvent(sceneId)
				strText = "��û�д˵��ߣ�������ȡ״̬��"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else 
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5067, 0 )	
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end		
	
       if nNumText == 216 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10553100) >= 1  then
			bStoneOk = 1
		end
		
		if  bStoneOk == 0 then
			BeginEvent(sceneId)
				strText = "��û�д˵��ߣ�������ȡ״̬��"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else 
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5068, 0 )	
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end		
	if nNumText > 100 and nNumText < 800  then
		BeginEvent(sceneId)
			AddText(sceneId, "  ���ǰ׸��ģ����������������Ŷ����")
			
			local nLevel = 0
			if nNumText == 110 then    -- �һ���¥��
				nLevel = 1
			end
			if nNumText == 120 then    -- �һ���¥��
				nLevel = 2
			end
			if nNumText == 130 then    -- �һ��ֻ����
				nLevel = 3
			end			
--			if nNumText == 610 or nNumText == 611 or nNumText == 612 or nNumText == 613 or nNumText == 614 or nNumText == 615 or nNumText == 616 or nNumText == 617 or nNumText == 618 or nNumText == 619 or nNumText == 620 or nNumText == 621 then    -- ����һ�
			if nNumText > 400 then
				nLevel = 4
			end
--			if nNumText == 710 or nNumText == 711 or nNumText == 712 or nNumText == 713 or nNumText == 714 or nNumText == 715 or nNumText == 716 or nNumText == 717 or nNumText == 718 or nNumText == 719 or nNumText == 720 or nNumText == 721 then    -- �ػ�һ�
			if nNumText > 500 then
				nLevel = 5
			end
			if nNumText == 610 then 
				nLevel = 13
                    end
                    if nNumText == 620 then 
				nLevel = 14
			end
                    if nNumText == 630 then 
				nLevel = 15
                    end
                    if nNumText == 640 then 
				nLevel = 16
			end
                    if nNumText == 650 then 
				nLevel = 17
                    end
                    if nNumText == 660 then 
				nLevel = 18
			end
                    if nNumText == 670 then 
				nLevel = 19
                    end
                    if nNumText == 680 then 
				nLevel = 20
			end
                    if nNumText == 690 then 
				nLevel = 21
                    end
                    if nNumText == 699 then 
				nLevel = 22
			end
			if nNumText == 711 or nNumText == 712 or nNumText == 713 or nNumText == 714 or nNumText == 715 then
			    nLevel = 7    -- �˽����
			end
			if nNumText == 721 or nNumText == 722 or nNumText == 723 or nNumText == 724 or nNumText == 725 then
			    nLevel = 8    -- ������
			end
			if nNumText == 731 or nNumText == 732 or nNumText == 733 or nNumText == 734 or nNumText == 735 then
			    nLevel = 9    -- �ɽ����
			end
			if nNumText == 741 or nNumText == 742 or nNumText == 743 or nNumText == 744 or nNumText == 745 then
			    nLevel = 10   -- �������
			end
			if nNumText == 751 or nNumText == 752 or nNumText == 753 or nNumText == 754 or nNumText == 755 then
			    nLevel = 11   -- ������
			end
			if nNumText == 761 or nNumText == 762 or nNumText == 763 or nNumText == 764 or nNumText == 765 then
			    nLevel = 12   -- ħ�����
			end
			
			local szStr = "  Ҫ�����Щװ��������Ҫ���ҡ�" .. x990004_g_StoneList[nLevel].str
										.. "����".. tostring(x990004_g_StoneList[nLevel].num) .. "����  #r  #Gע�⿴װ���ʺ�ʲô���ɣ���Ҫ������Ŷ#W"
			AddText(sceneId, szStr)
			
			for i, item in x990004_g_EquipList do
				if item.n == nNumText  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
    		EndEvent(sceneId)
   	 	--DispatchMissionDemandInfo(sceneId,selfId,targetId, x990004_g_ScriptId, x210200_g_MissionId)
   		DispatchMissionContinueInfo(sceneId,selfId,targetId, x990004_g_ScriptId, 0)		
	end

	if nNumText == 800 then
		BeginEvent(sceneId)
			local bStoneOk = 0
			if GetItemCount(sceneId, selfId, 10421021) >= 1  then
			bStoneOk = 1
			end
			if  bStoneOk == 1 then
				BeginEvent(sceneId)
					strText = "���������������������ظ���ȡ��"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			else 
				TryRecieveItem( sceneId, selfId, 10421021, 1 )
				BeginEvent(sceneId)
					strText = "��ȡ����������"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)				
			end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)		
	end
			
	for i, findId in x990004_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x990004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x990004_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
	for i, findId in g_eventListTest do
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
function x990004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x990004_g_eventList do
		if missionScriptId == findId then
			x990004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x990004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x990004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x990004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x990004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--�����ύ�����ʾ���
	--Ϊ�˰�ȫ������Ҫ��ϸ�����ܳ���
	local nItemIndex = -1
	
	for i, item in x990004_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- ������ǲ��ǹ������ύ
	local nLevel = 0
	if x990004_g_EquipList[nItemIndex].n == 110 then
		nLevel = 1
	end
	if x990004_g_EquipList[nItemIndex].n == 120 then
		nLevel = 2
	end
	if x990004_g_EquipList[nItemIndex].n == 130 then
		nLevel = 3
	end	
--	if x990004_g_EquipList[nItemIndex].n == 610 or x990004_g_EquipList[nItemIndex].n == 611 or x990004_g_EquipList[nItemIndex].n == 612 or x990004_g_EquipList[nItemIndex].n == 613 or x990004_g_EquipList[nItemIndex].n == 614 or x990004_g_EquipList[nItemIndex].n == 615 or x990004_g_EquipList[nItemIndex].n == 616 or x990004_g_EquipList[nItemIndex].n == 617 or x990004_g_EquipList[nItemIndex].n == 618 or x990004_g_EquipList[nItemIndex].n == 619 or x990004_g_EquipList[nItemIndex].n == 620 or x990004_g_EquipList[nItemIndex].n == 621 then
	if x990004_g_EquipList[nItemIndex].n > 400 then	
		nLevel = 4
	end
--	if x990004_g_EquipList[nItemIndex].n == 710 or x990004_g_EquipList[nItemIndex].n == 711 or x990004_g_EquipList[nItemIndex].n == 712 or x990004_g_EquipList[nItemIndex].n == 713 or x990004_g_EquipList[nItemIndex].n == 714 or x990004_g_EquipList[nItemIndex].n == 715 or x990004_g_EquipList[nItemIndex].n == 716 or x990004_g_EquipList[nItemIndex].n == 717 or x990004_g_EquipList[nItemIndex].n == 718 or x990004_g_EquipList[nItemIndex].n == 719 or x990004_g_EquipList[nItemIndex].n == 720 or x990004_g_EquipList[nItemIndex].n == 721 then
	if x990004_g_EquipList[nItemIndex].n > 500 then
		nLevel = 5
	end
	if x990004_g_EquipList[nItemIndex].n == 610 then 
		nLevel = 13
       end
       if x990004_g_EquipList[nItemIndex].n == 620 then 
		nLevel = 14
	end
       if x990004_g_EquipList[nItemIndex].n == 630 then 
		nLevel = 15
       end
       if x990004_g_EquipList[nItemIndex].n == 640 then 
		nLevel = 16
	end
       if x990004_g_EquipList[nItemIndex].n == 650 then 
		nLevel = 17
       end
       if x990004_g_EquipList[nItemIndex].n == 660 then 
		nLevel = 18
	end
       if x990004_g_EquipList[nItemIndex].n == 670 then 
		nLevel = 19
       end
       if x990004_g_EquipList[nItemIndex].n == 680 then 
		nLevel = 20
       end
       if x990004_g_EquipList[nItemIndex].n == 690 then 
		nLevel = 21
       end
       if x990004_g_EquipList[nItemIndex].n == 699 then 
		nLevel = 22
	end
 	if x990004_g_EquipList[nItemIndex].n == 711 or x990004_g_EquipList[nItemIndex].n == 712 or x990004_g_EquipList[nItemIndex].n == 713 or x990004_g_EquipList[nItemIndex].n == 714 or x990004_g_EquipList[nItemIndex].n == 715 then
		nLevel = 7
	end
 	if x990004_g_EquipList[nItemIndex].n == 721 or x990004_g_EquipList[nItemIndex].n == 722 or x990004_g_EquipList[nItemIndex].n == 723 or x990004_g_EquipList[nItemIndex].n == 724 or x990004_g_EquipList[nItemIndex].n == 725 then
		nLevel = 8
	end
 	if x990004_g_EquipList[nItemIndex].n == 731 or x990004_g_EquipList[nItemIndex].n == 732 or x990004_g_EquipList[nItemIndex].n == 733 or x990004_g_EquipList[nItemIndex].n == 734 or x990004_g_EquipList[nItemIndex].n == 735 then
		nLevel = 9
	end
 	if x990004_g_EquipList[nItemIndex].n == 741 or x990004_g_EquipList[nItemIndex].n == 742 or x990004_g_EquipList[nItemIndex].n == 743 or x990004_g_EquipList[nItemIndex].n == 744 or x990004_g_EquipList[nItemIndex].n == 745 then
		nLevel = 10
	end
 	if x990004_g_EquipList[nItemIndex].n == 751 or x990004_g_EquipList[nItemIndex].n == 752 or x990004_g_EquipList[nItemIndex].n == 753 or x990004_g_EquipList[nItemIndex].n == 754 or x990004_g_EquipList[nItemIndex].n == 755 then
		nLevel = 11
	end
 	if x990004_g_EquipList[nItemIndex].n == 761 or x990004_g_EquipList[nItemIndex].n == 762 or x990004_g_EquipList[nItemIndex].n == 763 or x990004_g_EquipList[nItemIndex].n == 764 or x990004_g_EquipList[nItemIndex].n == 765 then
		nLevel = 12
	end
		
	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x990004_g_StoneList[nLevel].id) >= x990004_g_StoneList[nLevel].num  then
		bStoneOk = 1
	end
	
	if  bStoneOk == 0 then
		BeginEvent(sceneId)
			strText = "��û���㹻����Ʒ�����ܻ�ȡװ����"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ����ǲ������㹻��ʯͷ���Կ۳�
	if LuaFnGetAvailableItemCount(sceneId, selfId, x990004_g_StoneList[nLevel].id) < x990004_g_StoneList[nLevel].num   then
		BeginEvent(sceneId)
			strText = "��û���㹻����Ʒ���Ա��۳���������Ʒ�Ƿ�������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
		
	end
	
	-- ��鱳���ռ�
	BeginAddItem(sceneId)
		AddItem(sceneId, selectRadioId, 1)
	local bBagOk = EndAddItem(sceneId, selfId)
	
	if bBagOk < 1 then
		BeginEvent(sceneId)
			strText = "��ı���û�пռ��ˡ�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x990004_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- ɾ����ص�ʯͷ
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x990004_g_StoneList[nLevel].id, x990004_g_StoneList[nLevel].num)
	
	if bDelOk < 1  then
		BeginEvent(sceneId)
			strText = "�۳�ʯͷʧ�ܡ�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		--����Ҷ��������
		-- AddItemListToHuman(sceneId,selfId)
		--
		local nBagIndex = TryRecieveItem( sceneId, selfId, x990004_g_EquipList[nItemIndex].id, 1 );
		
		BeginEvent(sceneId)
			strText = "�һ��ɹ���"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local message;	
		local randMessage = random(3);
		local sItemName = GetItemName(sceneId, x990004_g_EquipList[nItemIndex].id)
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
		   	message = format("#W#{_INFOUSR%s}#W#{WLS_08}#Y%d#W#{WLS_09}#{_INFOMSG%s}#{WLS_10}#{_INFOMSG%s}#{WLS_11}", LuaFnGetName(sceneId, selfId), x990004_g_StoneList[nLevel].num, szTransferStone, szTransferEquip);
		elseif randMessage == 2 then
			message = format("#W#{_INFOUSR%s}#W#{WLS_03}#Y%d#W#{WLS_04}#{_INFOMSG%s}#{WLS_05}#{_INFOMSG%s}#{WLS_06}#{_INFOMSG%s}#{WLS_07}", LuaFnGetName(sceneId, selfId), x990004_g_StoneList[nLevel].num, szTransferStone, szTransferStone, szTransferEquip);
		else
			message = format("#W#{WLS_00}#Y%d#cffffcc��#W#{_INFOMSG%s}#cffffcc���Ե��޵�����#W#{_INFOUSR%s}#{WLS_01}#{_INFOMSG%s}#{WLS_02}", x990004_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
	end

	for i, findId in x990004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x990004_OnDie( sceneId, selfId, killerId )
end
