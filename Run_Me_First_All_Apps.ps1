cd D:\New_Project\Apps

#Change power and lid to do nothing and Never
powercfg /x -hibernate-timeout-ac 0

powercfg /x -hibernate-timeout-dc 0

powercfg /x -disk-timeout-ac 0

powercfg /x -disk-timeout-dc 0

powercfg /x -monitor-timeout-ac 0

powercfg /x -monitor-timeout-dc 0

Powercfg /x -standby-timeout-ac 0

powercfg /x -standby-timeout-dc 0
powercfg -setacvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
powercfg -setdcvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
#Install 7 applicatoins silently, reboot is required after AV install 
Start-Sleep -s 15
Start-Process msiexec.exe -Wait -ArgumentList '/I googlechromestandaloneenterprise64.msi /quiet'
Start-Sleep -s 20
Start-Process -FilePath D:\New_Project\Apps\AcroRdrDC2100120140_en_US.exe -Wait -ArgumentList "/I AcroRdrDC2100120140_en_US.exe /quiet /sAll /rs /msi EULA_ACCEPT=YES"
Start-Sleep -s 20
Start-Process -FilePath D:\New_Project\Apps\New_Setup_IMA_Medical_Group.msi -Wait -ArgumentList '/qn'
Start-Sleep -s 20
Start-Process -FilePath D:\New_Project\Apps\FortiClientVPN.exe  -Wait -ArgumentList '/quiet /norestart'
Start-Sleep -s 60
Start-Process -FilePath "D:\New_Project\Apps\184-005968-00_Rev_A_GVCSetup64.exe"  -Wait -ArgumentList '/Q'
Start-Sleep -s 40
Start-Process -FilePath "D:\New_Project\Apps\Spiceworks Agent.msi"  -Wait -ArgumentList '/q /l*v c:\spiceworksinstall.log SPICEWORKS_SERVER="IP to Server" SPICEWORKS_AUTH_KEY="Base64 passsword after login" SPICEWORKS_PORT="444" ADDLOCAL=FeatureService,FeatureTray /norestart'
start-sleep -s 20 
Start-Process -FilePath "D:\New_Project\Apps\Apex1_Agent_Installer_Modifiedv2.msi"  -Wait -ArgumentList '/quiet'
start-sleep -s 20 
echo " 7/7 Apps installed. Restart Computer and verify in Control Panel"
