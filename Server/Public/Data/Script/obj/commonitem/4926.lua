--ע��: 

--��Ʒ����to� � �߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--������ng�ű�����:


--4926.lua
------------------------------------------------------------------------------------------
--m�t ����Ʒto� � Ĭ�Ͻű�

--�ű���
x334926_g_scriptId = 334926 --��ʱдC�i n�y ,������to� � ʱ��m�t ��Ҫ��.

--C�n to� � ��c�p

--**********************************
--�¼��������
--**********************************
function x334926_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ��C�n C�i n�y �ӿ�,��Ҫ�����պ���

	if sceneId and selfId and bagIndex then
		local selfGUID = LuaFnGetGUID(sceneId, selfId);
		local targetGUID = GetBagItemParam(sceneId, selfId, bagIndex, 0, 2);
		if selfGUID and targetGUID then
			BeginEvent(sceneId);
				if selfGUID == targetGUID then
					AddText(sceneId, "��Ϊ������to� � �������.ƾ�˿��Բμ�C�a ng߽i ����,�췢��C�a ng߽i ���Ѱ�.");
				else
					local ret, targetName = LuaFnGetItemCreator(sceneId, selfId, bagIndex);
					if ret and targetName and ret == 1 then
						AddText(sceneId, "��Ϊ"..targetName.."�� ��a cho ��to� � ����.����ƾ������ȥ#GL�c D߽ng(177,94)#Rϲ����#W���μӻ���.#rT�i �������ǰ, c� th� � ����᳡����ϲ�����������m�t ���ƷŶ.");
					else
						AddText(sceneId, "��Ϊδ֪��ɫ�� ��a cho ��to� � ����.����ƾ�˲μӻ���,�� �i�m�������֮������������m�t �.");
					end
				end
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, selfId);
		end
	end
end

--**********************************
--C�i n�y ��Ʒto� � ʹ�ù�����ng�������ڼ���: 
--H� th�ng��T�i ִ�п�ʼʱ���C�i n�y ����to� � Tr� v�ֵ,���Tr� v�th�t b�i����Ժ���to� � ���Ƽ���to� � ִ��.
--Tr� v�1: ��������to� � ��Ʒ,���Լ������Ƽ���to� � ִ�У�Tr� v�0: ���Ժ���to� � ����.
--**********************************
function x334926_IsSkillLikeScript( sceneId, selfId)
	return 0; --C�i n�y �ű�C�n ����֧��
end

--**********************************
--ֱ��Hu� b�Ч��: 
--H� th�ng��ֱ�ӵ���C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: �Ѿ�Hu� b���ӦЧ��,����ִ�к���������Tr� v�0: û�м�⵽���Ч��,����ִ��.
--**********************************
function x334926_CancelImpacts( sceneId, selfId )
	return 0; --��C�n C�i n�y �ӿ�,��Ҫ�����պ���,����ʼ��Tr� v�0.
end

--**********************************
--����������: 
--H� th�ng��T�i ���ܼ��to� � ʱ�� �i�m����C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: �������ͨ��,���Լ���ִ�У�Tr� v�0: �������th�t b�i,�жϺ���ִ��.
--**********************************
function x334926_OnConditionCheck( sceneId, selfId )
	return 1; --��C�n �κ�����,����ʼ��Tr� v�1.
end

--**********************************
--���ļ�⼰�������: 
--H� th�ng��T�i ��������to� � ʱ�� �i�m����C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: ���Ĵ���ͨ��,���Լ���ִ�У�Tr� v�0: ���ļ��th�t b�i,�жϺ���ִ��.
--ע��: �ⲻ�⸺������to� � ���Ҳ��������to� � ִ��.
--**********************************
function x334926_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end

--**********************************
--ֻ��ִ��m�t �����: 
--������˲�����ܻ�T�i ������ɺ����C�i n�y �ӿ�(�����������Ҹ���������Th�a m�nto� � ʱ��),������
--����Ҳ��T�i ������ɺ����C�i n�y �ӿ�(����to� � m�t ��ʼ,���ĳɹ�ִ��֮��).
--Tr� v�1: ����ɹ���Tr� v�0: ����th�t b�i.
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x334926_OnActivateOnce( sceneId, selfId )
	return 1;
end

--**********************************
--���������������: 
--�������ܻ�T�i ÿ����������ʱ����C�i n�y �ӿ�.
--Tr� v�: 1�����´�������0: �ж�����.
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x334926_OnActivateEachTick( sceneId, selfId)
	return 1; --����ng�����Խű�, ֻ�����պ���.
end
