<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
    ${message.summary}
    <#elseif section = "header">
    ${message.summary}
    <#elseif section = "back">
    <#elseif section = "form">
      <div class="wz-stack">
        <div class="wz-alert wz-alert-success" role="alert">
          <svg width="16" height="16" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true"><path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/></svg>
          <div>
            <span>${message.summary}</span>
            <#if requiredActions??>
              <ul style="margin-top:8px;padding-left:18px;">
                <#list requiredActions>
                  <#items as reqActionItem><li>${msg("requiredAction.${reqActionItem}")}</li></#items>
                </#list>
              </ul>
            </#if>

            <#if skipLink??>
            <#else>
                <#if pageRedirectUri??>
                  <p style="margin-top:8px;"><a class="wz-link" href="${pageRedirectUri}">${msg("backToApplication")?no_esc}</a></p>
                <#elseif actionUri??>
                  <p style="margin-top:8px;"><a class="wz-link" href="${actionUri}">${msg("proceedWithAction")?no_esc}</a></p>
                <#elseif client.baseUrl??>
                  <p style="margin-top:8px;"><a class="wz-link" href="${client.baseUrl}">${msg("backToApplication")?no_esc}</a></p>
                </#if>
            </#if>
          </div>
        </div>

        <#if client?? && client.baseUrl?has_content>
          <p class="wz-alt">
            <a class="wz-link" href="${client.baseUrl}">${msg("backToApplication")}</a>
          </p>
        </#if>
      </div>
    </#if>
</@layout.registrationLayout>
