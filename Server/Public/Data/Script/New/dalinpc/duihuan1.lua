-- 990002 ��װ�һ�NPC


--�ű���
x990002_g_ScriptId = 990002

--��ӵ�е��¼�ID�б�
x990002_g_eventList={}

x990002_g_EquipList={	
-- �ɻ�ʯ
{n=110,id=10433311},{n=120,id=10433312},

-- ÷����
{n=130,id=10433317},{n=140,id=10433318},

-- ��������
{n=150,id=10433314},{n=160,id=10433315},

-- ���
{n=410,id=10433320},{n=411,id=10433321},{n=412,id=10433322},{n=413,id=10433323},{n=414,id=10433425},
{n=415,id=10433426},{n=416,id=10433427},{n=417,id=10433428},{n=418,id=10433429},{n=419,id=10433430},

-- 85���ػ���
{n=510,id=10400075},{n=511,id=10402075},{n=512,id=10404072},{n=513,id=10405071},{n=514,id=10412081},
{n=515,id=10412083},{n=516,id=10413084},{n=517,id=10413086},{n=518,id=10422122},{n=519,id=10422124},
{n=520,id=10423047},{n=521,id=10423049},

--����֮�� 
{n=610,id=30505085},{n=620,id=30505086},{n=630,id=30505087},{n=640,id=30505088},{n=650,id=30505089},
{n=660,id=30505091},

--�������
{n=711,id=10433306},{n=712,id=10433321},{n=713,id=10433336},{n=714,id=10433345},{n=715,id=10433327},
{n=721,id=10433307},{n=722,id=10433322},{n=723,id=10433337},{n=724,id=10433328},{n=725,id=10433346}, 
{n=731,id=10433309},{n=732,id=10433324},{n=733,id=10433339},{n=734,id=10433348},{n=735,id=10433330},
{n=741,id=10433308},{n=742,id=10433323},{n=743,id=10433338},{n=744,id=10433347},{n=745,id=10433329},
{n=751,id=10433305},{n=752,id=10433320},{n=753,id=10433335},{n=754,id=10433344},{n=755,id=10433326},
{n=761,id=10433304},{n=762,id=10433319},{n=763,id=10433334},{n=764,id=10433343},{n=765,id=10433325},

}

x990002_g_StoneList={
-- �ɻ�ʯ���գ�
{n=1,id=10433310,num=10,str="�ɻ�ʯ���գ�"},
-- �ɻ�ʯ���У�
{n=2,id=10433311,num=10,str="�ɻ�ʯ���У�"},
-- ÷���ڣ��գ�
{n=3,id=10433316,num=10,str="÷���ڣ��գ�"},
-- ÷���ڣ��У�
{n=4,id=10433317,num=10,str="÷���ڣ��У�"},
-- �������루�գ�
{n=5,id=10433313,num=10,str="�������루�գ�"},
-- �������루�У�
{n=6,id=10433314,num=10,str="�������루�У�"},
-- �������루�ߣ�
{n=7,id=10433315,num=5,str="�������루�ߣ�"},
-- �������루�ߣ�
{n=8,id=10433315,num=5,str="�������루�ߣ�"},

}

