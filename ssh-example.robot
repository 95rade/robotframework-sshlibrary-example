*** Settings ***
Library  SSHLibrary

*** Variables ***
${HOST}      locahost
${USERNAME}  login
${PASSWORD}  password

*** Test Cases ***
execute_command
    Open Connection  ${HOST}
    Login  ${USERNAME}  ${PASSWORD}
    ${output}=  Execute Command  df -h
    log to console  ${output}
    [Teardown]  Close All Connections