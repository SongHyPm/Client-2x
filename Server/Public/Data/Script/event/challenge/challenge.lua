-- challenge.lua
-- Khi�u chi�n��ؽű�

x806010_g_ScriptId = 806010

-- �жϸ������ng��T�i Khi�u chi�n����
function x806010_HaveChallengeFlag( sceneId, selfId )
	return (GetMissionData( sceneId, selfId, MD_TIAOZHAN_SCRIPT ) > 0)
end

-- �� selfId (������) Khi�u chi�n targetId (������)
function x806010_ProcChallenge( sceneId, selfId, targetId )
	local ChallengeScript = GetMissionData( sceneId, selfId, MD_TIAOZHAN_SCRIPT )

	if ChallengeScript ~= GetMissionData( sceneId, targetId, MD_TIAOZHAN_SCRIPT ) then
		return
	end

	-- ���þ���to� � Khi�u chi�n�ű�,ÿc�i��̨Ӧ�ð�m�t c�i�ű�
	CallScriptFunction(ChallengeScript, "DoChallenge", sceneId, selfId, targetId )
end
