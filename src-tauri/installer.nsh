!macro customPageComponents
  Section "KAYRA Belge (PDF Düzenleyici)" SecBelge
    CreateShortCut "$DESKTOP\KAYRA Belge.lnk" "$INSTDIR\KAYRA Suite.exe" "app=belge" "$INSTDIR\resources\belge.ico"
    CreateShortCut "$SMPROGRAMS\KAYRA Belge.lnk" "$INSTDIR\KAYRA Suite.exe" "app=belge" "$INSTDIR\resources\belge.ico"
  SectionEnd

  Section "KAYRA Tuval (Tasarım Stüdyosu)" SecTuval
    CreateShortCut "$DESKTOP\KAYRA Tuval.lnk" "$INSTDIR\KAYRA Suite.exe" "app=tuval" "$INSTDIR\resources\tuval.ico"
    CreateShortCut "$SMPROGRAMS\KAYRA Tuval.lnk" "$INSTDIR\KAYRA Suite.exe" "app=tuval" "$INSTDIR\resources\tuval.ico"
  SectionEnd
!macroend