--**********************************
--�¼��б�
--**********************************
function x990002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  #gFF3E96�������Źٷ�����������¥���ر�������")
		for i, eventId in x990002_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end

		--AddNumText( sceneId, x990002_g_ScriptId, "#gFF3E96�һ�����", 3, 100 )
		--AddNumText( sceneId, x990002_g_ScriptId, "#gFF3E96�һ����", 3, 400 )
		AddNumText( sceneId, x990002_g_ScriptId, "#gFF3E96��꼼������", 3, 300 )
		AddNumText( sceneId, x990002_g_ScriptId, "�뿪����", 13, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x990002_OnDefaultEvent( sceneId, selfId,targetId )
	x990002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x990002_OnEventRequest( sceneId, selfId, targetId, eventId )
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
			AddText(sceneId, "  �������˵�������Ǹ��󸱱���BOSS��������總�ӱ��乥������總�ӻ��乥����ħ�總�����乥�������總��ʧ��״̬���ɽ總�����������������Ч�����˽總��ʯ��״̬��ʯ���󲻿ɱ������������乥����������20%��ʧ����ʯ������2%���뿴�����ú�ѡ���������������ֻ�ں�����1Сʱ�ڿ��Ŷһ�")		
	end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	if nNumText == 100 or nNumText == 200 or nNumText == 300 or nNumText == 400 or nNumText == 500 or nNumText == 600 or nNumText == 700 or nNumText == 710 or nNumText == 720 or nNumText == 730 or nNumText == 740 or nNumText == 750 or nNumText == 760 then
		BeginEvent(sceneId)
			AddText(sceneId, "  ��ѡ��һ����Ҫ�һ�����Ʒ��")
			if nNumText == 100 then
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ��ɻ�ʯ���У�", 1, nNumText+10)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ��ɻ�ʯ���ߣ�", 1, nNumText+20)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ�÷���ڣ��У�", 1, nNumText+30)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ�÷���ڣ��ߣ�", 1, nNumText+40)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ��������루�У�", 1, nNumText+50)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ��������루�ߣ�", 1, nNumText+60)
			end
			if nNumText == 200 then
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96��ȡ�ɻ�ʯ״̬����˯��", 1, nNumText+10)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96��ȡ÷����״̬��ʧ����", 1, nNumText+11)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96��ȡ��������״̬���־壩", 1, nNumText+12)
			end
			if nNumText == 300 then
   		--AddNumText( sceneId, x990002_g_ScriptId, "#gFF3E96��ȡ����״̬", 1, 200)
			--AddNumText( sceneId, x990002_g_ScriptId, "#gFF3E96��ȡ���״̬", 1, 500)
			AddNumText( sceneId, x990002_g_ScriptId, "#gFF3E96��ȡ��꼼��", 1, 600)
			end
			if nNumText == 400 then
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ���Ҥ��[��]", 1, nNumText+10)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ���Ҥ��[��]", 1, nNumText+11)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ���Ҥ��[��]", 1, nNumText+12)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ���Ҥ��[��]", 1, nNumText+13)
			--AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ����񻰡��ػ�", 1, nNumText+14)
			--AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ����񻰡�֮��", 1, nNumText+15)
			--AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ����񻰡�����", 1, nNumText+16)
			--AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ����񻰡�֮��", 1, nNumText+17)
			--AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ����񻰡�����", 1, nNumText+18)
			--AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96�һ����񻰡�������", 1, nNumText+19)
			end
			if nNumText == 500 then
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96��ȡ��Ҥ��[��]����", 1, nNumText+10)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96��ȡ��Ҥ��[��]����", 1, nNumText+11)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96��ȡ��Ҥ��[��]����", 1, nNumText+12)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96��ȡ��Ҥ��[��]����", 1, nNumText+13)

			end				
			if nNumText == 600 then
   			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96ѧϰ�綾����[��]����", 1, nNumText+10)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96ѧϰ�����ԭ[��]����", 1, nNumText+11)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96ѧϰ��������[��]����", 1, nNumText+12)
			AddNumText(sceneId, x990002_g_ScriptId, "#gFF3E96ѧϰ�����콵[��]����", 1, nNumText+13)
			end
			if nNumText == 700 then
   			AddNumText( sceneId, x990002_g_ScriptId, "����������˽����", 1, 710)
			AddNumText( sceneId, x990002_g_ScriptId, "���������������", 1, 720)
			AddNumText( sceneId, x990002_g_ScriptId, "����������������", 1, 730)
			AddNumText( sceneId, x990002_g_ScriptId, "����������ɽ����", 1, 740)
			AddNumText( sceneId, x990002_g_ScriptId, "���������������", 1, 750)
			AddNumText( sceneId, x990002_g_ScriptId, "���������ħ�����", 1, 760)
			end	
			if nNumText == 710 then      -- �˽� 
   			AddNumText( sceneId, x990002_g_ScriptId, "�����������а������", 1, nNumText+1)
			AddNumText( sceneId, x990002_g_ScriptId, "���������̫�顾����", 1, nNumText+2)
			AddNumText( sceneId, x990002_g_ScriptId, "�����������ũ������", 1, nNumText+3)
			AddNumText( sceneId, x990002_g_ScriptId, "���������ִ�����", 1, nNumText+4)
			AddNumText( sceneId, x990002_g_ScriptId, "����������̹š�����", 1, nNumText+5)
			end	
			if nNumText == 720 then      -- ��� 
      		AddNumText( sceneId, x990002_g_ScriptId, "�����������Ӱ����", 1, nNumText+1)
			AddNumText( sceneId, x990002_g_ScriptId, "������������졾��", 1, nNumText+2)
			AddNumText( sceneId, x990002_g_ScriptId, "����������η衾��", 1, nNumText+3)
			AddNumText( sceneId, x990002_g_ScriptId, "�����������������", 1, nNumText+4)
			AddNumText( sceneId, x990002_g_ScriptId, "������������ޡ���", 1, nNumText+5)
			end	
			if nNumText == 730 then      -- �ɽ� 
      		AddNumText( sceneId, x990002_g_ScriptId, "������������졾ʥ��", 1, nNumText+1)
			AddNumText( sceneId, x990002_g_ScriptId, "�����������Ԫ��ʥ��", 1, nNumText+2)
			AddNumText( sceneId, x990002_g_ScriptId, "����������ϵ硾ʥ��", 1, nNumText+3)
			AddNumText( sceneId, x990002_g_ScriptId, "���������Ǭ����ʥ��", 1, nNumText+4)
			AddNumText( sceneId, x990002_g_ScriptId, "���������̫����ʥ��", 1, nNumText+5)
			end	
			if nNumText == 740 then      -- ���� 
      		AddNumText( sceneId, x990002_g_ScriptId, "����������ɻ꡾�硿", 1, nNumText+1)
			AddNumText( sceneId, x990002_g_ScriptId, "�����������ˡ��硿", 1, nNumText+2)
			AddNumText( sceneId, x990002_g_ScriptId, "����������ۺޡ��硿", 1, nNumText+3)
			AddNumText( sceneId, x990002_g_ScriptId, "������������񡾷硿", 1, nNumText+4)
			AddNumText( sceneId, x990002_g_ScriptId, "������������𡾷硿", 1, nNumText+5)
			end	
			if nNumText == 750 then      -- ��� 
      		AddNumText( sceneId, x990002_g_ScriptId, "����������쾧��ˮ��", 1, nNumText+1)
			AddNumText( sceneId, x990002_g_ScriptId, "������������ˮ��", 1, nNumText+2)
			AddNumText( sceneId, x990002_g_ScriptId, "������������¡�ˮ��", 1, nNumText+3)
			AddNumText( sceneId, x990002_g_ScriptId, "������������衾ˮ��", 1, nNumText+4)
			AddNumText( sceneId, x990002_g_ScriptId, "�����������緡�ˮ��", 1, nNumText+5)
			end	
			if nNumText == 760 then      -- ħ�� 
      		AddNumText( sceneId, x990002_g_ScriptId, "������������ǡ��ס�", 1, nNumText+1)
			AddNumText( sceneId, x990002_g_ScriptId, "����������������ס�", 1, nNumText+2)
			AddNumText( sceneId, x990002_g_ScriptId, "����������Ƶء��ס�", 1, nNumText+3)
			AddNumText( sceneId, x990002_g_ScriptId, "�����������ŭ���ס�", 1, nNumText+4)
			AddNumText( sceneId, x990002_g_ScriptId, "������������ޡ��ס�", 1, nNumText+5)
			end																			
			AddNumText( sceneId, x990002_g_ScriptId, "�뿪����", 0, 0 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText == 210 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10433312) >= 1  then
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
			--AddSkill( sceneId, selfId, 1600 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5974, 0 )	
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText == 211 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10433318) >= 1  then
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
			--AddSkill( sceneId, selfId, 1620 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5975, 0 )	
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText == 212 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10433315) >= 1  then
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
			--AddSkill( sceneId, selfId, 27 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5976, 0 )	
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end		

	if nNumText == 510 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10433320) >= 1  then
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
			--AddSkill( sceneId, selfId, 27 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5988, 0 )
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
	
	if nNumText == 511 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10433321) >= 1  then
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
			--AddSkill( sceneId, selfId, 27 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5986, 0 )
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText == 512 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10433322) >= 1  then
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
			--AddSkill( sceneId, selfId, 27 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5985, 0 )
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText == 513 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10433323) >= 1  then
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
			--AddSkill( sceneId, selfId, 27 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5987, 0 )
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	if nNumText == 610 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10433320) >= 1  then
			bStoneOk = 1
		end
		
		if  bStoneOk == 0 then
			BeginEvent(sceneId)
				strText = "��û�д˵��ߣ�����ѧϰ�˼��ܡ�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else 
			AddSkill( sceneId, selfId, 1614 )
			--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5988, 0 )
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
	
	if nNumText == 611 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10433321) >= 1  then
			bStoneOk = 1
		end
		
		if  bStoneOk == 0 then
			BeginEvent(sceneId)
				strText = "��û�д˵��ߣ�����ѧϰ�˼��ܡ�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else 
			AddSkill( sceneId, selfId, 1601 )
			--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5986, 0 )
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText == 612 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10433322) >= 1  then
			bStoneOk = 1
		end
		
		if  bStoneOk == 0 then
			BeginEvent(sceneId)
				strText = "��û�д˵��ߣ�����ѧϰ�˼��ܡ�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else 
			AddSkill( sceneId, selfId, 1600 )
			--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5985, 0 )
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText == 613 then
		BeginEvent(sceneId)
		local bStoneOk = 0
		if GetItemCount(sceneId, selfId, 10433323) >= 1  then
			bStoneOk = 1
		end
		
		if  bStoneOk == 0 then
			BeginEvent(sceneId)
				strText = "��û�д˵��ߣ�����ѧϰ�˼��ܡ�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else 
			AddSkill( sceneId, selfId, 1612 )
			--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5987, 0 )
		end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end				
				
	if nNumText > 100 and nNumText < 800  then
		BeginEvent(sceneId)
			AddText(sceneId, "  ���ǰ׸��ģ����������������Ŷ����")
			
			local nLevel = 0
			if nNumText == 110 then    -- �һ��ɻ�ʯ
				nLevel = 1
			end
			if nNumText == 120 then    -- �һ��ɻ�ʯ
				nLevel = 2
			end
			if nNumText == 130 then    -- �һ�÷����
				nLevel = 3
			end	
			if nNumText == 140 then    -- �һ�÷����
				nLevel = 4
			end						
			if nNumText == 150 then    -- �һ���������
				nLevel = 5
			end	
			if nNumText == 160 then    -- �һ���������
				nLevel = 6
			end	
			if nNumText == 410 or nNumText == 411 or nNumText == 412 or nNumText == 413 then
				nLevel = 7
			end	
						
			if nNumText > 400 then
				nLevel = 8
			end
			
			local szStr = "  Ҫ�����Щװ��������Ҫ���ҡ�" .. x990002_g_StoneList[nLevel].str
										.. "����".. tostring(x990002_g_StoneList[nLevel].num) .. "����  #r  #Gע�⿴װ���ʺ�ʲô���ɣ���Ҫ������Ŷ#W"
			AddText(sceneId, szStr)
			
			for i, item in x990002_g_EquipList do
				if item.n == nNumText  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
    		EndEvent(sceneId)
   	 	--DispatchMissionDemandInfo(sceneId,selfId,targetId, x990002_g_ScriptId, x210200_g_MissionId)
   		DispatchMissionContinueInfo(sceneId,selfId,targetId, x990002_g_ScriptId, 0)		
	end

	if nNumText == 800 then
		BeginEvent(sceneId)
			local bStoneOk = 0
			if GetItemCount(sceneId, selfId, 10421021) >= 1  then
			bStoneOk = 1
			end
			if  bStoneOk == 1 then
				BeginEvent(sceneId)
					strText = "�����д˵��ߣ������ظ���ȡ��"
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
			
	for i, findId in x990002_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x990002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x990002_g_eventList do
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
function x990002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x990002_g_eventList do
		if missionScriptId == findId then
			x990002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x990002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x990002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x990002_g_eventList do
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
function x990002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--�����ύ�����ʾ���
	--Ϊ�˰�ȫ������Ҫ��ϸ�����ܳ���
	local nItemIndex = -1
	
	for i, item in x990002_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- ������ǲ��ǹ������ύ
	local nLevel = 0
	if x990002_g_EquipList[nItemIndex].n > 100 then
		nLevel = 1
	end
	if x990002_g_EquipList[nItemIndex].n > 110 then
		nLevel = 2
	end
	if x990002_g_EquipList[nItemIndex].n > 120 then
		nLevel = 3
	end	
	if x990002_g_EquipList[nItemIndex].n > 130 then	
		nLevel = 4
	end
	if x990002_g_EquipList[nItemIndex].n > 140 then
		nLevel = 5
	end
	if x990002_g_EquipList[nItemIndex].n > 150 then
		nLevel = 6
	end
	if x990002_g_EquipList[nItemIndex].n > 160 then
		nLevel = 7
	end
		
	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x990002_g_StoneList[nLevel].id) >= x990002_g_StoneList[nLevel].num  then
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
	if LuaFnGetAvailableItemCount(sceneId, selfId, x990002_g_StoneList[nLevel].id) < x990002_g_StoneList[nLevel].num   then
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
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x990002_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- ɾ����ص�ʯͷ
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x990002_g_StoneList[nLevel].id, x990002_g_StoneList[nLevel].num)
	
	if bDelOk < 1  then
		BeginEvent(sceneId)
			strText = "�۳���Ʒʧ�ܡ�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		--����Ҷ��������
		-- AddItemListToHuman(sceneId,selfId)
		--
		local nBagIndex = TryRecieveItem( sceneId, selfId, x990002_g_EquipList[nItemIndex].id, 1 );
		
		BeginEvent(sceneId)
			strText = "�һ��ɹ���"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local message;	
		local randMessage = random(3);
		local sItemName = GetItemName(sceneId, x990002_g_EquipList[nItemIndex].id)
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
		   	message = format("#W#{_INFOUSR%s}#W#{WLS_08}#Y%d#W#{WLS_09}#{_INFOMSG%s}#{WLS_10}#{_INFOMSG%s}#{WLS_11}", LuaFnGetName(sceneId, selfId), x990002_g_StoneList[nLevel].num, szTransferStone, szTransferEquip);
		elseif randMessage == 2 then
			message = format("#W#{_INFOUSR%s}#W#{WLS_03}#Y%d#W#{WLS_04}#{_INFOMSG%s}#{WLS_05}#{_INFOMSG%s}#{WLS_06}#{_INFOMSG%s}#{WLS_07}", LuaFnGetName(sceneId, selfId), x990002_g_StoneList[nLevel].num, szTransferStone, szTransferStone, szTransferEquip);
		else
			message = format("#W#{WLS_00}#Y%d#cffffcc��#W#{_INFOMSG%s}#cffffcc���Ե��޵�����#W#{_INFOUSR%s}#{WLS_01}#{_INFOMSG%s}#{WLS_02}", x990002_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
	end

	for i, findId in x990002_g_eventList do
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
function x990002_OnDie( sceneId, selfId, killerId )
end
