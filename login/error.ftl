<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
        ${msg("errorTitle")}
    <#elseif section = "header">
        ${msg("errorTitleHtml")?no_esc}
    <#elseif section = "back">
        <#if client?? && client.baseUrl?has_content>
            <a class="wz-backbtn" id="backToApplication" href="${client.baseUrl}" aria-label="${msg("backToApplication")}">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" width="16" height="16"><path stroke-linecap="round" stroke-linejoin="round" d="m14 6-6 6 6 6" /></svg>
            </a>
        </#if>
    <#elseif section = "form">
      <div class="wz-stack">
        <div class="wz-alert wz-alert-error" role="alert">
          <svg width="16" height="16" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true"><path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/></svg>
          <span>${message.summary}</span>
        </div>
      </div>
    </#if>
</@layout.registrationLayout>
