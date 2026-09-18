<#import "template.ftl" as layout>
<@layout.htmlEmailLayout badgeType="single-use"; section>
    <#if section = "text">
        <p style="margin:0;">${msg("passwordResetBodyHtml", linkExpiration)?no_esc}</p>
    </#if>
    <#if section = "linkText">
        ${msg("passwordResetLinkTextHtml")?no_esc}
    </#if>
</@layout.htmlEmailLayout>
