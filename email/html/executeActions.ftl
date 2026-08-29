<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>

    <#if section = "text">
      <p style="color: #666">${msg("executeActionsBodyHtml", link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration), emailVerificationLinkTextHtml)?no_esc}<p>
    </#if>
<#--    <#if section = "linkText">-->
<#--      -->
<#--    </#if>-->
</@layout.htmlEmailLayout>
