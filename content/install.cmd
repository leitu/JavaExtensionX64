
::::::::::::::::::::::::::::::::::::::::
:: Setup
:: ----------------

set JAVA_AZURE=jdk1.8.0_111
set JAVA_LOCATION=%ProgramFiles%\Java\%JAVA_AZURE%
set HOME_BIN=%HOME%\site\wwwroot\bin

:: Copy Java

If NOT EXIST %HOME_BIN% (
  mkdir %HOME_BIN%
    )

cp -r "%JAVA_LOCATION%" "%HOME_BIN%"

:: Update JCE
cp -r UnlimitedJCEPolicyJDK8\US_export_policy.jar "%HOME_BIN%\%JAVA_AZURE%\jre\lib\security"

cp -r UnlimitedJCEPolicyJDK8\local_policy.jar "%HOME_BIN%\%JAVA_AZURE%\jre\lib\security"

:: Place Web.conf
cp web.config "%HOME%\site\wwwroot"

:: Place Tomcat
cp -r apache-tomcat-8.0.43 "%HOME_BIN%"

:: Cleanup
rm -rf UnlimitedJCEPolicyJDK8
rm -rf web.config
rd /q /s apache-tomcat-8.0.43

:: End
goto end

:error
echo An error has occured during web site deployment.
exit /b 1

:end
echo Finished successfully.
