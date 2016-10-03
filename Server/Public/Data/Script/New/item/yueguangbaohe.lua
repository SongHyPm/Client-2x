--���ߣ�������<ID:30503083>
--�ű��� 889079
--Author: Steven.Han 10:39 2007-06-08

x889079_g_scriptId = 889079
x889079_g_Step = 0

--**********************************
--�¼��������
--**********************************
function x889079_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889079_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889079_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889079_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		
	return 1; --����Ҫ�κ�����������ʼ�շ���1��
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x889079_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end

	return 0;
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x889079_OnActivateOnce( sceneId, selfId )

	local nLevel = GetLevel(sceneId, selfId)

	if (nLevel >= 150) then
          for i = 0,250 do
	     LuaFnAddExp( sceneId, selfId, 100000)
          end
	elseif (nLevel >= 140) then
          for i = 0,250 do
	     LuaFnAddExp( sceneId, selfId, 100000)
          end
	elseif (nLevel >= 130) then
          for i = 0,250 do
	     LuaFnAddExp( sceneId, selfId, 100000)
          end
	elseif (nLevel >= 120) then
          for i = 0,200 do
	     LuaFnAddExp( sceneId, selfId, 100000)
          end
	elseif (nLevel >= 110) then
          for i = 0,180 do
	     LuaFnAddExp( sceneId, selfId, 100000)
          end
	elseif (nLevel >= 90) then
          for i = 0,150 do
	     LuaFnAddExp( sceneId, selfId, 100000)
          end
	elseif (nLevel >= 85) then
          for i = 0,120 do
	     LuaFnAddExp( sceneId, selfId, 100000)
          end
	elseif (nLevel >= 80) then
          for i = 0,100 do
	     LuaFnAddExp( sceneId, selfId, 100000)
          end
	elseif (nLevel >= 70) then
          for i = 0,30 do
	     LuaFnAddExp( sceneId, selfId, 100000)
          end
	elseif (nLevel >= 60) then
          for i = 0,14 do
	     LuaFnAddExp( sceneId, selfId, 100000);
          end
	elseif (nLevel >= 50) then
          for i = 0,8 do
	     LuaFnAddExp( sceneId, selfId, 100000)
          end
	elseif (nLevel >= 30) then
          for i = 0,2 do
	     LuaFnAddExp( sceneId, selfId, 100000)
          end
	elseif (nLevel >= 1) then
          for i = 0,0 do
	     LuaFnAddExp( sceneId, selfId, 100000)
          end
      end

	return 1
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x889079_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x889079_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
