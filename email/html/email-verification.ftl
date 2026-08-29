<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
      <h2 style="color: #666">${msg("emailVerificationSubject")}</h2>

      <p style="color: #666">${msg("emailVerificationGreeting")}</p>
      <p style="color: #555">${msg("emailVerificationBodyHtml",realmName, linkExpiration)?no_esc}</p>

    </#if>
    <#if section = "linkText">
      <a href="${link}" style="color:#fff" class="Button"> ${msg("emailVerificationLinkTextHtml")?no_esc}</a>
    </#if>

</@layout.htmlEmailLayout>
