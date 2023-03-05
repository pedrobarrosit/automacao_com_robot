*** Settings ***
Documentation     Apagar iten do carrinho
Library            SeleniumLibrary    timeout=2000
Resource    chronos.robot

*** Variables ***

${Url}    https://www.demoblaze.com

*** Keywords ***

Adicionar iten ao carrinho
    Open Browser    ${Url}    chrome
  Maximize Browser Window
  Click Link                       Laptops
  Wait Until Element Is Visible    link=MacBook Pro
  Click Link                       link=MacBook Pro 
  Wait Until Element Is Visible    xpath=//div[2]//a
  Click Element                    xpath=//div[2]//a
  Alert Should Be Present

*** Keywords ***

Excluir iten do carrinho
    Click Link    link=Cart
    Wait Until Element Is Visible    link=Delete
    Click Link    link=Delete

*** Test Cases ***
TesteDxcluirCarrinho
    Adicionar iten ao carrinho
    Excluir iten do carrinho