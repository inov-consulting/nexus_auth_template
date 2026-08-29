<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${msg("passwordResetBodyHtml", linkExpiration, realmName)?no_esc}
    </#if>
    <#if section = "linkText">
        <!-- ${msg("passwordResetLinkTextHtml",linkExpiration, realmName)?no_esc} -->
        <a href="${link}" style="color:#fff" class="Button"> ${msg("passwordResetLinkTextHtml",linkExpiration, realmName)?no_esc}</a>
    </#if>
</@layout.htmlEmailLayout>
