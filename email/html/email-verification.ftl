<#import "template.ftl" as layout>
<@layout.htmlEmailLayout badgeType="single-use"; section>
    <#if section = "text">
        <p style="margin:0;">${msg("emailVerificationBodyHtml", realmName, linkExpiration)?no_esc}</p>
    </#if>
    <#if section = "linkText">
        ${msg("emailVerificationLinkTextHtml")?no_esc}
    </#if>
</@layout.htmlEmailLayout>
