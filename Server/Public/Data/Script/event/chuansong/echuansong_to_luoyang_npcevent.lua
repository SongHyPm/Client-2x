--�¼�
--���͵�L�c D߽ng

--�ű���
x400919_g_ScriptId = 400919

--�����ı�����
x400919_g_MissionName="���m�t �L�c D߽ng��"
x400919_g_MissionInfo="�������꿤��ngLinh����������to� � �ؾ�֮��,��T�i ·�϶���ö�Th�o Nguy�n����, �i�m����ɱ �i�m�ǰ��ǲŸҳ�ȥ�˲���."  --��������
x400919_g_MissionTarget="ɱ��5ֻTh�o Nguy�n��"		--M�c ti�u nhi�m v�
x400919_g_ContinueInfo="���Ѿ�ɱ��5ֻTh�o Nguy�n����?���Ǿ�T�i �����ϱ�,���߾Ϳ�����.С�� �i�m�.���m�t Ⱥ��Χ��������Ͱ�Ϲ��."		--δHo�n t�t nhi�m v�to� � npc�Ի�
x400919_g_MissionComplete="лл�.��������ڸҳ�����"					--Ho�n t�t nhi�m v�npc˵��to� � ��

--**********************************
--��ں���
--**********************************
function x400919_OnDefaultEvent( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0, 159, 240)
end

--**********************************
--�о��¼�
--**********************************
function x400919_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x400919_g_ScriptId,x400919_g_MissionName)
end
