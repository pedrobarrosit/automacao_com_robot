*** Settings ***
Documentation    Robot Framework Test
Library        SeleniumLibrary    timeout=2000

*** Variables ***

${Url}    https://www.demoblaze.com

*** Keywords ***
Adicionar item no carrinho
    Open Browser      ${Url}      chrome
  Maximize Browser Window
  Click Link                       Laptops
  Wait Until Element Is Visible    link=MacBook Pro
  Click Link                       link=MacBook Pro 
  Wait Until Element Is Visible    xpath=//div[2]//a
  Click Element                    xpath=//div[2]//a
  Alert Should Be Present

*** Keywords ***
Finalizar compra
  Click Link                       Cart
  Click Button                     css=.btn-success
  Wait Until Element Is Visible    id=name
  Input Text                       id=name    Pedro Barros
  Input Text                       id=country    Brasil
  Input Text                       id=city     Paulista
  Input Text                       id=card    12345678910
  Input Text                       id=month    02
  Input Text                       id=year    2025    
  Click Button                     xpath=//button[text()='Purchase']
  Element Text Should Be           css=.sweet-alert > h2    Thank you for your purchase!
  Click Button                     css=.confirm



*** Test Cases ***
ChronosTest
    Adicionar item no carrinho
    Finalizar compra
  
 

