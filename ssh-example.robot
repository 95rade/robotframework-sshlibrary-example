*** Settings ***
Library         SSHLibrary
Suite Setup     open_connection_and_login
Suite Teardown  Close All Connections

*** Variables ***
${HOST}      host
${USERNAME}  login
${PASSWORD}  password

*** Test Cases ***
available_disk_on_remote
    ${output}=  Execute Command  df -hT /home
    log to console  ${\n}${output}

put_file_on_remote_machine
    # GIVEN
    file should not exist  /tmp/ssh-example.robot
    # WHEN
    put file  ssh-example.robot  /tmp
    # THEN
    file should exist  /tmp/ssh-example.robot
    [Teardown]  Execute Command  rm /tmp/ssh-example.robot

*** Keywords ***
open_connection_and_login
    Open Connection  ${HOST}
    Login  ${USERNAME}  ${PASSWORD}