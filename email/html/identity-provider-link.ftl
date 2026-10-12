<#import "template.ftl" as layout>
<@layout.emailLayout badgeType="single-use"; section>
    <#if section = "text">
        <p style="margin:0;">${msg("identityProviderLinkBodyHtml", identityProviderAlias, realmName, identityProviderContext.username, linkExpiration)?no_esc}</p>
    </#if>
    <#if section = "linkText">
        ${msg("identityProviderLinkLinkTextHtml")?no_esc}
    </#if>
</@layout.emailLayout>
