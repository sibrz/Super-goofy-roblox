Set shell = CreateObject("WScript.Shell")
utilisateur = shell.ExpandEnvironmentStrings("%USERNAME%")


dossier = "C:\Users\" & utilisateur & "\AppData\Local\Roblox\ClientSettings"
nomFichier = "ClientAppSettings.json"
cheminFichier = dossier & "\" & nomFichier


Set fso = CreateObject("Scripting.FileSystemObject")
If Not fso.FolderExists(dossier) Then
    fso.CreateFolder(dossier)
End If


fpsCap = 5
taskSchedulerFps = 5
qualityLevel = 1
disableVSync = True
handleAltEnter = True


contenuJson = "{" & vbCrLf & _
              "  ""DFIntDefaultFpsCap"": " & fpsCap & "," & vbCrLf & _
              "  ""DFIntTaskSchedulerTargetFps"": " & taskSchedulerFps & "," & vbCrLf & _
              "  ""DFFlagDisableVSync"": " & LCase(CStr(disableVSync)) & "," & vbCrLf & _
              "  ""DFIntQualityLevel"": " & qualityLevel & "," & vbCrLf & _
              "  ""FFlagHandleAltEnterFullscreenManually"": " & LCase(CStr(handleAltEnter)) & vbCrLf & _
              "}"


Set fichier = fso.CreateTextFile(cheminFichier, True)
fichier.Write contenuJson
fichier.Close


MsgBox "injected dirty roblox script"