--����: �� �i�mƱ1W<ID:39910001>
--�ű��� 100001
--Author: Steven.Han 10:39 2007-06-08

x100001_g_scriptId = 100001
--**********************************
--�¼��������
--**********************************
function x100001_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ��C�n C�i n�y �ӿ�,��Ҫ�����պ���
end

--**********************************
--C�i n�y ��Ʒto� � ʹ�ù�����ng�������ڼ���: 
--H� th�ng��T�i ִ�п�ʼʱ���C�i n�y ����to� � Tr� v�ֵ,���Tr� v�th�t b�i����Ժ���to� � ���Ƽ���to� � ִ�С�
--Tr� v�1: ��������to� � ��Ʒ,���Լ������Ƽ���to� � ִ�У�Tr� v�0: ���Ժ���to� � ������
--**********************************
function x100001_IsSkillLikeScript( sceneId, selfId)
	return 1; --C�i n�y �ű�C�n ����֧��
end

--**********************************
--ֱ��H�y b�Ч��: 
--H� th�ng��ֱ�ӵ���C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ�С�
--Tr� v�1: �Ѿ�H�y b���ӦЧ��,����ִ�к���������Tr� v�0: û�м�⵽���Ч��,����ִ�С�
--**********************************
function x100001_CancelImpacts( sceneId, selfId )
	return 0; --��C�n C�i n�y �ӿ�,��Ҫ�����պ���,����ʼ��Tr� v�0��
end

--**********************************
--����������: 
--H� th�ng��T�i ���ܼ��to� � ʱ�� �i�m����C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ�С�
--Tr� v�1: �������ͨ��,���Լ���ִ�У�Tr� v�0: �������th�t b�i,�жϺ���ִ�С�
--**********************************
function x100001_OnConditionCheck( sceneId, selfId )
	--У��ʹ��to� � ��Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		
	return 1; --��C�n �κ�����,����ʼ��Tr� v�1��
end

--**********************************
--���ļ�⼰�������: 
--H� th�ng��T�i ��������to� � ʱ�� �i�m����C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ�С�
--Tr� v�1: ���Ĵ���ͨ��,���Լ���ִ�У�Tr� v�0: ���ļ��th�t b�i,�жϺ���ִ�С�
--ע��: �ⲻ�⸺������to� � ���Ҳ��������to� � ִ�С�
--**********************************
function x100001_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end

	return 0;
end

--**********************************
--ֻ��ִ��m�t �����: 
--������˲�����ܻ�T�i ������ɺ����C�i n�y �ӿ�(�����������Ҹ���������Th�a m�nto� � ʱ��),������
--����Ҳ��T�i ������ɺ����C�i n�y �ӿ�(����to� � m�t ��ʼ,���ĳɹ�ִ��֮��)��
--Tr� v�1: ����ɹ���Tr� v�0: ����th�t b�i��
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x100001_OnActivateOnce( sceneId, selfId )
    local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
	SetHumanMenpaiPoint(sceneId, selfId, nMenpaiPoint + (1000))
    x100001_ShowNotice( sceneId, selfId, "Th�nh c�ng  gia t�ng "..(ZengDianPerAct).." DMP." )
	return 1;
end

--**********************************
--���������������: 
--�������ܻ�T�i ÿ����������ʱ����C�i n�y �ӿڡ�
--Tr� v�: 1�����´�������0: �ж�������
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x100001_OnActivateEachTick( sceneId, selfId)
	return 1; --����ng�����Խű�, ֻ�����պ���.
end

function x100001_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
